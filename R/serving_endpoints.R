# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Retrieve the logs associated with building the model's environment for a
#' given serving endpoint's served model.
#' 
#' Retrieves the build logs associated with the provided served model. Please
#' note that this API is in preview and may change in the future.
#'
#' @param name The name of the serving endpoint that the served model belongs to.
#' @param served_model_name The name of the served model that build logs will be retrieved for.
databricks_serving_endpoints_build_logs <- function(name, served_model_name, ...) {
    
    .api$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/", served_model_name, "/build-logs", , sep = ""))
}

#' Create a new serving endpoint.
#'
#' @param config The core config of the serving endpoint.
#' @param name The name of the serving endpoint.
databricks_serving_endpoints_create <- function(name, config, ...) {
    body <- list(
        config = config, 
        name = name, ...)
    .api$do("POST", "/api/2.0/serving-endpoints", body = body)
}

#' Delete a serving endpoint.
#'
#' @param name The name of the serving endpoint.
databricks_serving_endpoints_delete <- function(name, ...) {
    
    .api$do("DELETE", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}

#' Retrieve the metrics corresponding to a serving endpoint for the current time
#' in Prometheus or OpenMetrics exposition format.
#' 
#' Retrieves the metrics associated with the provided serving endpoint in either
#' Prometheus or OpenMetrics exposition format. Please note that this API is in
#' preview and may change in the future.
#'
#' @param name The name of the serving endpoint to retrieve metrics for.
databricks_serving_endpoints_export_metrics <- function(name, ...) {
    
    .api$do("GET", paste("/api/2.0/serving-endpoints/", name, "/metrics", , sep = ""))
}

#' Get a single serving endpoint.
#' 
#' Retrieves the details for a single serving endpoint.
#'
#' @param name The name of the serving endpoint.
databricks_serving_endpoints_get <- function(name, ...) {
    
    .api$do("GET", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}

#' Retrieve all serving endpoints.
databricks_serving_endpoints_list <- function(...) {
    .api$do("GET", "/api/2.0/serving-endpoints")
}

#' Retrieve the most recent log lines associated with a given serving endpoint's
#' served model.
#' 
#' Retrieves the service logs associated with the provided served model. Please
#' note that this API is in preview and may change in the future.
#'
#' @param name The name of the serving endpoint that the served model belongs to.
#' @param served_model_name The name of the served model that logs will be retrieved for.
databricks_serving_endpoints_logs <- function(name, served_model_name, ...) {
    
    .api$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/", served_model_name, "/logs", , sep = ""))
}

#' Query a serving endpoint with provided model input.
#'
#' @param name The name of the serving endpoint.
databricks_serving_endpoints_query <- function(name, ...) {
    
    .api$do("POST", paste("/serving-endpoints/", name, "/invocations", , sep = ""))
}

#' Update a serving endpoint with a new config.
#' 
#' Updates any combination of the serving endpoint's served models, the compute
#' configuration of those served models, and the endpoint's traffic config. An
#' endpoint that already has an update in progress can not be updated until the
#' current update completes or fails.
#'
#' @param name The name of the serving endpoint to update.
#' @param served_models A list of served models for the endpoint to serve.
#' @param traffic_config The traffic config defining how invocations to the serving endpoint should be routed.
databricks_serving_endpoints_update_config <- function(served_models, name, traffic_config = NULL, 
    ...) {
    body <- list(
        served_models = served_models, 
        traffic_config = traffic_config, ...)
    .api$do("PUT", paste("/api/2.0/serving-endpoints/", name, "/config", , sep = ""), body = body)
}

