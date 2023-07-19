# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Retrieve the logs associated with building the model's environment for a
#' given serving endpoint's served model.
#' 
#' Retrieves the build logs associated with the provided served model.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint that the served model belongs to.
#' @param served_model_name Required. The name of the served model that build logs will be retrieved for.
#'
#' @rdname servingEndpointsBuildLogs
#' @export
servingEndpointsBuildLogs <- function(client, name, served_model_name) {
    
    client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/", served_model_name, "/build-logs", , sep = ""))
}

#' Create a new serving endpoint.
#'
#' @description
#' This is a long-running operation, which blocks until Serving Endpoints on Databricks reach
#' NOT_UPDATING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param config Required. The core config of the serving endpoint.
#' @param name Required. The name of the serving endpoint.
#'
#' @rdname servingEndpointsCreate
#' @export
servingEndpointsCreate <- function(client, name, config, timeout=20, callback=cli_reporter) {
    body <- list(
        config = config
        , name = name)
    op_response <- client$do("POST", "/api/2.0/serving-endpoints", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("NOT_UPDATING", c())
    failure_states <- c("UPDATE_FAILED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- servingEndpointsGet(client, name = op_response$name)
        status <- poll$state$config_update
        status_message <- paste("current status:", status)
        if (status %in% target_states) {
            if (!is.null(callback)) {
                callback(paste0(status, ": ", status_message), done=TRUE)
            }
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach NOT_UPDATING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks::servingEndpointsGet(name=", op_response$name, ")")
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        if (!is.null(callback)) {
            callback(paste0(status, ": ", status_message), done=FALSE)
        }
        random_pause <- runif(1, min = 0.1, max = 0.5)
        Sys.sleep(sleep + random_pause)
        attempt <- attempt + 1
    }
    msg <- paste("timed out after", timeout, "minutes:", status_message)
    rlang::abort(msg, call = rlang::caller_env())
}

#' Delete a serving endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @rdname servingEndpointsDelete
#' @export
servingEndpointsDelete <- function(client, name) {
    
    client$do("DELETE", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}

#' Retrieve the metrics associated with a serving endpoint.
#' 
#' Retrieves the metrics associated with the provided serving endpoint in either
#' Prometheus or OpenMetrics exposition format.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint to retrieve metrics for.
#'
#' @rdname servingEndpointsExportMetrics
#' @export
servingEndpointsExportMetrics <- function(client, name) {
    
    client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/metrics", , sep = ""))
}

#' Get a single serving endpoint.
#' 
#' Retrieves the details for a single serving endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @rdname servingEndpointsGet
#' @export
servingEndpointsGet <- function(client, name) {
    
    client$do("GET", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}

#' Retrieve all serving endpoints.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname servingEndpointsList
#' @export
servingEndpointsList <- function(client) {
    
    json <- client$do("GET", "/api/2.0/serving-endpoints")
    return (json$endpoints)
    
}

#' Retrieve the most recent log lines associated with a given serving endpoint's
#' served model.
#' 
#' Retrieves the service logs associated with the provided served model.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint that the served model belongs to.
#' @param served_model_name Required. The name of the served model that logs will be retrieved for.
#'
#' @rdname servingEndpointsLogs
#' @export
servingEndpointsLogs <- function(client, name, served_model_name) {
    
    client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/", served_model_name, "/logs", , sep = ""))
}

#' Query a serving endpoint with provided model input.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @rdname servingEndpointsQuery
#' @export
servingEndpointsQuery <- function(client, name) {
    
    client$do("POST", paste("/serving-endpoints/", name, "/invocations", , sep = ""))
}

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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint to update.
#' @param served_models Required. A list of served models for the endpoint to serve.
#' @param traffic_config The traffic config defining how invocations to the serving endpoint should be routed.
#'
#' @rdname servingEndpointsUpdateConfig
#' @export
servingEndpointsUpdateConfig <- function(client, served_models, name, traffic_config=NULL, timeout=20, callback=cli_reporter) {
    body <- list(
        , served_models = served_models
        , traffic_config = traffic_config)
    op_response <- client$do("PUT", paste("/api/2.0/serving-endpoints/", name, "/config", , sep = ""), body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("NOT_UPDATING", c())
    failure_states <- c("UPDATE_FAILED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- servingEndpointsGet(client, name = op_response$name)
        status <- poll$state$config_update
        status_message <- paste("current status:", status)
        if (status %in% target_states) {
            if (!is.null(callback)) {
                callback(paste0(status, ": ", status_message), done=TRUE)
            }
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach NOT_UPDATING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks::servingEndpointsGet(name=", op_response$name, ")")
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        if (!is.null(callback)) {
            callback(paste0(status, ": ", status_message), done=FALSE)
        }
        random_pause <- runif(1, min = 0.1, max = 0.5)
        Sys.sleep(sleep + random_pause)
        attempt <- attempt + 1
    }
    msg <- paste("timed out after", timeout, "minutes:", status_message)
    rlang::abort(msg, call = rlang::caller_env())
}

