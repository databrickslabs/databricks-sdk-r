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
#' @rdname build_serving_endpoint_logs
#' @alias servingEndpointsBuildLogs
#' @export
build_serving_endpoint_logs <- function(client, name, served_model_name) {

  client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/",
    served_model_name, "/build-logs", , sep = ""))
}

#' @rdname build_serving_endpoint_logs
#' @export 
servingEndpointsBuildLogs <- build_serving_endpoint_logs
#' Create a new serving endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param config Required. The core config of the serving endpoint.
#' @param name Required. The name of the serving endpoint.
#' @param rate_limits Rate limits to be applied to the serving endpoint.
#' @param tags Tags to be attached to the serving endpoint and automatically propagated to billing logs.
#'
#' @rdname create_serving_endpoint
#' @alias servingEndpointsCreate
#' @export
create_serving_endpoint <- function(client, name, config, rate_limits = NULL, tags = NULL) {
  body <- list(config = config, name = name, rate_limits = rate_limits, tags = tags)
  client$do("POST", "/api/2.0/serving-endpoints", body = body)
}

#' @rdname create_serving_endpoint
#' @export 
servingEndpointsCreate <- create_serving_endpoint
#' Delete a serving endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @rdname delete_serving_endpoint
#' @alias servingEndpointsDelete
#' @export
delete_serving_endpoint <- function(client, name) {

  client$do("DELETE", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}

#' @rdname delete_serving_endpoint
#' @export 
servingEndpointsDelete <- delete_serving_endpoint
#' Get metrics of a serving endpoint.
#' 
#' Retrieves the metrics associated with the provided serving endpoint in either
#' Prometheus or OpenMetrics exposition format.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint to retrieve metrics for.
#'
#' @rdname export_serving_endpoint_metrics
#' @alias servingEndpointsExportMetrics
#' @export
export_serving_endpoint_metrics <- function(client, name) {

  client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/metrics", , sep = ""))
}

#' @rdname export_serving_endpoint_metrics
#' @export 
servingEndpointsExportMetrics <- export_serving_endpoint_metrics
#' Get a single serving endpoint.
#' 
#' Retrieves the details for a single serving endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint.
#'
#' @rdname get_serving_endpoint
#' @alias servingEndpointsGet
#' @export
get_serving_endpoint <- function(client, name) {

  client$do("GET", paste("/api/2.0/serving-endpoints/", name, sep = ""))
}

#' @rdname get_serving_endpoint
#' @export 
servingEndpointsGet <- get_serving_endpoint
#' Get serving endpoint permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname get_serving_endpoint_permission_levels
#' @alias servingEndpointsGetPermissionLevels
#' @export
get_serving_endpoint_permission_levels <- function(client, serving_endpoint_id) {

  client$do("GET", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    "/permissionLevels", , sep = ""))
}

#' @rdname get_serving_endpoint_permission_levels
#' @export 
servingEndpointsGetPermissionLevels <- get_serving_endpoint_permission_levels
#' Get serving endpoint permissions.
#' 
#' Gets the permissions of a serving endpoint. Serving endpoints can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname get_serving_endpoint_permissions
#' @alias servingEndpointsGetPermissions
#' @export
get_serving_endpoint_permissions <- function(client, serving_endpoint_id) {

  client$do("GET", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    sep = ""))
}

#' @rdname get_serving_endpoint_permissions
#' @export 
servingEndpointsGetPermissions <- get_serving_endpoint_permissions
#' Get all serving endpoints.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_serving_endpoints
#' @alias servingEndpointsList
#' @export
list_serving_endpoints <- function(client) {

  json <- client$do("GET", "/api/2.0/serving-endpoints")
  return(json$endpoints)

}

#' @rdname list_serving_endpoints
#' @export 
servingEndpointsList <- list_serving_endpoints
#' Get the latest logs for a served model.
#' 
#' Retrieves the service logs associated with the provided served model.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint that the served model belongs to.
#' @param served_model_name Required. The name of the served model that logs will be retrieved for.
#'
#' @rdname logs_serving_endpoint
#' @alias servingEndpointsLogs
#' @export
logs_serving_endpoint <- function(client, name, served_model_name) {

  client$do("GET", paste("/api/2.0/serving-endpoints/", name, "/served-models/",
    served_model_name, "/logs", , sep = ""))
}

#' @rdname logs_serving_endpoint
#' @export 
servingEndpointsLogs <- logs_serving_endpoint
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
#' @rdname patch_serving_endpoint
#' @alias servingEndpointsPatch
#' @export
patch_serving_endpoint <- function(client, name, add_tags = NULL, delete_tags = NULL) {
  body <- list(add_tags = add_tags, delete_tags = delete_tags)
  client$do("PATCH", paste("/api/2.0/serving-endpoints/", name, "/tags", , sep = ""),
    body = body)
}

#' @rdname patch_serving_endpoint
#' @export 
servingEndpointsPatch <- patch_serving_endpoint
#' Update rate limits of a serving endpoint.
#' 
#' Used to update the rate limits of a serving endpoint. NOTE: only external and
#' foundation model endpoints are supported as of now.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the serving endpoint whose rate limits are being updated.
#' @param rate_limits The list of endpoint rate limits.
#'
#' @rdname put_serving_endpoint
#' @alias servingEndpointsPut
#' @export
put_serving_endpoint <- function(client, name, rate_limits = NULL) {
  body <- list(rate_limits = rate_limits)
  client$do("PUT", paste("/api/2.0/serving-endpoints/", name, "/rate-limits", ,
    sep = ""), body = body)
}

#' @rdname put_serving_endpoint
#' @export 
servingEndpointsPut <- put_serving_endpoint
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
#' @rdname query_serving_endpoint
#' @alias servingEndpointsQuery
#' @export
query_serving_endpoint <- function(client, name, dataframe_records = NULL, dataframe_split = NULL,
  extra_params = NULL, input = NULL, inputs = NULL, instances = NULL, max_tokens = NULL,
  messages = NULL, n = NULL, prompt = NULL, stop = NULL, stream = NULL, temperature = NULL) {
  body <- list(dataframe_records = dataframe_records, dataframe_split = dataframe_split,
    extra_params = extra_params, input = input, inputs = inputs, instances = instances,
    max_tokens = max_tokens, messages = messages, n = n, prompt = prompt, stop = stop,
    stream = stream, temperature = temperature)
  client$do("POST", paste("/serving-endpoints/", name, "/invocations", , sep = ""),
    body = body)
}

#' @rdname query_serving_endpoint
#' @export 
servingEndpointsQuery <- query_serving_endpoint
#' Set serving endpoint permissions.
#' 
#' Sets permissions on a serving endpoint. Serving endpoints can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname set_serving_endpoint_permissions
#' @alias servingEndpointsSetPermissions
#' @export
set_serving_endpoint_permissions <- function(client, serving_endpoint_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    sep = ""), body = body)
}

#' @rdname set_serving_endpoint_permissions
#' @export 
servingEndpointsSetPermissions <- set_serving_endpoint_permissions
#' Update config of a serving endpoint.
#' 
#' Updates any combination of the serving endpoint's served entities, the
#' compute configuration of those served entities, and the endpoint's traffic
#' config. An endpoint that already has an update in progress can not be updated
#' until the current update completes or fails.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param auto_capture_config Configuration for Inference Tables which automatically logs requests and responses to Unity Catalog.
#' @param name Required. The name of the serving endpoint to update.
#' @param served_entities A list of served entities for the endpoint to serve.
#' @param served_models (Deprecated, use served_entities instead) A list of served models for the endpoint to serve.
#' @param traffic_config The traffic config defining how invocations to the serving endpoint should be routed.
#'
#' @rdname update_serving_endpoint_config
#' @alias servingEndpointsUpdateConfig
#' @export
update_serving_endpoint_config <- function(client, name, auto_capture_config = NULL,
  served_entities = NULL, served_models = NULL, traffic_config = NULL) {
  body <- list(auto_capture_config = auto_capture_config, served_entities = served_entities,
    served_models = served_models, traffic_config = traffic_config)
  client$do("PUT", paste("/api/2.0/serving-endpoints/", name, "/config", , sep = ""),
    body = body)
}

#' @rdname update_serving_endpoint_config
#' @export 
servingEndpointsUpdateConfig <- update_serving_endpoint_config
#' Update serving endpoint permissions.
#' 
#' Updates the permissions on a serving endpoint. Serving endpoints can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param serving_endpoint_id Required. The serving endpoint for which to get or manage permissions.
#'
#' @rdname update_serving_endpoint_permissions
#' @alias servingEndpointsUpdatePermissions
#' @export
update_serving_endpoint_permissions <- function(client, serving_endpoint_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/serving-endpoints/", serving_endpoint_id,
    sep = ""), body = body)
}

#' @rdname update_serving_endpoint_permissions
#' @export 
servingEndpointsUpdatePermissions <- update_serving_endpoint_permissions

#' Create a new serving endpoint.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Serving Endpoints on Databricks reach
#' NOT_UPDATING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param config Required. The core config of the serving endpoint.
#' @param name Required. The name of the serving endpoint.
#' @param rate_limits Rate limits to be applied to the serving endpoint.
#' @param tags Tags to be attached to the serving endpoint and automatically propagated to billing logs.
#'
#' @rdname create_serving_endpoint_and_wait
#' @export
create_serving_endpoint_and_wait <- function(client, name, config, rate_limits = NULL,
  tags = NULL, timeout = 20, callback = cli_reporter) {
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












#' Update config of a serving endpoint.
#' 
#' Updates any combination of the serving endpoint's served entities, the
#' compute configuration of those served entities, and the endpoint's traffic
#' config. An endpoint that already has an update in progress can not be updated
#' until the current update completes or fails.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Serving Endpoints on Databricks reach
#' NOT_UPDATING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param auto_capture_config Configuration for Inference Tables which automatically logs requests and responses to Unity Catalog.
#' @param name Required. The name of the serving endpoint to update.
#' @param served_entities A list of served entities for the endpoint to serve.
#' @param served_models (Deprecated, use served_entities instead) A list of served models for the endpoint to serve.
#' @param traffic_config The traffic config defining how invocations to the serving endpoint should be routed.
#'
#' @rdname update_serving_endpoint_config_and_wait
#' @export
update_serving_endpoint_config_and_wait <- function(client, name, auto_capture_config = NULL,
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


