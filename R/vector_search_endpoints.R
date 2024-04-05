# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an endpoint.
#' 
#' Create a new endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param endpoint_type Required. Type of endpoint.
#' @param name Required. Name of endpoint.
#'
#'
#' @rdname create_vector_search_endpoint
#' @alias vectorSearchEndpointsCreateEndpoint
#' @export
create_vector_search_endpoint <- function(client, name, endpoint_type) {
  body <- list(endpoint_type = endpoint_type, name = name)
  client$do("POST", "/api/2.0/vector-search/endpoints", body = body)
}

#' @rdname create_vector_search_endpoint
#' @export 
vectorSearchEndpointsCreateEndpoint <- create_vector_search_endpoint
#' Delete an endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param endpoint_name Required. Name of the endpoint.
#'
#'
#' @rdname delete_vector_search_endpoint
#' @alias vectorSearchEndpointsDeleteEndpoint
#' @export
delete_vector_search_endpoint <- function(client, endpoint_name) {

  client$do("DELETE", paste("/api/2.0/vector-search/endpoints/", endpoint_name,
    sep = ""))
}

#' @rdname delete_vector_search_endpoint
#' @export 
vectorSearchEndpointsDeleteEndpoint <- delete_vector_search_endpoint
#' Get an endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param endpoint_name Required. Name of the endpoint.
#'
#'
#' @rdname get_vector_search_endpoint
#' @alias vectorSearchEndpointsGetEndpoint
#' @export
get_vector_search_endpoint <- function(client, endpoint_name) {

  client$do("GET", paste("/api/2.0/vector-search/endpoints/", endpoint_name, sep = ""))
}

#' @rdname get_vector_search_endpoint
#' @export 
vectorSearchEndpointsGetEndpoint <- get_vector_search_endpoint
#' List all endpoints.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param page_token Token for pagination.
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname list_vector_search_endpoint_endpoints
#' @alias vectorSearchEndpointsListEndpoints
#' @export
list_vector_search_endpoint_endpoints <- function(client, page_token = NULL) {
  query <- list(page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/vector-search/endpoints", query = query)
    if (is.null(nrow(json$endpoints))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$endpoints)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_vector_search_endpoint_endpoints
#' @export 
vectorSearchEndpointsListEndpoints <- list_vector_search_endpoint_endpoints
#' Create an endpoint.
#' 
#' Create a new endpoint.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Vector Search Endpoints on Databricks reach
#' ONLINE state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Vector Search Endpoints is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param endpoint_type Required. Type of endpoint.
#' @param name Required. Name of endpoint.
#'
#' @rdname create_vector_search_endpoint_and_wait
#' @export
create_vector_search_endpoint_and_wait <- function(client, name, endpoint_type, timeout = 20,
  callback = cli_reporter) {
  body <- list(endpoint_type = endpoint_type, name = name)
  op_response <- client$do("POST", "/api/2.0/vector-search/endpoints", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("ONLINE", c())
  failure_states <- c("OFFLINE", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- vectorSearchEndpointsGetEndpoint(client, endpoint_name = op_response$name)
    status <- poll$endpoint_status$state
    status_message <- paste("current status:", status)
    if (!is.null(poll$endpoint_status)) {
      status_message <- poll$endpoint_status$message
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach ONLINE, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::vectorSearchEndpointsGetEndpoint(endpoint_name=",
      op_response$name, ")")
    sleep <- attempt
    if (sleep > 10) {
      # sleep 10s max per attempt
      sleep <- 10
    }
    if (!is.null(callback)) {
      callback(paste0(status, ": ", status_message), done = FALSE)
    }
    random_pause <- runif(1, min = 0.1, max = 0.5)
    Sys.sleep(sleep + random_pause)
    attempt <- attempt + 1
  }
  msg <- paste("timed out after", timeout, "minutes:", status_message)
  rlang::abort(msg, call = rlang::caller_env())
}




