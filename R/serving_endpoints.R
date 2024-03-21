# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get build logs for a served model.
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

  client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/",
    served_model_name, "/build-logs", , sep = ""))
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
#' @param rate_limits Rate limits to be applied to the serving endpoint.
#' @param tags Tags to be attached to the serving endpoint and automatically propagated to billing logs.
#'
#' @rdname servingEndpointsCreate
#' @export
servingEndpointsCreate <- function(client, name, config, rate_limits = NULL, tags = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(config = config, name = name, rate_limits = rate_limits, tags = tags)
  op_response <- client$do("POST", "/api/2.0/serving-endpoints", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("NOT_UPDATING", c())
  failure_states <- c("UPDATE_FAILED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- servingEndpointsGet(client, name = op_response$name)
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
    prefix <- paste0("databricks::servingEndpointsGet(name=", op_response$name,
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

#' Get metrics of a serving endpoint.
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

#' Get serving endpoint permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname servingEndpointsGetPermissionLevels
#' @export
servingEndpointsGetPermissionLevels <- function(client, serving_endpoint_id) {

  client$do("GET", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    "/permissionLevels", , sep = ""))
}

#' Get serving endpoint permissions.
#' 
#' Gets the permissions of a serving endpoint. Serving endpoints can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname servingEndpointsGetPermissions
#' @export
servingEndpointsGetPermissions <- function(client, serving_endpoint_id) {

  client$do("GET", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    sep = ""))
}

#' Get all serving endpoints.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname servingEndpointsList
#' @export
servingEndpointsList <- function(client) {

  json <- client$do("GET", "/api/2.0/serving-endpoints")
  return(json$endpoints)

}

#' Get the latest logs for a served model.
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

  client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/",
    served_model_name, "/logs", , sep = ""))
}

#' Update tags of a serving endpoint.
#' 
#' Used to batch add and delete tags from a serving endpoint with a single API
#' call.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param add_tags List of endpoint tags to add.
#' @param delete_tags List of tag keys to delete.
#' @param name Required. The name of the serving endpoint who's tags to patch.
#'
#' @rdname servingEndpointsPatch
#' @export
servingEndpointsPatch <- function(client, name, add_tags = NULL, delete_tags = NULL) {
  body <- list(add_tags = add_tags, delete_tags = delete_tags)
  client$do("PATCH", paste("/api/2.0/serving-endpoints/", name, "/tags", , sep = ""),
    body = body)
}

#' Update rate limits of a serving endpoint.
#' 
#' Used to update the rate limits of a serving endpoint. NOTE: only external and
#' foundation model endpoints are supported as of now.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint whose rate limits are being updated.
#' @param rate_limits The list of endpoint rate limits.
#'
#' @rdname servingEndpointsPut
#' @export
servingEndpointsPut <- function(client, name, rate_limits = NULL) {
  body <- list(, rate_limits = rate_limits)
  client$do("PUT", paste("/api/2.0/serving-endpoints/", name, "/rate-limits", ,
    sep = ""), body = body)
}

#' Query a serving endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param dataframe_records Pandas Dataframe input in the records orientation.
#' @param dataframe_split Pandas Dataframe input in the split orientation.
#' @param extra_params The extra parameters field used ONLY for __completions, chat,__ and __embeddings external & foundation model__ serving endpoints.
#' @param input The input string (or array of strings) field used ONLY for __embeddings external & foundation model__ serving endpoints and is the only field (along with extra_params if needed) used by embeddings queries.
#' @param inputs Tensor-based input in columnar format.
#' @param instances Tensor-based input in row format.
#' @param max_tokens The max tokens field used ONLY for __completions__ and __chat external & foundation model__ serving endpoints.
#' @param messages The messages field used ONLY for __chat external & foundation model__ serving endpoints.
#' @param n The n (number of candidates) field used ONLY for __completions__ and __chat external & foundation model__ serving endpoints.
#' @param name Required. The name of the serving endpoint.
#' @param prompt The prompt string (or array of strings) field used ONLY for __completions external & foundation model__ serving endpoints and should only be used with other completions query fields.
#' @param stop The stop sequences field used ONLY for __completions__ and __chat external & foundation model__ serving endpoints.
#' @param stream The stream field used ONLY for __completions__ and __chat external & foundation model__ serving endpoints.
#' @param temperature The temperature field used ONLY for __completions__ and __chat external & foundation model__ serving endpoints.
#'
#' @rdname servingEndpointsQuery
#' @export
servingEndpointsQuery <- function(client, name, dataframe_records = NULL, dataframe_split = NULL,
  extra_params = NULL, input = NULL, inputs = NULL, instances = NULL, max_tokens = NULL,
  messages = NULL, n = NULL, prompt = NULL, stop = NULL, stream = NULL, temperature = NULL) {
  body <- list(dataframe_records = dataframe_records, dataframe_split = dataframe_split,
    extra_params = extra_params, input = input, inputs = inputs, instances = instances,
    max_tokens = max_tokens, messages = messages, n = n, prompt = prompt, stop = stop,
    stream = stream, temperature = temperature)
  client$do("POST", paste("/serving-endpoints/", name, "/invocations", , sep = ""),
    body = body)
}

#' Set serving endpoint permissions.
#' 
#' Sets permissions on a serving endpoint. Serving endpoints can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname servingEndpointsSetPermissions
#' @export
servingEndpointsSetPermissions <- function(client, serving_endpoint_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    sep = ""), body = body)
}

#' Update config of a serving endpoint.
#' 
#' Updates any combination of the serving endpoint's served entities, the
#' compute configuration of those served entities, and the endpoint's traffic
#' config. An endpoint that already has an update in progress can not be updated
#' until the current update completes or fails.
#'
#' @description
#' This is a long-running operation, which blocks until Serving Endpoints on Databricks reach
#' NOT_UPDATING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param auto_capture_config Configuration for Inference Tables which automatically logs requests and responses to Unity Catalog.
#' @param name Required. The name of the serving endpoint to update.
#' @param served_entities A list of served entities for the endpoint to serve.
#' @param served_models (Deprecated, use served_entities instead) A list of served models for the endpoint to serve.
#' @param traffic_config The traffic config defining how invocations to the serving endpoint should be routed.
#'
#' @rdname servingEndpointsUpdateConfig
#' @export
servingEndpointsUpdateConfig <- function(client, name, auto_capture_config = NULL,
  served_entities = NULL, served_models = NULL, traffic_config = NULL, timeout = 20,
  callback = cli_reporter) {
  body <- list(auto_capture_config = auto_capture_config, served_entities = served_entities,
    served_models = served_models, traffic_config = traffic_config)
  op_response <- client$do("PUT", paste("/api/2.0/serving-endpoints/", name, "/config",
    , sep = ""), body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("NOT_UPDATING", c())
  failure_states <- c("UPDATE_FAILED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- servingEndpointsGet(client, name = op_response$name)
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
    prefix <- paste0("databricks::servingEndpointsGet(name=", op_response$name,
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

#' Update serving endpoint permissions.
#' 
#' Updates the permissions on a serving endpoint. Serving endpoints can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname servingEndpointsUpdatePermissions
#' @export
servingEndpointsUpdatePermissions <- function(client, serving_endpoint_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    sep = ""), body = body)
}

