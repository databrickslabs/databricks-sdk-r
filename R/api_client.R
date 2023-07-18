#' @include version.R
NULL

.productInfo <- tryCatch({
  v <- RStudio.Version()
  c("rstudio", v$long_version)
}, error = function(e) {
  # TODO: check if we can use RSTUDIO_PROJ_NAME as product name
  c("unknown", "0.0.0")
})

#' DatabricksClient is a constructor for class that performs any operations with
#' Databricks REST API and handle a subset of Unified Client Authentication.
#' 
#' @param config_file path to Databricks CLI configuration file. Defaults to ~/.databrickscfg
#' @param profile configuration profile from ~/.databrickscfg. Defaults to DEFAULT
#' @param host URL of Databricks Workspace
#' @param token Personal Access Token
#'
#' @export
DatabricksClient <- function(profile = NULL, host = NULL, token = NULL, config_file = NULL) {
  # coalesce(a, b, c) takes any number of arguments using the ...  ellipsis,
  # loops over them, and returns the first non-null, non-missing, non-empty
  # string. If all arguments are null, missing, or empty, it returns NULL.
  coalesce <- function(...) {
    for (arg in list(...)) {
      if (!is.null(arg) && !is.na(arg) && nzchar(arg)) {
        return(arg)
      }
    }
    return(NULL)
  }

  # simplified INI file parsing to read the contents of ~/.databrickscfg file.
  # this implementation does not yet handle comments.
  parse_ini_file <- function(file_path) {
    ini_data <- list()
    current_section <- ""
    for (line in readLines(file_path)) {
      # Remove leading/trailing whitespace
      line <- trimws(line)
      # Skip empty lines and comments
      if (nchar(line) == 0 || substr(line, 1, 1) == "#")
        next
      # Check for section headers
      if (substr(line, 1, 1) == "[") {
        section <- trimws(substr(line, 2, nchar(line) - 1))
        current_section <- section
        ini_data[[section]] <- list()
        next
      }
      # Split key-value pairs
      parts <- strsplit(line, "=")[[1]]
      key <- trimws(parts[1])
      value <- trimws(parts[2])
      # Store key-value pair in the current section
      ini_data[[current_section]][[key]] <- value
    }
    return(ini_data)
  }

  # load_profile returns configuration properties of a well-known configuration
  # file or sensible defaults otherwise.
  load_profile <- function(config_path, profile_name) {
    if (!file.exists(config_file)) {
      # return empty list if no config is there
      return(list())
    }
    # Parse ~/.databrickscfg as the INI file
    parsed_file <- parse_ini_file(config_path)
    profile_exists <- profile_name %in% names(parsed_file)
    if (!profile_exists & profile_name == "DEFAULT") {
      # return empty config in case no default profile found
      return(list())
    }
    if (!profile_exists) {
      rlang::abort(paste("Profile", profile_name, "not found in", config_path),
        call = rlang::caller_env())
    }
    return(as.list(parsed_file[[profile_name]]))
  }

  config_file <- coalesce(config_file, Sys.getenv("DATABRICKS_CONFIG_FILE"), "~/.databrickscfg")
  profile <- coalesce(profile, Sys.getenv("DATABRICKS_CONFIG_PROFILE"), "DEFAULT")
  from_cli <- load_profile(config_file, profile)

  # cfg is the current unified authentication config of direct parameters,
  # environment variables, and values loaded from ~/.databrickscfg file
  cfg <- list(host = coalesce(host, Sys.getenv("DATABRICKS_HOST"), from_cli$host),
    token = coalesce(token, Sys.getenv("DATABRICKS_TOKEN"), from_cli$token),
    client_id = coalesce(Sys.getenv("DATABRICKS_CLIENT_ID"), from_cli$client_id),
    client_secret = coalesce(Sys.getenv("DATABRICKS_CLIENT_SECRET"), from_cli$client_secret))

  # debug_string iterates over currently resolved configuration and returns a
  # single string with all config key-value pairs that are effective in the
  # current state. Sensitive values are redated. Unlike Go, Python, or Java
  # SDK, this SDK does not distinguish between environment-variable supplied
  # configs.
  debug_string <- function() {
    used <- c()
    sensitive <- c("token", "password", "client_secret", "google_credentials",
      "azure_client_secret")
    for (attr in names(cfg)) {
      value <- cfg[[attr]]
      if (is.null(value)) {
        next
      }
      if (attr %in% sensitive) {
        value <- "***"
      }
      used <- c(used, paste0(attr, "=", value))
    }
    return(paste(used, collapse = ", "))
  }

  # is_azure returns true if client is configured for Azure Databricks
  is_azure <- function() {
    grepl(".azuredatabricks.net", cfg$host)
  }

  # is_gcp returns true if client is configured for GCP
  is_gcp <- function() {
    grepl(".gcp.databricks.com", cfg$host)
  }

  # is_aws returns true if client is configured for AWS
  is_aws <- function() {
    !is_azure() & !is_gcp()
  }

  credential_providers <- list(pat = function() {
    if (is.null(cfg$token)) {
      return(NULL)
    }
    return(function() {
      c(Authentication = paste("Bearer", cfg$token))
    })
  })

  # authenticate follows the semantics of Unified Client Authentication and
  # returns a visitor, that constructs a list of HTTP headers with
  # authentication information. This function assumes that no multi-threading
  # hacks are in place.
  authenticate <- function() {
    if (!is.null(cfg$auth_visitor)) {
      return(cfg$auth_visitor)
    }
    for (auth_type in names(credential_providers)) {
      visitor <- credential_providers[[auth_type]]()
      if (is.null(visitor)) {
        # this auth is not configured
        next
      }
      cfg$auth_type <- auth_type
      cfg$auth_visitor <- visitor
      return(cfg$auth_visitor)
    }
    rlang::abort("cannot configure default credentials", call = rlang::caller_env())
  }

  user_agent <- function() {
    product_info <- paste0(.productInfo[1], "/", .productInfo[2])
    sdk_info <- paste0("databricks-sdk-r", "/", VERSION)

    r_version <- R.Version()
    lang_info <- paste0("r/", r_version$major, ".", r_version$minor)

    os_info <- paste0("os/", tolower(Sys.info()["sysname"]))

    paste(product_info, sdk_info, lang_info, os_info)
  }

  # TODO: add retries as with other SDKs See: client/client.go#L269-L280 in Go
  # SDK
  do <- function(method, path, body = NULL, query = NULL) {
    visitor <- authenticate()
    headers <- visitor()
    headers["Connection"] <- "close"
    if (!is.null(body)) {
      body <- base::Filter(length, body)
      body <- jsonlite::toJSON(body, auto_unbox = TRUE, digits = 22, null = "null")
    }
    url <- paste0(cfg$host, path)
    response <- httr::VERB(method, url, httr::add_headers(headers), httr::user_agent(user_agent()),
      httr::config(verbose = FALSE, connecttimeout = 30), httr::accept_json(),
      httr::write_memory(), query = base::Filter(length, query), body = body)
    if (httr::http_error(response)) {
      # httr::warn_for_status()
      json <- httr::content(response, as = "parsed", encoding = "UTF-8")
      if (!is.null(json$message)) {
        # API 2.0 errors
        msg <- paste(json$error_code, json$message, sep = ": ")
      } else if (!is.null(json$error)) {
        # API 1.2 errors
        msg <- json$error
      } else if (!is.null(json$detail)) {
        # SCIM API erors
        msg <- json$detail
      } else {
        msg <- paste(json, collapse = " ")
      }
      rlang::abort(msg, call = rlang::caller_env())
    }
    json_string <- httr::content(response, as = "text", encoding = "UTF-8")
    jsonlite::fromJSON(json_string)
  }

  return(list(is_aws = is_aws, is_azure = is_azure, is_gcp = is_gcp, do = do, debug_string = debug_string))
}
