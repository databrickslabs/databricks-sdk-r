# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' The Delta Live Tables API allows you to create, edit, delete, start, and view
#' details about pipelines.
#' 
#' Delta Live Tables is a framework for building reliable, maintainable, and
#' testable data processing pipelines. You define the transformations to perform
#' on your data, and Delta Live Tables manages task orchestration, cluster
#' management, monitoring, data quality, and error handling.
#' 
#' Instead of defining your data pipelines using a series of separate Apache
#' Spark tasks, Delta Live Tables manages how your data is transformed based on
#' a target schema you define for each processing step. You can also enforce
#' data quality with Delta Live Tables expectations. Expectations allow you to
#' define expected data quality and specify how to handle records that fail
#' those expectations.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=pipelines_create]{create} \tab Create a pipeline.\cr
#'  \link[=pipelines_delete]{delete} \tab Delete a pipeline.\cr
#'  \link[=pipelines_get]{get} \tab Get a pipeline.\cr
#'  \link[=pipelines_get_update]{get_update} \tab Get a pipeline update.\cr
#'  \link[=pipelines_list_pipeline_events]{list_pipeline_events} \tab List pipeline events.\cr
#'  \link[=pipelines_list_pipelines]{list_pipelines} \tab List pipelines.\cr
#'  \link[=pipelines_list_updates]{list_updates} \tab List pipeline updates.\cr
#'  \link[=pipelines_reset]{reset} \tab Reset a pipeline.\cr
#'  \link[=pipelines_start_update]{start_update} \tab Queue a pipeline update.\cr
#'  \link[=pipelines_stop]{stop} \tab Stop a pipeline.\cr
#'  \link[=pipelines_update]{update} \tab Edit a pipeline.\cr
#' }
#'
#' @rdname pipelines
#' @export
pipelines <- list()

#' Create a pipeline.
#' 
#' Creates a new data processing pipeline based on the requested configuration.
#' If successful, this method returns the ID of the new pipeline.
#'
#' @param allow_duplicate_names If false, deployment will fail if name conflicts with that of another pipeline.
#' @param catalog A catalog in Unity Catalog to publish data from this pipeline to.
#' @param channel DLT Release Channel that specifies which version to use.
#' @param clusters Cluster settings for this pipeline deployment.
#' @param configuration String-String configuration for this pipeline execution.
#' @param continuous Whether the pipeline is continuous or triggered.
#' @param development Whether the pipeline is in Development mode.
#' @param dry_run 
#' @param edition Pipeline product edition.
#' @param filters Filters on which Pipeline packages to include in the deployed graph.
#' @param id Unique identifier for this pipeline.
#' @param libraries Libraries or code needed by this deployment.
#' @param name Friendly identifier for this pipeline.
#' @param photon Whether Photon is enabled for this pipeline.
#' @param serverless Whether serverless compute is enabled for this pipeline.
#' @param storage DBFS root directory for storing checkpoints and tables.
#' @param target Target schema (database) to add tables in this pipeline to.
#' @param trigger Which pipeline trigger to use.
#'
#' @keywords internal
#'
#' @rdname pipelines_create
#'
#' @aliases pipelines_create
pipelines_create <- function(allow_duplicate_names = NULL, catalog = NULL, channel = NULL,
  clusters = NULL, configuration = NULL, continuous = NULL, development = NULL,
  dry_run = NULL, edition = NULL, filters = NULL, id = NULL, libraries = NULL,
  name = NULL, photon = NULL, serverless = NULL, storage = NULL, target = NULL,
  trigger = NULL) {
  body <- list(allow_duplicate_names = allow_duplicate_names, catalog = catalog,
    channel = channel, clusters = clusters, configuration = configuration, continuous = continuous,
    development = development, dry_run = dry_run, edition = edition, filters = filters,
    id = id, libraries = libraries, name = name, photon = photon, serverless = serverless,
    storage = storage, target = target, trigger = trigger)
  .state$api$do("POST", "/api/2.0/pipelines", body = body)
}
pipelines$create <- pipelines_create

#' Delete a pipeline.
#' 
#' Deletes a pipeline.
#'
#' @param pipeline_id Required. 
#'
#' @keywords internal
#'
#' @rdname pipelines_delete
#'
#' @aliases pipelines_delete
pipelines_delete <- function(pipeline_id) {

  .state$api$do("DELETE", paste("/api/2.0/pipelines/", pipeline_id, sep = ""))
}
pipelines$delete <- pipelines_delete

#' Get a pipeline.
#'
#' @param pipeline_id Required. 
#'
#' @keywords internal
#'
#' @rdname pipelines_get
#'
#' @aliases pipelines_get
pipelines_get <- function(pipeline_id) {

  .state$api$do("GET", paste("/api/2.0/pipelines/", pipeline_id, sep = ""))
}
pipelines$get <- pipelines_get

#' Get a pipeline update.
#' 
#' Gets an update from an active pipeline.
#'
#' @param pipeline_id Required. The ID of the pipeline.
#' @param update_id Required. The ID of the update.
#'
#' @keywords internal
#'
#' @rdname pipelines_get_update
#'
#' @aliases pipelines_get_update
pipelines_get_update <- function(pipeline_id, update_id) {

  .state$api$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/updates/", update_id,
    sep = ""))
}
pipelines$get_update <- pipelines_get_update

#' List pipeline events.
#' 
#' Retrieves events for a pipeline.
#'
#' @param filter Criteria to select a subset of results, expressed using a SQL-like syntax.
#' @param max_results Max number of entries to return in a single page.
#' @param order_by A string indicating a sort order by timestamp for the results, for example, ['timestamp asc'].
#' @param page_token Page token returned by previous call.
#' @param pipeline_id Required. 
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname pipelines_list_pipeline_events
#'
#' @aliases pipelines_list_pipeline_events
pipelines_list_pipeline_events <- function(pipeline_id, filter = NULL, max_results = NULL,
  order_by = NULL, page_token = NULL) {
  query <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/events",
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
pipelines$list_pipeline_events <- pipelines_list_pipeline_events

#' List pipelines.
#' 
#' Lists pipelines defined in the Delta Live Tables system.
#'
#' @param filter Select a subset of results based on the specified criteria.
#' @param max_results The maximum number of entries to return in a single page.
#' @param order_by A list of strings specifying the order of results.
#' @param page_token Page token returned by previous call.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname pipelines_list_pipelines
#'
#' @aliases pipelines_list_pipelines
pipelines_list_pipelines <- function(filter = NULL, max_results = NULL, order_by = NULL,
  page_token = NULL) {
  query <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/pipelines", query = query)
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
pipelines$list_pipelines <- pipelines_list_pipelines

#' List pipeline updates.
#' 
#' List updates for an active pipeline.
#'
#' @param max_results Max number of entries to return in a single page.
#' @param page_token Page token returned by previous call.
#' @param pipeline_id Required. The pipeline to return updates for.
#' @param until_update_id If present, returns updates until and including this update_id.
#'
#' @keywords internal
#'
#' @rdname pipelines_list_updates
#'
#' @aliases pipelines_list_updates
pipelines_list_updates <- function(pipeline_id, max_results = NULL, page_token = NULL,
  until_update_id = NULL) {
  query <- list(max_results = max_results, page_token = page_token, until_update_id = until_update_id)
  .state$api$do("GET", paste("/api/2.0/pipelines/", pipeline_id, "/updates", ,
    sep = ""), query = query)
}
pipelines$list_updates <- pipelines_list_updates

#' Reset a pipeline.
#' 
#' Resets a pipeline.
#'
#' @description
#' This is a long-running operation, which blocks until Pipelines on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Pipelines is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param pipeline_id Required. 
#'
#' @keywords internal
#'
#' @rdname pipelines_reset
#'
#' @aliases pipelines_reset
pipelines_reset <- function(pipeline_id, timeout = 20, callback = cli_reporter) {

  .state$api$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/reset", , sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("FAILED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- pipelines_get(pipeline_id = pipeline_id)
    status <- poll$state
    status_message <- poll$cause
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::pipelines_get(pipeline_id=", pipeline_id, ")")
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
pipelines$reset <- pipelines_reset

#' Queue a pipeline update.
#' 
#' Starts or queues a pipeline update.
#'
#' @param cause 
#' @param full_refresh If true, this update will reset all tables before running.
#' @param full_refresh_selection A list of tables to update with fullRefresh.
#' @param pipeline_id Required. 
#' @param refresh_selection A list of tables to update without fullRefresh.
#'
#' @keywords internal
#'
#' @rdname pipelines_start_update
#'
#' @aliases pipelines_start_update
pipelines_start_update <- function(pipeline_id, cause = NULL, full_refresh = NULL,
  full_refresh_selection = NULL, refresh_selection = NULL) {
  body <- list(cause = cause, full_refresh = full_refresh, full_refresh_selection = full_refresh_selection,
    refresh_selection = refresh_selection)
  .state$api$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/updates", ,
    sep = ""), body = body)
}
pipelines$start_update <- pipelines_start_update

#' Stop a pipeline.
#' 
#' Stops a pipeline.
#'
#' @description
#' This is a long-running operation, which blocks until Pipelines on Databricks reach
#' IDLE state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Pipelines is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param pipeline_id Required. 
#'
#' @keywords internal
#'
#' @rdname pipelines_stop
#'
#' @aliases pipelines_stop
pipelines_stop <- function(pipeline_id, timeout = 20, callback = cli_reporter) {

  .state$api$do("POST", paste("/api/2.0/pipelines/", pipeline_id, "/stop", , sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("IDLE", c())
  failure_states <- c("FAILED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- pipelines_get(pipeline_id = pipeline_id)
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
    prefix <- paste0("databricks::pipelines_get(pipeline_id=", pipeline_id, ")")
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
pipelines$stop <- pipelines_stop

#' Edit a pipeline.
#' 
#' Updates a pipeline with the supplied configuration.
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
#' @param photon Whether Photon is enabled for this pipeline.
#' @param pipeline_id Unique identifier for this pipeline.
#' @param serverless Whether serverless compute is enabled for this pipeline.
#' @param storage DBFS root directory for storing checkpoints and tables.
#' @param target Target schema (database) to add tables in this pipeline to.
#' @param trigger Which pipeline trigger to use.
#'
#' @keywords internal
#'
#' @rdname pipelines_update
#'
#' @aliases pipelines_update
pipelines_update <- function(pipeline_id, allow_duplicate_names = NULL, catalog = NULL,
  channel = NULL, clusters = NULL, configuration = NULL, continuous = NULL, development = NULL,
  edition = NULL, expected_last_modified = NULL, filters = NULL, id = NULL, libraries = NULL,
  name = NULL, photon = NULL, serverless = NULL, storage = NULL, target = NULL,
  trigger = NULL) {
  body <- list(allow_duplicate_names = allow_duplicate_names, catalog = catalog,
    channel = channel, clusters = clusters, configuration = configuration, continuous = continuous,
    development = development, edition = edition, expected_last_modified = expected_last_modified,
    filters = filters, id = id, libraries = libraries, name = name, photon = photon,
    pipeline_id = pipeline_id, serverless = serverless, storage = storage, target = target,
    trigger = trigger)
  .state$api$do("PUT", paste("/api/2.0/pipelines/", pipeline_id, sep = ""), body = body)
}
pipelines$update <- pipelines_update

