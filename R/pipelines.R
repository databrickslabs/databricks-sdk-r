# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a pipeline.
#' 
#' Creates a new data processing pipeline based on the requested configuration.
#' If successful, this method returns the ID of the new pipeline.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param allow_duplicate_names If false, deployment will fail if name conflicts with that of another pipeline.
#' @param catalog A catalog in Unity Catalog to publish data from this pipeline to.
#' @param channel DLT Release Channel that specifies which version to use.
#' @param clusters Cluster settings for this pipeline deployment.
#' @param configuration String-String configuration for this pipeline execution.
#' @param continuous Whether the pipeline is continuous or triggered.
#' @param development Whether the pipeline is in Development mode.
#' @param dry_run This field has no description yet.
#' @param edition Pipeline product edition.
#' @param filters Filters on which Pipeline packages to include in the deployed graph.
#' @param id Unique identifier for this pipeline.
#' @param libraries Libraries or code needed by this deployment.
#' @param name Friendly identifier for this pipeline.
#' @param notifications List of notification settings for this pipeline.
#' @param photon Whether Photon is enabled for this pipeline.
#' @param serverless Whether serverless compute is enabled for this pipeline.
#' @param storage DBFS root directory for storing checkpoints and tables.
#' @param target Target schema (database) to add tables in this pipeline to.
#' @param trigger Which pipeline trigger to use.
#'
#'
#' @rdname create_pipeline
#' @alias pipelinesCreate
#' @export
create_pipeline <- function(client, allow_duplicate_names = NULL, catalog = NULL,
  channel = NULL, clusters = NULL, configuration = NULL, continuous = NULL, development = NULL,
  dry_run = NULL, edition = NULL, filters = NULL, id = NULL, libraries = NULL,
  name = NULL, notifications = NULL, photon = NULL, serverless = NULL, storage = NULL,
  target = NULL, trigger = NULL) {
  body <- list(allow_duplicate_names = allow_duplicate_names, catalog = catalog,
    channel = channel, clusters = clusters, configuration = configuration, continuous = continuous,
    development = development, dry_run = dry_run, edition = edition, filters = filters,
    id = id, libraries = libraries, name = name, notifications = notifications,
    photon = photon, serverless = serverless, storage = storage, target = target,
    trigger = trigger)
  client$do("POST", "/api/2.0/pipelines", body = body)
}

#' @rdname create_pipeline
#' @export 
pipelinesCreate <- create_pipeline
#' Delete a pipeline.
#' 
#' Deletes a pipeline.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param pipeline_id Required. This field has no description yet.
#'
#'
#' @rdname delete_pipeline
#' @alias pipelinesDelete
#' @export
delete_pipeline <- function(client, pipeline_id) {

  client$do("DELETE", paste("/api/2.0/pipelines/", pipeline_id, sep = ""))
}

#' @rdname delete_pipeline
#' @export 
pipelinesDelete <- delete_pipeline
#' Get a pipeline.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param pipeline_id Required. This field has no description yet.
#'
#'
#' @rdname get_pipeline
#' @alias pipelinesGet
#' @export
get_pipeline <- function(client, pipeline_id) {

  client$do("GET", paste("/api/2.0/pipelines/", pipeline_id, sep = ""))
}

#' @rdname get_pipeline
#' @export 
pipelinesGet <- get_pipeline
#' Get pipeline permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param pipeline_id Required. The pipeline for which to get or manage permissions.
#'
#'
#' @rdname get_pipeline_permission_levels
#' @alias pipelinesGetPermissionLevels
#' @export
get_pipeline_permission_levels <- function(client, pipeline_id) {

  client$do("GET", paste("/api/2.0/permissions/pipelines/", pipeline_id, "/permissionLevels",
    , sep = ""))
}

#' @rdname get_pipeline_permission_levels
#' @export 
pipelinesGetPermissionLevels <- get_pipeline_permission_levels
#' Get pipeline permissions.
#' 
#' Gets the permissions of a pipeline. Pipelines can inherit permissions from
#' their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param pipeline_id Required. The pipeline for which to get or manage permissions.
#'
#'
#' @rdname get_pipeline_permissions
#' @alias pipelinesGetPermissions
#' @export
get_pipeline_permissions <- function(client, pipeline_id) {

  client$do("GET", paste("/api/2.0/permissions/pipelines/", pipeline_id, sep = ""))
}

#' @rdname get_pipeline_permissions
#' @export 
pipelinesGetPermissions <- get_pipeline_permissions
#' Get a pipeline update.
#' 
#' Gets an update from an active pipeline.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param pipeline_id Required. The ID of the pipeline.
#' @param update_id Required. The ID of the update.
#'
#'
#' @rdname get_pipeline_update
#' @alias pipelinesGetUpdate
#' @export
get_pipeline_update <- function(client, pipeline_id, update_id) {

  client$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/updates/", update_id,
    sep = ""))
}

#' @rdname get_pipeline_update
#' @export 
pipelinesGetUpdate <- get_pipeline_update
#' List pipeline events.
#' 
#' Retrieves events for a pipeline.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param filter Criteria to select a subset of results, expressed using a SQL-like syntax.
#' @param max_results Max number of entries to return in a single page.
#' @param order_by A string indicating a sort order by timestamp for the results, for example, timestamp asc.
#' @param page_token Page token returned by previous call.
#' @param pipeline_id Required. This field has no description yet.
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname list_pipeline_events
#' @alias pipelinesListPipelineEvents
#' @export
list_pipeline_events <- function(client, pipeline_id, filter = NULL, max_results = NULL,
  order_by = NULL, page_token = NULL) {
  query <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/events",
      , sep = ""), query = query)
    if (is.null(nrow(json$events))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$events)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_pipeline_events
#' @export 
pipelinesListPipelineEvents <- list_pipeline_events
#' List pipelines.
#' 
#' Lists pipelines defined in the Delta Live Tables system.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param filter Select a subset of results based on the specified criteria.
#' @param max_results The maximum number of entries to return in a single page.
#' @param order_by A list of strings specifying the order of results.
#' @param page_token Page token returned by previous call.
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname list_pipeline_pipelines
#' @alias pipelinesListPipelines
#' @export
list_pipeline_pipelines <- function(client, filter = NULL, max_results = NULL, order_by = NULL,
  page_token = NULL) {
  query <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/pipelines", query = query)
    if (is.null(nrow(json$statuses))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$statuses)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_pipeline_pipelines
#' @export 
pipelinesListPipelines <- list_pipeline_pipelines
#' List pipeline updates.
#' 
#' List updates for an active pipeline.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param max_results Max number of entries to return in a single page.
#' @param page_token Page token returned by previous call.
#' @param pipeline_id Required. The pipeline to return updates for.
#' @param until_update_id If present, returns updates until and including this update_id.
#'
#'
#' @rdname list_pipeline_updates
#' @alias pipelinesListUpdates
#' @export
list_pipeline_updates <- function(client, pipeline_id, max_results = NULL, page_token = NULL,
  until_update_id = NULL) {
  query <- list(max_results = max_results, page_token = page_token, until_update_id = until_update_id)
  client$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/updates", , sep = ""),
    query = query)
}

#' @rdname list_pipeline_updates
#' @export 
pipelinesListUpdates <- list_pipeline_updates
#' Set pipeline permissions.
#' 
#' Sets permissions on a pipeline. Pipelines can inherit permissions from their
#' root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param pipeline_id Required. The pipeline for which to get or manage permissions.
#'
#'
#' @rdname set_pipeline_permissions
#' @alias pipelinesSetPermissions
#' @export
set_pipeline_permissions <- function(client, pipeline_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/pipelines/", pipeline_id, sep = ""),
    body = body)
}

#' @rdname set_pipeline_permissions
#' @export 
pipelinesSetPermissions <- set_pipeline_permissions
#' Start a pipeline.
#' 
#' Starts a new update for the pipeline. If there is already an active update
#' for the pipeline, the request will fail and the active update will remain
#' running.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cause This field has no description yet.
#' @param full_refresh If true, this update will reset all tables before running.
#' @param full_refresh_selection A list of tables to update with fullRefresh.
#' @param pipeline_id Required. This field has no description yet.
#' @param refresh_selection A list of tables to update without fullRefresh.
#' @param validate_only If true, this update only validates the correctness of pipeline source code but does not materialize or publish any datasets.
#'
#'
#' @rdname start_pipeline_update
#' @alias pipelinesStartUpdate
#' @export
start_pipeline_update <- function(client, pipeline_id, cause = NULL, full_refresh = NULL,
  full_refresh_selection = NULL, refresh_selection = NULL, validate_only = NULL) {
  body <- list(cause = cause, full_refresh = full_refresh, full_refresh_selection = full_refresh_selection,
    refresh_selection = refresh_selection, validate_only = validate_only)
  client$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/updates", , sep = ""),
    body = body)
}

#' @rdname start_pipeline_update
#' @export 
pipelinesStartUpdate <- start_pipeline_update
#' Stop a pipeline.
#' 
#' Stops the pipeline by canceling the active update. If there is no active
#' update for the pipeline, this request is a no-op.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param pipeline_id Required. This field has no description yet.
#'
#'
#' @rdname stop_pipeline
#' @alias pipelinesStop
#' @export
stop_pipeline <- function(client, pipeline_id) {

  client$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/stop", , sep = ""))
}

#' @rdname stop_pipeline
#' @export 
pipelinesStop <- stop_pipeline
#' Edit a pipeline.
#' 
#' Updates a pipeline with the supplied configuration.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param allow_duplicate_names If false, deployment will fail if name has changed and conflicts the name of another pipeline.
#' @param catalog A catalog in Unity Catalog to publish data from this pipeline to.
#' @param channel DLT Release Channel that specifies which version to use.
#' @param clusters Cluster settings for this pipeline deployment.
#' @param configuration String-String configuration for this pipeline execution.
#' @param continuous Whether the pipeline is continuous or triggered.
#' @param development Whether the pipeline is in Development mode.
#' @param edition Pipeline product edition.
#' @param expected_last_modified If present, the last-modified time of the pipeline settings before the edit.
#' @param filters Filters on which Pipeline packages to include in the deployed graph.
#' @param id Unique identifier for this pipeline.
#' @param libraries Libraries or code needed by this deployment.
#' @param name Friendly identifier for this pipeline.
#' @param notifications List of notification settings for this pipeline.
#' @param photon Whether Photon is enabled for this pipeline.
#' @param pipeline_id Unique identifier for this pipeline.
#' @param serverless Whether serverless compute is enabled for this pipeline.
#' @param storage DBFS root directory for storing checkpoints and tables.
#' @param target Target schema (database) to add tables in this pipeline to.
#' @param trigger Which pipeline trigger to use.
#'
#'
#' @rdname update_pipeline
#' @alias pipelinesUpdate
#' @export
update_pipeline <- function(client, pipeline_id, allow_duplicate_names = NULL, catalog = NULL,
  channel = NULL, clusters = NULL, configuration = NULL, continuous = NULL, development = NULL,
  edition = NULL, expected_last_modified = NULL, filters = NULL, id = NULL, libraries = NULL,
  name = NULL, notifications = NULL, photon = NULL, serverless = NULL, storage = NULL,
  target = NULL, trigger = NULL) {
  body <- list(allow_duplicate_names = allow_duplicate_names, catalog = catalog,
    channel = channel, clusters = clusters, configuration = configuration, continuous = continuous,
    development = development, edition = edition, expected_last_modified = expected_last_modified,
    filters = filters, id = id, libraries = libraries, name = name, notifications = notifications,
    photon = photon, pipeline_id = pipeline_id, serverless = serverless, storage = storage,
    target = target, trigger = trigger)
  client$do("PUT", paste("/api/2.0/pipelines/", pipeline_id, sep = ""), body = body)
}

#' @rdname update_pipeline
#' @export 
pipelinesUpdate <- update_pipeline
#' Update pipeline permissions.
#' 
#' Updates the permissions on a pipeline. Pipelines can inherit permissions from
#' their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param pipeline_id Required. The pipeline for which to get or manage permissions.
#'
#'
#' @rdname update_pipeline_permissions
#' @alias pipelinesUpdatePermissions
#' @export
update_pipeline_permissions <- function(client, pipeline_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/pipelines/", pipeline_id, sep = ""),
    body = body)
}

#' @rdname update_pipeline_permissions
#' @export 
pipelinesUpdatePermissions <- update_pipeline_permissions











#' Stop a pipeline.
#' 
#' Stops the pipeline by canceling the active update. If there is no active
#' update for the pipeline, this request is a no-op.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Pipelines on Databricks reach
#' IDLE state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Pipelines is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param pipeline_id Required. This field has no description yet.
#'
#' @rdname stop_pipeline_and_wait
#' @export
stop_pipeline_and_wait <- function(client, pipeline_id, timeout = 20, callback = cli_reporter) {

  op_response <- client$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/stop",
    , sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("IDLE", c())
  failure_states <- c("FAILED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- pipelinesGet(client, pipeline_id = pipeline_id)
    status <- poll$state
    status_message <- poll$cause
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach IDLE, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::pipelinesGet(pipeline_id=", pipeline_id, ")")
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



