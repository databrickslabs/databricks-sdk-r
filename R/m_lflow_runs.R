# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL


#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=m_lflow_runs_create]{create} \tab Create a run.\cr
#'  \link[=m_lflow_runs_delete]{delete} \tab Delete a run.\cr
#'  \link[=m_lflow_runs_delete_tag]{delete_tag} \tab Delete a tag.\cr
#'  \link[=m_lflow_runs_get]{get} \tab Get a run.\cr
#'  \link[=m_lflow_runs_log_batch]{log_batch} \tab Log a batch.\cr
#'  \link[=m_lflow_runs_log_metric]{log_metric} \tab Log a metric.\cr
#'  \link[=m_lflow_runs_log_model]{log_model} \tab Log a model.\cr
#'  \link[=m_lflow_runs_log_parameter]{log_parameter} \tab Log a param.\cr
#'  \link[=m_lflow_runs_restore]{restore} \tab Restore a run.\cr
#'  \link[=m_lflow_runs_search]{search} \tab Search for runs.\cr
#'  \link[=m_lflow_runs_set_tag]{set_tag} \tab Set a tag.\cr
#'  \link[=m_lflow_runs_update]{update} \tab Update a run.\cr
#' }
#'
#' @rdname m_lflow_runs
#' @export
m_lflow_runs <- list()

#' Create a run.
#' 
#' Creates a new run within an experiment. A run is usually a single execution
#' of a machine learning or data ETL pipeline. MLflow uses runs to track the
#' `mlflowParam`, `mlflowMetric` and `mlflowRunTag` associated with a single
#' execution.
#'
#' @param experiment_id ID of the associated experiment.
#' @param start_time Unix timestamp in milliseconds of when the run started.
#' @param tags Additional metadata for run.
#' @param user_id ID of the user executing the run.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_create
#'
#' @aliases m_lflow_runs_create
m_lflow_runs_create <- function(experiment_id = NULL, start_time = NULL, tags = NULL,
  user_id = NULL) {
  body <- list(experiment_id = experiment_id, start_time = start_time, tags = tags,
    user_id = user_id)
  .api$do("POST", "/api/2.0/mlflow/runs/create", body = body)
}
m_lflow_runs$create <- m_lflow_runs_create

#' Delete a run.
#' 
#' Marks a run for deletion.
#'
#' @param run_id Required. ID of the run to delete.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_delete
#'
#' @aliases m_lflow_runs_delete
m_lflow_runs_delete <- function(run_id) {
  body <- list(run_id = run_id)
  .api$do("POST", "/api/2.0/mlflow/runs/delete", body = body)
}
m_lflow_runs$delete <- m_lflow_runs_delete

#' Delete a tag.
#' 
#' Deletes a tag on a run. Tags are run metadata that can be updated during a
#' run and after a run completes.
#'
#' @param key Required. Name of the tag.
#' @param run_id Required. ID of the run that the tag was logged under.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_delete_tag
#'
#' @aliases m_lflow_runs_delete_tag
m_lflow_runs_delete_tag <- function(run_id, key) {
  body <- list(key = key, run_id = run_id)
  .api$do("POST", "/api/2.0/mlflow/runs/delete-tag", body = body)
}
m_lflow_runs$delete_tag <- m_lflow_runs_delete_tag

#' Get a run.
#' 
#' 'Gets the metadata, metrics, params, and tags for a run. In the case where
#' multiple metrics with the same key are logged for a run, return only the
#' value with the latest timestamp.
#' 
#' If there are multiple values with the latest timestamp, return the maximum of
#' these values.
#'
#' @param run_id Required. ID of the run to fetch.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run to fetch.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_get
#'
#' @aliases m_lflow_runs_get
m_lflow_runs_get <- function(run_id, run_uuid = NULL) {
  query <- list(run_id = run_id, run_uuid = run_uuid)
  .api$do("GET", "/api/2.0/mlflow/runs/get", query = query)
}
m_lflow_runs$get <- m_lflow_runs_get

#' Log a batch.
#' 
#' Logs a batch of metrics, params, and tags for a run. If any data failed to be
#' persisted, the server will respond with an error (non-200 status code).
#' 
#' In case of error (due to internal server error or an invalid request),
#' partial data may be written.
#' 
#' You can write metrics, params, and tags in interleaving fashion, but within a
#' given entity type are guaranteed to follow the order specified in the request
#' body.
#' 
#' The overwrite behavior for metrics, params, and tags is as follows:
#' 
#' * Metrics: metric values are never overwritten. Logging a metric (key, value,
#' timestamp) appends to the set of values for the metric with the provided key.
#' 
#' * Tags: tag values can be overwritten by successive writes to the same tag
#' key. That is, if multiple tag values with the same key are provided in the
#' same API request, the last-provided tag value is written. Logging the same
#' tag (key, value) is permitted. Specifically, logging a tag is idempotent.
#' 
#' * Parameters: once written, param values cannot be changed (attempting to
#' overwrite a param value will result in an error). However, logging the same
#' param (key, value) is permitted. Specifically, logging a param is idempotent.
#' 
#' Request Limits ------------------------------- A single JSON-serialized API
#' request may be up to 1 MB in size and contain:
#' 
#' * No more than 1000 metrics, params, and tags in total * Up to 1000 metrics -
#' Up to 100 params * Up to 100 tags
#' 
#' For example, a valid request might contain 900 metrics, 50 params, and 50
#' tags, but logging 900 metrics, 50 params, and 51 tags is invalid.
#' 
#' The following limits also apply to metric, param, and tag keys and values:
#' 
#' * Metric keyes, param keys, and tag keys can be up to 250 characters in
#' length * Parameter and tag values can be up to 250 characters in length
#'
#' @param metrics Metrics to log.
#' @param params Params to log.
#' @param run_id ID of the run to log under.
#' @param tags Tags to log.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_log_batch
#'
#' @aliases m_lflow_runs_log_batch
m_lflow_runs_log_batch <- function(metrics = NULL, params = NULL, run_id = NULL,
  tags = NULL) {
  body <- list(metrics = metrics, params = params, run_id = run_id, tags = tags)
  .api$do("POST", "/api/2.0/mlflow/runs/log-batch", body = body)
}
m_lflow_runs$log_batch <- m_lflow_runs_log_batch

#' Log a metric.
#' 
#' Logs a metric for a run. A metric is a key-value pair (string key, float
#' value) with an associated timestamp. Examples include the various metrics
#' that represent ML model accuracy. A metric can be logged multiple times.
#'
#' @param key Required. Name of the metric.
#' @param run_id ID of the run under which to log the metric.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run under which to log the metric.
#' @param step Step at which to log the metric.
#' @param timestamp Required. Unix timestamp in milliseconds at the time metric was logged.
#' @param value Required. Double value of the metric being logged.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_log_metric
#'
#' @aliases m_lflow_runs_log_metric
m_lflow_runs_log_metric <- function(key, value, timestamp, run_id = NULL, run_uuid = NULL,
  step = NULL) {
  body <- list(key = key, run_id = run_id, run_uuid = run_uuid, step = step, timestamp = timestamp,
    value = value)
  .api$do("POST", "/api/2.0/mlflow/runs/log-metric", body = body)
}
m_lflow_runs$log_metric <- m_lflow_runs_log_metric

#' Log a model.
#' 
#' **NOTE:** Experimental: This API may change or be removed in a future release
#' without warning.
#'
#' @param model_json MLmodel file in json format.
#' @param run_id ID of the run to log under.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_log_model
#'
#' @aliases m_lflow_runs_log_model
m_lflow_runs_log_model <- function(model_json = NULL, run_id = NULL) {
  body <- list(model_json = model_json, run_id = run_id)
  .api$do("POST", "/api/2.0/mlflow/runs/log-model", body = body)
}
m_lflow_runs$log_model <- m_lflow_runs_log_model

#' Log a param.
#' 
#' Logs a param used for a run. A param is a key-value pair (string key, string
#' value). Examples include hyperparameters used for ML model training and
#' constant dates and values used in an ETL pipeline. A param can be logged only
#' once for a run.
#'
#' @param key Required. Name of the param.
#' @param run_id ID of the run under which to log the param.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run under which to log the param.
#' @param value Required. String value of the param being logged.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_log_parameter
#'
#' @aliases m_lflow_runs_log_parameter
m_lflow_runs_log_parameter <- function(key, value, run_id = NULL, run_uuid = NULL) {
  body <- list(key = key, run_id = run_id, run_uuid = run_uuid, value = value)
  .api$do("POST", "/api/2.0/mlflow/runs/log-parameter", body = body)
}
m_lflow_runs$log_parameter <- m_lflow_runs_log_parameter

#' Restore a run.
#' 
#' Restores a deleted run.
#'
#' @param run_id Required. ID of the run to restore.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_restore
#'
#' @aliases m_lflow_runs_restore
m_lflow_runs_restore <- function(run_id) {
  body <- list(run_id = run_id)
  .api$do("POST", "/api/2.0/mlflow/runs/restore", body = body)
}
m_lflow_runs$restore <- m_lflow_runs_restore

#' Search for runs.
#' 
#' Searches for runs that satisfy expressions.
#' 
#' Search expressions can use `mlflowMetric` and `mlflowParam` keys.',
#'
#' @param experiment_ids List of experiment IDs to search over.
#' @param filter A filter expression over params, metrics, and tags, that allows returning a subset of runs.
#' @param max_results Maximum number of runs desired.
#' @param order_by List of columns to be ordered by, including attributes, params, metrics, and tags with an optional 'DESC' or 'ASC' annotation, where 'ASC' is the default.
#' @param page_token Token for the current page of runs.
#' @param run_view_type Whether to display only active, only deleted, or all runs.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_search
#'
#' @aliases m_lflow_runs_search
m_lflow_runs_search <- function(experiment_ids = NULL, filter = NULL, max_results = NULL,
  order_by = NULL, page_token = NULL, run_view_type = NULL) {
  body <- list(experiment_ids = experiment_ids, filter = filter, max_results = max_results,
    order_by = order_by, page_token = page_token, run_view_type = run_view_type)
  results <- data.frame()
  while (TRUE) {
    json <- .api$do("POST", "/api/2.0/mlflow/runs/search", body = body)
    if (is.null(nrow(json$runs))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$runs)
    if (is.null(json$next_page_token)) {
      break
    }
    body$page_token <- json$next_page_token
  }
  return(results)

}
m_lflow_runs$search <- m_lflow_runs_search

#' Set a tag.
#' 
#' Sets a tag on a run. Tags are run metadata that can be updated during a run
#' and after a run completes.
#'
#' @param key Required. Name of the tag.
#' @param run_id ID of the run under which to log the tag.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run under which to log the tag.
#' @param value Required. String value of the tag being logged.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_set_tag
#'
#' @aliases m_lflow_runs_set_tag
m_lflow_runs_set_tag <- function(key, value, run_id = NULL, run_uuid = NULL) {
  body <- list(key = key, run_id = run_id, run_uuid = run_uuid, value = value)
  .api$do("POST", "/api/2.0/mlflow/runs/set-tag", body = body)
}
m_lflow_runs$set_tag <- m_lflow_runs_set_tag

#' Update a run.
#' 
#' Updates run metadata.
#'
#' @param end_time Unix timestamp in milliseconds of when the run ended.
#' @param run_id ID of the run to update.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run to update.
#' @param status Updated status of the run.
#'
#' @keywords internal
#'
#' @rdname m_lflow_runs_update
#'
#' @aliases m_lflow_runs_update
m_lflow_runs_update <- function(end_time = NULL, run_id = NULL, run_uuid = NULL,
  status = NULL) {
  body <- list(end_time = end_time, run_id = run_id, run_uuid = run_uuid, status = status)
  .api$do("POST", "/api/2.0/mlflow/runs/update", body = body)
}
m_lflow_runs$update <- m_lflow_runs_update

