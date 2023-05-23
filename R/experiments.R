# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Experiments are the primary unit of organization in MLflow; all MLflow runs
#' belong to an experiment. Each experiment lets you visualize, search, and
#' compare runs, as well as download run artifacts or metadata for analysis in
#' other tools. Experiments are maintained in a Databricks hosted MLflow
#' tracking server.
#' 
#' Experiments are located in the workspace file tree. You manage experiments
#' using the same tools you use to manage other workspace objects such as
#' folders, notebooks, and libraries.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=experiments_create_experiment]{create_experiment} \tab Create experiment.\cr
#'  \link[=experiments_create_run]{create_run} \tab Create a run.\cr
#'  \link[=experiments_delete_experiment]{delete_experiment} \tab Delete an experiment.\cr
#'  \link[=experiments_delete_run]{delete_run} \tab Delete a run.\cr
#'  \link[=experiments_delete_tag]{delete_tag} \tab Delete a tag.\cr
#'  \link[=experiments_get_by_name]{get_by_name} \tab Get metadata.\cr
#'  \link[=experiments_get_experiment]{get_experiment} \tab Get an experiment.\cr
#'  \link[=experiments_get_history]{get_history} \tab Get history of a given metric within a run.\cr
#'  \link[=experiments_get_run]{get_run} \tab Get a run.\cr
#'  \link[=experiments_list_artifacts]{list_artifacts} \tab Get all artifacts.\cr
#'  \link[=experiments_list_experiments]{list_experiments} \tab List experiments.\cr
#'  \link[=experiments_log_batch]{log_batch} \tab Log a batch.\cr
#'  \link[=experiments_log_inputs]{log_inputs} \tab Log inputs to a run.\cr
#'  \link[=experiments_log_metric]{log_metric} \tab Log a metric.\cr
#'  \link[=experiments_log_model]{log_model} \tab Log a model.\cr
#'  \link[=experiments_log_param]{log_param} \tab Log a param.\cr
#'  \link[=experiments_restore_experiment]{restore_experiment} \tab Restores an experiment.\cr
#'  \link[=experiments_restore_run]{restore_run} \tab Restore a run.\cr
#'  \link[=experiments_search_experiments]{search_experiments} \tab Search experiments.\cr
#'  \link[=experiments_search_runs]{search_runs} \tab Search for runs.\cr
#'  \link[=experiments_set_experiment_tag]{set_experiment_tag} \tab Set a tag.\cr
#'  \link[=experiments_set_tag]{set_tag} \tab Set a tag.\cr
#'  \link[=experiments_update_experiment]{update_experiment} \tab Update an experiment.\cr
#'  \link[=experiments_update_run]{update_run} \tab Update a run.\cr
#' }
#'
#' @rdname experiments
#' @export
experiments <- list()

#' Create experiment.
#' 
#' Creates an experiment with a name. Returns the ID of the newly created
#' experiment. Validates that another experiment with the same name does not
#' already exist and fails if another experiment with the same name already
#' exists.
#' 
#' Throws `RESOURCE_ALREADY_EXISTS` if a experiment with the given name exists.
#'
#' @param artifact_location Location where all artifacts for the experiment are stored.
#' @param name Required. Experiment name.
#' @param tags A collection of tags to set on the experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_create_experiment
#'
#' @aliases experiments_create_experiment
experiments_create_experiment <- function(name, artifact_location = NULL, tags = NULL) {
  body <- list(artifact_location = artifact_location, name = name, tags = tags)
  .state$api$do("POST", "/api/2.0/mlflow/experiments/create", body = body)
}
experiments$create_experiment <- experiments_create_experiment

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
#' @rdname experiments_create_run
#'
#' @aliases experiments_create_run
experiments_create_run <- function(experiment_id = NULL, start_time = NULL, tags = NULL,
  user_id = NULL) {
  body <- list(experiment_id = experiment_id, start_time = start_time, tags = tags,
    user_id = user_id)
  .state$api$do("POST", "/api/2.0/mlflow/runs/create", body = body)
}
experiments$create_run <- experiments_create_run

#' Delete an experiment.
#' 
#' Marks an experiment and associated metadata, runs, metrics, params, and tags
#' for deletion. If the experiment uses FileStore, artifacts associated with
#' experiment are also deleted.
#'
#' @param experiment_id Required. ID of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_delete_experiment
#'
#' @aliases experiments_delete_experiment
experiments_delete_experiment <- function(experiment_id) {
  body <- list(experiment_id = experiment_id)
  .state$api$do("POST", "/api/2.0/mlflow/experiments/delete", body = body)
}
experiments$delete_experiment <- experiments_delete_experiment

#' Delete a run.
#' 
#' Marks a run for deletion.
#'
#' @param run_id Required. ID of the run to delete.
#'
#' @keywords internal
#'
#' @rdname experiments_delete_run
#'
#' @aliases experiments_delete_run
experiments_delete_run <- function(run_id) {
  body <- list(run_id = run_id)
  .state$api$do("POST", "/api/2.0/mlflow/runs/delete", body = body)
}
experiments$delete_run <- experiments_delete_run

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
#' @rdname experiments_delete_tag
#'
#' @aliases experiments_delete_tag
experiments_delete_tag <- function(run_id, key) {
  body <- list(key = key, run_id = run_id)
  .state$api$do("POST", "/api/2.0/mlflow/runs/delete-tag", body = body)
}
experiments$delete_tag <- experiments_delete_tag

#' Get metadata.
#' 
#' Gets metadata for an experiment.
#' 
#' This endpoint will return deleted experiments, but prefers the active
#' experiment if an active and deleted experiment share the same name. If
#' multiple deleted experiments share the same name, the API will return one of
#' them.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no experiment with the specified name
#' exists.
#'
#' @param experiment_name Required. Name of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_get_by_name
#'
#' @aliases experiments_get_by_name
experiments_get_by_name <- function(experiment_name) {
  query <- list(experiment_name = experiment_name)
  .state$api$do("GET", "/api/2.0/mlflow/experiments/get-by-name", query = query)
}
experiments$get_by_name <- experiments_get_by_name

#' Get an experiment.
#' 
#' Gets metadata for an experiment. This method works on deleted experiments.
#'
#' @param experiment_id Required. ID of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_get_experiment
#'
#' @aliases experiments_get_experiment
experiments_get_experiment <- function(experiment_id) {
  query <- list(experiment_id = experiment_id)
  .state$api$do("GET", "/api/2.0/mlflow/experiments/get", query = query)
}
experiments$get_experiment <- experiments_get_experiment

#' Get history of a given metric within a run.
#' 
#' Gets a list of all values for the specified metric for a given run.
#'
#' @param max_results Maximum number of Metric records to return per paginated request.
#' @param metric_key Required. Name of the metric.
#' @param page_token Token indicating the page of metric histories to fetch.
#' @param run_id ID of the run from which to fetch metric values.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run from which to fetch metric values.
#'
#' @keywords internal
#'
#' @rdname experiments_get_history
#'
#' @aliases experiments_get_history
experiments_get_history <- function(metric_key, max_results = NULL, page_token = NULL,
  run_id = NULL, run_uuid = NULL) {
  query <- list(max_results = max_results, metric_key = metric_key, page_token = page_token,
    run_id = run_id, run_uuid = run_uuid)
  .state$api$do("GET", "/api/2.0/mlflow/metrics/get-history", query = query)
}
experiments$get_history <- experiments_get_history

#' Get a run.
#' 
#' Gets the metadata, metrics, params, and tags for a run. In the case where
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
#' @rdname experiments_get_run
#'
#' @aliases experiments_get_run
experiments_get_run <- function(run_id, run_uuid = NULL) {
  query <- list(run_id = run_id, run_uuid = run_uuid)
  .state$api$do("GET", "/api/2.0/mlflow/runs/get", query = query)
}
experiments$get_run <- experiments_get_run

#' Get all artifacts.
#' 
#' List artifacts for a run. Takes an optional `artifact_path` prefix. If it is
#' specified, the response contains only artifacts with the specified prefix.',
#'
#' @param page_token Token indicating the page of artifact results to fetch.
#' @param path Filter artifacts matching this path (a relative path from the root artifact directory).
#' @param run_id ID of the run whose artifacts to list.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run whose artifacts to list.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname experiments_list_artifacts
#'
#' @aliases experiments_list_artifacts
experiments_list_artifacts <- function(page_token = NULL, path = NULL, run_id = NULL,
  run_uuid = NULL) {
  query <- list(page_token = page_token, path = path, run_id = run_id, run_uuid = run_uuid)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/mlflow/artifacts/list", query = query)
    if (is.null(nrow(json$files))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$files)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
experiments$list_artifacts <- experiments_list_artifacts

#' List experiments.
#' 
#' Gets a list of all experiments.
#'
#' @param max_results Maximum number of experiments desired.
#' @param page_token Token indicating the page of experiments to fetch.
#' @param view_type Qualifier for type of experiments to be returned.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname experiments_list_experiments
#'
#' @aliases experiments_list_experiments
experiments_list_experiments <- function(max_results = NULL, page_token = NULL, view_type = NULL) {
  query <- list(max_results = max_results, page_token = page_token, view_type = view_type)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/mlflow/experiments/list", query = query)
    if (is.null(nrow(json$experiments))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$experiments)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
experiments$list_experiments <- experiments_list_experiments

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
#' * No more than 1000 metrics, params, and tags in total * Up to 1000 metrics *
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
#' @rdname experiments_log_batch
#'
#' @aliases experiments_log_batch
experiments_log_batch <- function(metrics = NULL, params = NULL, run_id = NULL, tags = NULL) {
  body <- list(metrics = metrics, params = params, run_id = run_id, tags = tags)
  .state$api$do("POST", "/api/2.0/mlflow/runs/log-batch", body = body)
}
experiments$log_batch <- experiments_log_batch

#' Log inputs to a run.
#' 
#' **NOTE:** Experimental: This API may change or be removed in a future release
#' without warning.
#'
#' @param datasets Dataset inputs.
#' @param run_id ID of the run to log under.
#'
#' @keywords internal
#'
#' @rdname experiments_log_inputs
#'
#' @aliases experiments_log_inputs
experiments_log_inputs <- function(datasets = NULL, run_id = NULL) {
  body <- list(datasets = datasets, run_id = run_id)
  .state$api$do("POST", "/api/2.0/mlflow/runs/log-inputs", body = body)
}
experiments$log_inputs <- experiments_log_inputs

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
#' @rdname experiments_log_metric
#'
#' @aliases experiments_log_metric
experiments_log_metric <- function(key, value, timestamp, run_id = NULL, run_uuid = NULL,
  step = NULL) {
  body <- list(key = key, run_id = run_id, run_uuid = run_uuid, step = step, timestamp = timestamp,
    value = value)
  .state$api$do("POST", "/api/2.0/mlflow/runs/log-metric", body = body)
}
experiments$log_metric <- experiments_log_metric

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
#' @rdname experiments_log_model
#'
#' @aliases experiments_log_model
experiments_log_model <- function(model_json = NULL, run_id = NULL) {
  body <- list(model_json = model_json, run_id = run_id)
  .state$api$do("POST", "/api/2.0/mlflow/runs/log-model", body = body)
}
experiments$log_model <- experiments_log_model

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
#' @rdname experiments_log_param
#'
#' @aliases experiments_log_param
experiments_log_param <- function(key, value, run_id = NULL, run_uuid = NULL) {
  body <- list(key = key, run_id = run_id, run_uuid = run_uuid, value = value)
  .state$api$do("POST", "/api/2.0/mlflow/runs/log-parameter", body = body)
}
experiments$log_param <- experiments_log_param

#' Restores an experiment.
#' 
#' Restore an experiment marked for deletion. This also restores associated
#' metadata, runs, metrics, params, and tags. If experiment uses FileStore,
#' underlying artifacts associated with experiment are also restored.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if experiment was never created or was
#' permanently deleted.
#'
#' @param experiment_id Required. ID of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_restore_experiment
#'
#' @aliases experiments_restore_experiment
experiments_restore_experiment <- function(experiment_id) {
  body <- list(experiment_id = experiment_id)
  .state$api$do("POST", "/api/2.0/mlflow/experiments/restore", body = body)
}
experiments$restore_experiment <- experiments_restore_experiment

#' Restore a run.
#' 
#' Restores a deleted run.
#'
#' @param run_id Required. ID of the run to restore.
#'
#' @keywords internal
#'
#' @rdname experiments_restore_run
#'
#' @aliases experiments_restore_run
experiments_restore_run <- function(run_id) {
  body <- list(run_id = run_id)
  .state$api$do("POST", "/api/2.0/mlflow/runs/restore", body = body)
}
experiments$restore_run <- experiments_restore_run

#' Search experiments.
#' 
#' Searches for experiments that satisfy specified search criteria.
#'
#' @param filter String representing a SQL filter condition (e.g.
#' @param max_results Maximum number of experiments desired.
#' @param order_by List of columns for ordering search results, which can include experiment name and last updated timestamp with an optional 'DESC' or 'ASC' annotation, where 'ASC' is the default.
#' @param page_token Token indicating the page of experiments to fetch.
#' @param view_type Qualifier for type of experiments to be returned.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname experiments_search_experiments
#'
#' @aliases experiments_search_experiments
experiments_search_experiments <- function(filter = NULL, max_results = NULL, order_by = NULL,
  page_token = NULL, view_type = NULL) {
  body <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token, view_type = view_type)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("POST", "/api/2.0/mlflow/experiments/search", body = body)
    if (is.null(nrow(json$experiments))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$experiments)
    if (is.null(json$next_page_token)) {
      break
    }
    body$page_token <- json$next_page_token
  }
  return(results)

}
experiments$search_experiments <- experiments_search_experiments

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
#' @rdname experiments_search_runs
#'
#' @aliases experiments_search_runs
experiments_search_runs <- function(experiment_ids = NULL, filter = NULL, max_results = NULL,
  order_by = NULL, page_token = NULL, run_view_type = NULL) {
  body <- list(experiment_ids = experiment_ids, filter = filter, max_results = max_results,
    order_by = order_by, page_token = page_token, run_view_type = run_view_type)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("POST", "/api/2.0/mlflow/runs/search", body = body)
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
experiments$search_runs <- experiments_search_runs

#' Set a tag.
#' 
#' Sets a tag on an experiment. Experiment tags are metadata that can be
#' updated.
#'
#' @param experiment_id Required. ID of the experiment under which to log the tag.
#' @param key Required. Name of the tag.
#' @param value Required. String value of the tag being logged.
#'
#' @keywords internal
#'
#' @rdname experiments_set_experiment_tag
#'
#' @aliases experiments_set_experiment_tag
experiments_set_experiment_tag <- function(experiment_id, key, value) {
  body <- list(experiment_id = experiment_id, key = key, value = value)
  .state$api$do("POST", "/api/2.0/mlflow/experiments/set-experiment-tag", body = body)
}
experiments$set_experiment_tag <- experiments_set_experiment_tag

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
#' @rdname experiments_set_tag
#'
#' @aliases experiments_set_tag
experiments_set_tag <- function(key, value, run_id = NULL, run_uuid = NULL) {
  body <- list(key = key, run_id = run_id, run_uuid = run_uuid, value = value)
  .state$api$do("POST", "/api/2.0/mlflow/runs/set-tag", body = body)
}
experiments$set_tag <- experiments_set_tag

#' Update an experiment.
#' 
#' Updates experiment metadata.
#'
#' @param experiment_id Required. ID of the associated experiment.
#' @param new_name If provided, the experiment's name is changed to the new name.
#'
#' @keywords internal
#'
#' @rdname experiments_update_experiment
#'
#' @aliases experiments_update_experiment
experiments_update_experiment <- function(experiment_id, new_name = NULL) {
  body <- list(experiment_id = experiment_id, new_name = new_name)
  .state$api$do("POST", "/api/2.0/mlflow/experiments/update", body = body)
}
experiments$update_experiment <- experiments_update_experiment

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
#' @rdname experiments_update_run
#'
#' @aliases experiments_update_run
experiments_update_run <- function(end_time = NULL, run_id = NULL, run_uuid = NULL,
  status = NULL) {
  body <- list(end_time = end_time, run_id = run_id, run_uuid = run_uuid, status = status)
  .state$api$do("POST", "/api/2.0/mlflow/runs/update", body = body)
}
experiments$update_run <- experiments_update_run

