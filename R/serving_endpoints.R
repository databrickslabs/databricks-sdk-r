# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' The Serving Endpoints API allows you to create, update, and delete model
#' serving endpoints.
#' 
#' You can use a serving endpoint to serve models from the Databricks Model
#' Registry. Endpoints expose the underlying models as scalable REST API
#' endpoints using serverless compute. This means the endpoints and associated
#' compute resources are fully managed by Databricks and will not appear in your
#' cloud account. A serving endpoint can consist of one or more MLflow models
#' from the Databricks Model Registry, called served models. A serving endpoint
#' can have at most ten served models. You can configure traffic settings to
#' define how requests should be routed to your served models behind an
#' endpoint. Additionally, you can configure the scale of resources that should
#' be applied to each served model.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=serving_endpoints_build_logs]{build_logs} \tab Retrieve the logs associated with building the model's environment for a given serving endpoint's served model.\cr
#'  \link[=serving_endpoints_create]{create} \tab Create a new serving endpoint.\cr
#'  \link[=serving_endpoints_delete]{delete} \tab Delete a serving endpoint.\cr
#'  \link[=serving_endpoints_export_metrics]{export_metrics} \tab Retrieve the metrics corresponding to a serving endpoint for the current time in Prometheus or OpenMetrics exposition format.\cr
#'  \link[=serving_endpoints_get]{get} \tab Get a single serving endpoint.\cr
#'  \link[=serving_endpoints_list]{list} \tab Retrieve all serving endpoints.\cr
#'  \link[=serving_endpoints_logs]{logs} \tab Retrieve the most recent log lines associated with a given serving endpoint's served model.\cr
#'  \link[=serving_endpoints_query]{query} \tab Query a serving endpoint with provided model input.\cr
#'  \link[=serving_endpoints_update_config]{update_config} \tab Update a serving endpoint with a new config.\cr
#' }
#'
#' @rdname serving_endpoints
#' @export
serving_endpoints <- list()

#' Retrieve the logs associated with building the model's environment for a
#' given serving endpoint's served model.
#' 
#' Retrieves the build logs associated with the provided served model.
#'
#' @param name Required. The name of the serving endpoint that the served model belongs to.
#' @param served_model_name Required. The name of the served model that build logs will be retrieved for.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_build_logs
#'
#' @aliases serving_endpoints_build_logs
serving_endpoints_build_logs <- function(name, served_model_name) {

  .state$api$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/",
    served_model_name, "/build-logs", , sep = ""))
}
serving_endpoints$build_logs <- serving_endpoints_build_logs

#' Create a new serving endpoint.
#'
#' @description
#' This is a long-running operation, which blocks until Serving Endpoints on Databricks reach  
#' NOT_UPDATING state with the timeout of 20 minutes, that you can change via `timeout` parameter. 
#' By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior 
#' by changing the `callback` parameter.
#'
#' @param config Required. The core config of the serving endpoint.
#' @param name Required. The name of the serving endpoint.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_create
#'
#' @aliases serving_endpoints_create
serving_endpoints_create <- function(name, config, timeout = 20, callback = cli_reporter) {
  body <- list(config = config, name = name)
  op_response <- .state$api$do("POST", "/api/2.0/serving-endpoints", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("NOT_UPDATING", c())
  failure_states <- c("UPDATE_FAILED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- serving_endpoints_get(name = op_response$name)
    status <- poll$state$config_update
    status_message <- paste("current status:", status)
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach NOT_UPDATING, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::serving_endpoints_get(name=", op_response$name,
      ")")
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
serving_endpoints$create <- serving_endpoints_create

#' Delete a serving endpoint.
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_delete
#'
#' @aliases serving_endpoints_delete
serving_endpoints_delete <- function(name) {

  .state$api$do("DELETE", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}
serving_endpoints$delete <- serving_endpoints_delete

#' Retrieve the metrics corresponding to a serving endpoint for the current time
#' in Prometheus or OpenMetrics exposition format.
#' 
#' Retrieves the metrics associated with the provided serving endpoint in either
#' Prometheus or OpenMetrics exposition format.
#'
#' @param name Required. The name of the serving endpoint to retrieve metrics for.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_export_metrics
#'
#' @aliases serving_endpoints_export_metrics
serving_endpoints_export_metrics <- function(name) {

  .state$api$do("GET", paste("/api/2.0/serving-endpoints/", name, "/metrics", ,
    sep = ""))
}
serving_endpoints$export_metrics <- serving_endpoints_export_metrics

#' Get a single serving endpoint.
#' 
#' Retrieves the details for a single serving endpoint.
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_get
#'
#' @aliases serving_endpoints_get
serving_endpoints_get <- function(name) {

  .state$api$do("GET", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}
serving_endpoints$get <- serving_endpoints_get

#' Retrieve all serving endpoints.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_list
#'
#' @aliases serving_endpoints_list
serving_endpoints_list <- function() {

  json <- .state$api$do("GET", "/api/2.0/serving-endpoints")
  return(json$endpoints)

}
serving_endpoints$list <- serving_endpoints_list

#' Retrieve the most recent log lines associated with a given serving endpoint's
#' served model.
#' 
#' Retrieves the service logs associated with the provided served model.
#'
#' @param name Required. The name of the serving endpoint that the served model belongs to.
#' @param served_model_name Required. The name of the served model that logs will be retrieved for.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_logs
#'
#' @aliases serving_endpoints_logs
serving_endpoints_logs <- function(name, served_model_name) {

  .state$api$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/",
    served_model_name, "/logs", , sep = ""))
}
serving_endpoints$logs <- serving_endpoints_logs

#' Query a serving endpoint with provided model input.
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_query
#'
#' @aliases serving_endpoints_query
serving_endpoints_query <- function(name) {

  .state$api$do("POST", paste("/serving-endpoints/", name, "/invocations", , sep = ""))
}
serving_endpoints$query <- serving_endpoints_query

#' Update a serving endpoint with a new config.
#' 
#' Updates any combination of the serving endpoint's served models, the compute
#' configuration of those served models, and the endpoint's traffic config. An
#' endpoint that already has an update in progress can not be updated until the
#' current update completes or fails.
#'
#' @description
#' This is a long-running operation, which blocks until Serving Endpoints on Databricks reach  
#' NOT_UPDATING state with the timeout of 20 minutes, that you can change via `timeout` parameter. 
#' By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior 
#' by changing the `callback` parameter.
#'
#' @param name Required. The name of the serving endpoint to update.
#' @param served_models Required. A list of served models for the endpoint to serve.
#' @param traffic_config The traffic config defining how invocations to the serving endpoint should be routed.
#'
#' @keywords internal
#'
#' @rdname serving_endpoints_update_config
#'
#' @aliases serving_endpoints_update_config
serving_endpoints_update_config <- function(served_models, name, traffic_config = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(, served_models = served_models, traffic_config = traffic_config)
  op_response <- .state$api$do("PUT", paste("/api/2.0/serving-endpoints/", name,
    "/config", , sep = ""), body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("NOT_UPDATING", c())
  failure_states <- c("UPDATE_FAILED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- serving_endpoints_get(name = op_response$name)
    status <- poll$state$config_update
    status_message <- paste("current status:", status)
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach NOT_UPDATING, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::serving_endpoints_get(name=", op_response$name,
      ")")
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
serving_endpoints$update_config <- serving_endpoints_update_config

