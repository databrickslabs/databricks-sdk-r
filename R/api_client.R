PRODUCT <- "unknown"
PRODUCT_VERSION <- "0.0.0"

# ApiClient is a constructor for class that performs any operations with
# Databricks REST API and handle a subset of Unified Client Authentication.
.DatabricksClient <- function(profile = NULL, host = NULL, token = NULL, account_id = NULL,
  username = NULL, password = NULL, google_service_account = NULL, google_credentials = NULL,
  azure_workspace_resource_id = NULL, azure_use_msi = NULL, azure_client_secret = NULL,
  azure_client_id = NULL, azure_tenant_id = NULL, azure_environment = NULL, azure_login_app_id = NULL,
  client_id = NULL, client_secret = NULL, config_file = NULL) {
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

  # load_profile returns configuration properties of a well-known configuration
  # file or sensible defaults otherwise.
  load_profile <- function(config_path, profile_name) {
    if (!file.exists(config_file)) {
      # return empty list if no config is there
      return(list())
    }
    # Parse ~/.databrickscfg as the INI file
    parsed_file <- ini::read.ini(config_path)
    profile_exists <- profile_name %in% names(parsed_file)
    if (!profile_exists & profile_name == "DEFAULT") {
      # return empty config in case no default profile found
      return(list())
    }
    if (!profile_exists) {
      rlang::abort(paste("Profile", profile_name, "not found in", config_path), call = rlang::caller_env())
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
    account_id = coalesce(account_id, Sys.getenv("DATABRICKS_ACCOUNT_ID"), from_cli$account_id),
    token = coalesce(token, Sys.getenv("DATABRICKS_TOKEN"), from_cli$token),
    username = coalesce(username, Sys.getenv("DATABRICKS_USERNAME"), from_cli$username),
    password = coalesce(password, Sys.getenv("DATABRICKS_PASSWORD"), from_cli$password),
    client_id = coalesce(client_id, Sys.getenv("DATABRICKS_CLIENT_ID"), from_cli$client_id),
    client_secret = coalesce(client_secret, Sys.getenv("DATABRICKS_CLIENT_SECRET"),
      from_cli$client_secret), google_service_account = coalesce(google_service_account,
      Sys.getenv("DATABRICKS_GOOGLE_SERVICE_ACCOUNT"), from_cli$google_service_account),
    google_credentials = coalesce(google_credentials, Sys.getenv("GOOGLE_CREDENTIALS"),
      from_cli$google_credentials), azure_workspace_resource_id = coalesce(azure_workspace_resource_id,
      Sys.getenv("DATABRICKS_AZURE_RESOURCE_ID"), from_cli$azure_workspace_resource_id),
    azure_use_msi = coalesce(azure_use_msi, Sys.getenv("ARM_USE_MSI"), from_cli$azure_use_msi),
    azure_client_secret = coalesce(azure_client_secret, Sys.getenv("ARM_CLIENT_SECRET"),
      from_cli$azure_client_secret), azure_client_id = coalesce(azure_client_id,
      Sys.getenv("ARM_CLIENT_ID"), from_cli$azure_client_id), azure_tenant_id = coalesce(azure_tenant_id,
      Sys.getenv("ARM_TENANT_ID"), from_cli$azure_tenant_id), azure_environment = coalesce(azure_environment,
      Sys.getenv("ARM_ENVIRONMENT"), from_cli$azure_environment), azure_login_app_id = coalesce(azure_login_app_id,
      Sys.getenv("DATABRICKS_AZURE_LOGIN_APP_ID"), from_cli$azure_login_app_id))

  # IsAzure returns true if client is configured for Azure Databricks
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
    product_info <- paste0(PRODUCT, "/", PRODUCT_VERSION)
    sdk_info <- paste0("databricks-sdk-r", "/", VERSION)

    r_version <- R.Version()
    lang_info <- paste0("r/", r_version$major, ".", r_version$minor)

    os_info <- paste0("os/", tolower(Sys.info()["sysname"]))

    paste(product_info, sdk_info, lang_info, os_info)
  }

  # TODO: add retries as with other SDKs See: client/client.go#L269-L280 in Go SDK
  do <- function(method, path, body = NULL, query = NULL) {
    visitor <- authenticate()
    headers <- visitor()
    if (!is.null(body)) {
      body <- base::Filter(length, body)
      body <- jsonlite::toJSON(body, auto_unbox = TRUE, digits = 22, null = "null")
    }
    url <- paste0(cfg$host, path)
    response <- httr::VERB(method, url,
      httr::add_headers(headers),
      httr::user_agent(user_agent()),
      httr::config(verbose = FALSE, http_version=11),
      httr::accept_json(),
      query = base::Filter(length, query),
      body = body)
    if (httr::http_error(response)) {
      #httr::warn_for_status()
      json <- httr::content(response, as = "parsed", encoding = "UTF-8")
      if (!is.null(json$message)) { # API 2.0 errors
        msg <- paste(json$error_code, json$message, sep = ": ")
      } else if (!is.null(json$error)) { # API 1.2 errors
        msg <- json$error
      } else if (!is.null(json$detail)) { # SCIM API erors
        msg <- json$detail
      } else {
        msg <- paste(json, collapse = " ")
      }
      rlang::abort(msg, call = rlang::caller_env())
    }
    json_string <- httr::content(response, as = "text", encoding = "UTF-8")
    jsonlite::fromJSON(json_string)
  }

  return(list(is_aws = is_aws, is_azure = is_azure, is_gcp = is_gcp, do = do))
}

.api <- .DatabricksClient()
