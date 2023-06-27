# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' The Jobs API allows you to create, edit, and delete jobs.
#' 
#' You can use a Databricks job to run a data processing or data analysis task
#' in a Databricks cluster with scalable resources. Your job can consist of a
#' single task or can be a large, multi-task workflow with complex dependencies.
#' Databricks manages the task orchestration, cluster management, monitoring,
#' and error reporting for all of your jobs. You can run your jobs immediately
#' or periodically through an easy-to-use scheduling system. You can implement
#' job tasks using notebooks, JARS, Delta Live Tables pipelines, or Python,
#' Scala, Spark submit, and Java applications.
#' 
#' You should never hard code secrets or store them in plain text. Use the
#' [Secrets CLI] to manage secrets in the [Databricks CLI]. Use the [Secrets
#' utility] to reference secrets in notebooks and jobs.
#' 
#' [Databricks CLI]: https://docs.databricks.com/dev-tools/cli/index.html
#' [Secrets CLI]: https://docs.databricks.com/dev-tools/cli/secrets-cli.html
#' [Secrets utility]: https://docs.databricks.com/dev-tools/databricks-utils.html#dbutils-secrets
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=jobs_cancel_all_runs]{cancel_all_runs} \tab Cancel all runs of a job.\cr
#'  \link[=jobs_cancel_run]{cancel_run} \tab Cancel a job run.\cr
#'  \link[=jobs_create]{create} \tab Create a new job.\cr
#'  \link[=jobs_delete]{delete} \tab Delete a job.\cr
#'  \link[=jobs_delete_run]{delete_run} \tab Delete a job run.\cr
#'  \link[=jobs_export_run]{export_run} \tab Export and retrieve a job run.\cr
#'  \link[=jobs_get]{get} \tab Get a single job.\cr
#'  \link[=jobs_get_run]{get_run} \tab Get a single job run.\cr
#'  \link[=jobs_get_run_output]{get_run_output} \tab Get the output for a single run.\cr
#'  \link[=jobs_list]{list} \tab List all jobs.\cr
#'  \link[=jobs_list_runs]{list_runs} \tab List runs for a job.\cr
#'  \link[=jobs_repair_run]{repair_run} \tab Repair a job run.\cr
#'  \link[=jobs_reset]{reset} \tab Overwrites all settings for a job.\cr
#'  \link[=jobs_run_now]{run_now} \tab Trigger a new job run.\cr
#'  \link[=jobs_submit]{submit} \tab Create and trigger a one-time run.\cr
#'  \link[=jobs_update]{update} \tab Partially update a job.\cr
#' }
#'
#' @rdname jobs
#' @export
jobs <- list()

#' Cancel all runs of a job.
#' 
#' Cancels all active runs of a job. The runs are canceled asynchronously, so it
#' doesn't prevent new runs from being started.
#'
#' @param job_id Required. The canonical identifier of the job to cancel all runs of.
#'
#' @keywords internal
#'
#' @rdname jobs_cancel_all_runs
#'
#' @aliases jobs_cancel_all_runs
jobs_cancel_all_runs <- function(job_id) {
  body <- list(job_id = job_id)
  .state$api$do("POST", "/api/2.1/jobs/runs/cancel-all", body = body)
}
jobs$cancel_all_runs <- jobs_cancel_all_runs

#' Cancel a job run.
#' 
#' Cancels a job run. The run is canceled asynchronously, so it may still be
#' running when this request completes.
#'
#' @description
#' This is a long-running operation, which blocks until Jobs on Databricks reach
#' TERMINATED or SKIPPED state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Jobs is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param run_id Required. This field is required.
#'
#' @keywords internal
#'
#' @rdname jobs_cancel_run
#'
#' @aliases jobs_cancel_run
jobs_cancel_run <- function(run_id, timeout = 20, callback = cli_reporter) {
  body <- list(run_id = run_id)
  .state$api$do("POST", "/api/2.1/jobs/runs/cancel", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("TERMINATED", "SKIPPED", c())
  failure_states <- c("INTERNAL_ERROR", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- jobs_get_run(run_id = run_id)
    status <- poll$state$life_cycle_state
    status_message <- paste("current status:", status)
    if (!is.null(poll$state)) {
      status_message <- poll$state$state_message
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach TERMINATED or SKIPPED, got ", status, "-",
        status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::jobs_get_run(run_id=", run_id, ")")
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
jobs$cancel_run <- jobs_cancel_run

#' Create a new job.
#' 
#' Create a new job.
#'
#' @param access_control_list List of permissions to set on the job.
#' @param continuous An optional continuous property for this job.
#' @param email_notifications An optional set of email addresses that is notified when runs of this job begin or complete as well as when this job is deleted.
#' @param format Used to tell what is the format of the job.
#' @param git_source An optional specification for a remote repository containing the notebooks used by this job's notebook tasks.
#' @param job_clusters A list of job cluster specifications that can be shared and reused by tasks of this job.
#' @param max_concurrent_runs An optional maximum allowed number of concurrent runs of the job.
#' @param name An optional name for the job.
#' @param notification_settings Optional notification settings that are used when sending notifications to each of the `email_notifications` and `webhook_notifications` for this job.
#' @param run_as Write-only setting, available only in Create/Update/Reset and Submit calls.
#' @param schedule An optional periodic schedule for this job.
#' @param tags A map of tags associated with the job.
#' @param tasks A list of task specifications to be executed by this job.
#' @param timeout_seconds An optional timeout applied to each run of this job.
#' @param trigger Trigger settings for the job.
#' @param webhook_notifications A collection of system notification IDs to notify when the run begins or completes.
#'
#' @keywords internal
#'
#' @rdname jobs_create
#'
#' @aliases jobs_create
jobs_create <- function(access_control_list = NULL, continuous = NULL, email_notifications = NULL,
  format = NULL, git_source = NULL, job_clusters = NULL, max_concurrent_runs = NULL,
  name = NULL, notification_settings = NULL, run_as = NULL, schedule = NULL, tags = NULL,
  tasks = NULL, timeout_seconds = NULL, trigger = NULL, webhook_notifications = NULL) {
  body <- list(access_control_list = access_control_list, continuous = continuous,
    email_notifications = email_notifications, format = format, git_source = git_source,
    job_clusters = job_clusters, max_concurrent_runs = max_concurrent_runs, name = name,
    notification_settings = notification_settings, run_as = run_as, schedule = schedule,
    tags = tags, tasks = tasks, timeout_seconds = timeout_seconds, trigger = trigger,
    webhook_notifications = webhook_notifications)
  .state$api$do("POST", "/api/2.1/jobs/create", body = body)
}
jobs$create <- jobs_create

#' Delete a job.
#' 
#' Deletes a job.
#'
#' @param job_id Required. The canonical identifier of the job to delete.
#'
#' @keywords internal
#'
#' @rdname jobs_delete
#'
#' @aliases jobs_delete
jobs_delete <- function(job_id) {
  body <- list(job_id = job_id)
  .state$api$do("POST", "/api/2.1/jobs/delete", body = body)
}
jobs$delete <- jobs_delete

#' Delete a job run.
#' 
#' Deletes a non-active run. Returns an error if the run is active.
#'
#' @param run_id Required. The canonical identifier of the run for which to retrieve the metadata.
#'
#' @keywords internal
#'
#' @rdname jobs_delete_run
#'
#' @aliases jobs_delete_run
jobs_delete_run <- function(run_id) {
  body <- list(run_id = run_id)
  .state$api$do("POST", "/api/2.1/jobs/runs/delete", body = body)
}
jobs$delete_run <- jobs_delete_run

#' Export and retrieve a job run.
#' 
#' Export and retrieve the job run task.
#'
#' @param run_id Required. The canonical identifier for the run.
#' @param views_to_export Which views to export (CODE, DASHBOARDS, or ALL).
#'
#' @keywords internal
#'
#' @rdname jobs_export_run
#'
#' @aliases jobs_export_run
jobs_export_run <- function(run_id, views_to_export = NULL) {
  query <- list(run_id = run_id, views_to_export = views_to_export)
  .state$api$do("GET", "/api/2.1/jobs/runs/export", query = query)
}
jobs$export_run <- jobs_export_run

#' Get a single job.
#' 
#' Retrieves the details for a single job.
#'
#' @param job_id Required. The canonical identifier of the job to retrieve information about.
#'
#' @keywords internal
#'
#' @rdname jobs_get
#'
#' @aliases jobs_get
jobs_get <- function(job_id) {
  query <- list(job_id = job_id)
  .state$api$do("GET", "/api/2.1/jobs/get", query = query)
}
jobs$get <- jobs_get

#' Get a single job run.
#' 
#' Retrieve the metadata of a run.
#'
#' @description
#' This is a long-running operation, which blocks until Jobs on Databricks reach
#' TERMINATED or SKIPPED state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Jobs is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param include_history Whether to include the repair history in the response.
#' @param run_id Required. The canonical identifier of the run for which to retrieve the metadata.
#'
#' @keywords internal
#'
#' @rdname jobs_get_run
#'
#' @aliases jobs_get_run
jobs_get_run <- function(run_id, include_history = NULL, timeout = 20, callback = cli_reporter) {
  query <- list(include_history = include_history, run_id = run_id)
  op_response <- .state$api$do("GET", "/api/2.1/jobs/runs/get", query = query)
  started <- as.numeric(Sys.time())
  target_states <- c("TERMINATED", "SKIPPED", c())
  failure_states <- c("INTERNAL_ERROR", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- jobs_get_run(run_id = op_response$run_id)
    status <- poll$state$life_cycle_state
    status_message <- paste("current status:", status)
    if (!is.null(poll$state)) {
      status_message <- poll$state$state_message
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach TERMINATED or SKIPPED, got ", status, "-",
        status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::jobs_get_run(run_id=", op_response$run_id,
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
jobs$get_run <- jobs_get_run

#' Get the output for a single run.
#' 
#' Retrieve the output and metadata of a single task run. When a notebook task
#' returns a value through the `dbutils.notebook.exit()` call, you can use this
#' endpoint to retrieve that value. Databricks restricts this API to returning
#' the first 5 MB of the output. To return a larger result, you can store job
#' results in a cloud storage service.
#' 
#' This endpoint validates that the __run_id__ parameter is valid and returns an
#' HTTP status code 400 if the __run_id__ parameter is invalid. Runs are
#' automatically removed after 60 days. If you to want to reference them beyond
#' 60 days, you must save old run results before they expire.
#'
#' @param run_id Required. The canonical identifier for the run.
#'
#' @keywords internal
#'
#' @rdname jobs_get_run_output
#'
#' @aliases jobs_get_run_output
jobs_get_run_output <- function(run_id) {
  query <- list(run_id = run_id)
  .state$api$do("GET", "/api/2.1/jobs/runs/get-output", query = query)
}
jobs$get_run_output <- jobs_get_run_output

#' List all jobs.
#' 
#' Retrieves a list of jobs.
#'
#' @param expand_tasks Whether to include task and cluster details in the response.
#' @param limit The number of jobs to return.
#' @param name A filter on the list based on the exact (case insensitive) job name.
#' @param offset The offset of the first job to return, relative to the most recently created job.
#' @param page_token Use `next_page_token` or `prev_page_token` returned from the previous request to list the next or previous page of jobs respectively.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname jobs_list
#'
#' @aliases jobs_list
jobs_list <- function(expand_tasks = NULL, limit = NULL, name = NULL, offset = NULL,
  page_token = NULL) {
  query <- list(expand_tasks = expand_tasks, limit = limit, name = name, offset = offset,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.1/jobs/list", query = query)
    if (is.null(nrow(json$jobs))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$jobs)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
jobs$list <- jobs_list

#' List runs for a job.
#' 
#' List runs in descending order by start time.
#'
#' @param active_only If active_only is `true`, only active runs are included in the results; otherwise, lists both active and completed runs.
#' @param completed_only If completed_only is `true`, only completed runs are included in the results; otherwise, lists both active and completed runs.
#' @param expand_tasks Whether to include task and cluster details in the response.
#' @param job_id The job for which to list runs.
#' @param limit The number of runs to return.
#' @param offset The offset of the first run to return, relative to the most recent run.
#' @param page_token Use `next_page_token` or `prev_page_token` returned from the previous request to list the next or previous page of runs respectively.
#' @param run_type The type of runs to return.
#' @param start_time_from Show runs that started _at or after_ this value.
#' @param start_time_to Show runs that started _at or before_ this value.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname jobs_list_runs
#'
#' @aliases jobs_list_runs
jobs_list_runs <- function(active_only = NULL, completed_only = NULL, expand_tasks = NULL,
  job_id = NULL, limit = NULL, offset = NULL, page_token = NULL, run_type = NULL,
  start_time_from = NULL, start_time_to = NULL) {
  query <- list(active_only = active_only, completed_only = completed_only, expand_tasks = expand_tasks,
    job_id = job_id, limit = limit, offset = offset, page_token = page_token,
    run_type = run_type, start_time_from = start_time_from, start_time_to = start_time_to)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.1/jobs/runs/list", query = query)
    if (is.null(nrow(json$runs))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$runs)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
jobs$list_runs <- jobs_list_runs

#' Repair a job run.
#' 
#' Re-run one or more tasks. Tasks are re-run as part of the original job run.
#' They use the current job and task settings, and can be viewed in the history
#' for the original job run.
#'
#' @description
#' This is a long-running operation, which blocks until Jobs on Databricks reach
#' TERMINATED or SKIPPED state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Jobs is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param dbt_commands An array of commands to execute for jobs with the dbt task, for example `'dbt_commands': ['dbt deps', 'dbt seed', 'dbt run']`.
#' @param jar_params A list of parameters for jobs with Spark JAR tasks, for example `\'jar_params\': [\'john doe\', \'35\']`.
#' @param latest_repair_id The ID of the latest repair.
#' @param notebook_params A map from keys to values for jobs with notebook task, for example `\'notebook_params\': {\'name\': \'john doe\', \'age\': \'35\'}`.
#' @param pipeline_params 
#' @param python_named_params A map from keys to values for jobs with Python wheel task, for example `'python_named_params': {'name': 'task', 'data': 'dbfs:/path/to/data.json'}`.
#' @param python_params A list of parameters for jobs with Python tasks, for example `\'python_params\': [\'john doe\', \'35\']`.
#' @param rerun_all_failed_tasks If true, repair all failed tasks.
#' @param rerun_tasks The task keys of the task runs to repair.
#' @param run_id Required. The job run ID of the run to repair.
#' @param spark_submit_params A list of parameters for jobs with spark submit task, for example `\'spark_submit_params\': [\'--class\', \'org.apache.spark.examples.SparkPi\']`.
#' @param sql_params A map from keys to values for jobs with SQL task, for example `'sql_params': {'name': 'john doe', 'age': '35'}`.
#'
#' @keywords internal
#'
#' @rdname jobs_repair_run
#'
#' @aliases jobs_repair_run
jobs_repair_run <- function(run_id, dbt_commands = NULL, jar_params = NULL, latest_repair_id = NULL,
  notebook_params = NULL, pipeline_params = NULL, python_named_params = NULL, python_params = NULL,
  rerun_all_failed_tasks = NULL, rerun_tasks = NULL, spark_submit_params = NULL,
  sql_params = NULL, timeout = 20, callback = cli_reporter) {
  body <- list(dbt_commands = dbt_commands, jar_params = jar_params, latest_repair_id = latest_repair_id,
    notebook_params = notebook_params, pipeline_params = pipeline_params, python_named_params = python_named_params,
    python_params = python_params, rerun_all_failed_tasks = rerun_all_failed_tasks,
    rerun_tasks = rerun_tasks, run_id = run_id, spark_submit_params = spark_submit_params,
    sql_params = sql_params)
  op_response <- .state$api$do("POST", "/api/2.1/jobs/runs/repair", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("TERMINATED", "SKIPPED", c())
  failure_states <- c("INTERNAL_ERROR", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- jobs_get_run(run_id = run_id)
    status <- poll$state$life_cycle_state
    status_message <- paste("current status:", status)
    if (!is.null(poll$state)) {
      status_message <- poll$state$state_message
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach TERMINATED or SKIPPED, got ", status, "-",
        status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::jobs_get_run(run_id=", run_id, ")")
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
jobs$repair_run <- jobs_repair_run

#' Overwrites all settings for a job.
#' 
#' Overwrites all the settings for a specific job. Use the Update endpoint to
#' update job settings partially.
#'
#' @param job_id Required. The canonical identifier of the job to reset.
#' @param new_settings Required. The new settings of the job.
#'
#' @keywords internal
#'
#' @rdname jobs_reset
#'
#' @aliases jobs_reset
jobs_reset <- function(job_id, new_settings) {
  body <- list(job_id = job_id, new_settings = new_settings)
  .state$api$do("POST", "/api/2.1/jobs/reset", body = body)
}
jobs$reset <- jobs_reset

#' Trigger a new job run.
#' 
#' Run a job and return the `run_id` of the triggered run.
#'
#' @description
#' This is a long-running operation, which blocks until Jobs on Databricks reach
#' TERMINATED or SKIPPED state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Jobs is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param dbt_commands An array of commands to execute for jobs with the dbt task, for example `'dbt_commands': ['dbt deps', 'dbt seed', 'dbt run']`.
#' @param idempotency_token An optional token to guarantee the idempotency of job run requests.
#' @param jar_params A list of parameters for jobs with Spark JAR tasks, for example `\'jar_params\': [\'john doe\', \'35\']`.
#' @param job_id Required. The ID of the job to be executed.
#' @param notebook_params A map from keys to values for jobs with notebook task, for example `\'notebook_params\': {\'name\': \'john doe\', \'age\': \'35\'}`.
#' @param pipeline_params 
#' @param python_named_params A map from keys to values for jobs with Python wheel task, for example `'python_named_params': {'name': 'task', 'data': 'dbfs:/path/to/data.json'}`.
#' @param python_params A list of parameters for jobs with Python tasks, for example `\'python_params\': [\'john doe\', \'35\']`.
#' @param spark_submit_params A list of parameters for jobs with spark submit task, for example `\'spark_submit_params\': [\'--class\', \'org.apache.spark.examples.SparkPi\']`.
#' @param sql_params A map from keys to values for jobs with SQL task, for example `'sql_params': {'name': 'john doe', 'age': '35'}`.
#'
#' @keywords internal
#'
#' @rdname jobs_run_now
#'
#' @aliases jobs_run_now
jobs_run_now <- function(job_id, dbt_commands = NULL, idempotency_token = NULL, jar_params = NULL,
  notebook_params = NULL, pipeline_params = NULL, python_named_params = NULL, python_params = NULL,
  spark_submit_params = NULL, sql_params = NULL, timeout = 20, callback = cli_reporter) {
  body <- list(dbt_commands = dbt_commands, idempotency_token = idempotency_token,
    jar_params = jar_params, job_id = job_id, notebook_params = notebook_params,
    pipeline_params = pipeline_params, python_named_params = python_named_params,
    python_params = python_params, spark_submit_params = spark_submit_params,
    sql_params = sql_params)
  op_response <- .state$api$do("POST", "/api/2.1/jobs/run-now", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("TERMINATED", "SKIPPED", c())
  failure_states <- c("INTERNAL_ERROR", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- jobs_get_run(run_id = op_response$run_id)
    status <- poll$state$life_cycle_state
    status_message <- paste("current status:", status)
    if (!is.null(poll$state)) {
      status_message <- poll$state$state_message
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach TERMINATED or SKIPPED, got ", status, "-",
        status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::jobs_get_run(run_id=", op_response$run_id,
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
jobs$run_now <- jobs_run_now

#' Create and trigger a one-time run.
#' 
#' Submit a one-time run. This endpoint allows you to submit a workload directly
#' without creating a job. Runs submitted using this endpoint don’t display in
#' the UI. Use the `jobs/runs/get` API to check the run state after the job is
#' submitted.
#'
#' @description
#' This is a long-running operation, which blocks until Jobs on Databricks reach
#' TERMINATED or SKIPPED state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Jobs is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param access_control_list List of permissions to set on the job.
#' @param git_source An optional specification for a remote repository containing the notebooks used by this job's notebook tasks.
#' @param idempotency_token An optional token that can be used to guarantee the idempotency of job run requests.
#' @param notification_settings Optional notification settings that are used when sending notifications to each of the `webhook_notifications` for this run.
#' @param run_name An optional name for the run.
#' @param tasks 
#' @param timeout_seconds An optional timeout applied to each run of this job.
#' @param webhook_notifications A collection of system notification IDs to notify when the run begins or completes.
#'
#' @keywords internal
#'
#' @rdname jobs_submit
#'
#' @aliases jobs_submit
jobs_submit <- function(access_control_list = NULL, git_source = NULL, idempotency_token = NULL,
  notification_settings = NULL, run_name = NULL, tasks = NULL, timeout_seconds = NULL,
  webhook_notifications = NULL, timeout = 20, callback = cli_reporter) {
  body <- list(access_control_list = access_control_list, git_source = git_source,
    idempotency_token = idempotency_token, notification_settings = notification_settings,
    run_name = run_name, tasks = tasks, timeout_seconds = timeout_seconds, webhook_notifications = webhook_notifications)
  op_response <- .state$api$do("POST", "/api/2.1/jobs/runs/submit", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("TERMINATED", "SKIPPED", c())
  failure_states <- c("INTERNAL_ERROR", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- jobs_get_run(run_id = op_response$run_id)
    status <- poll$state$life_cycle_state
    status_message <- paste("current status:", status)
    if (!is.null(poll$state)) {
      status_message <- poll$state$state_message
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach TERMINATED or SKIPPED, got ", status, "-",
        status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::jobs_get_run(run_id=", op_response$run_id,
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
jobs$submit <- jobs_submit

#' Partially update a job.
#' 
#' Add, update, or remove specific settings of an existing job. Use the ResetJob
#' to overwrite all job settings.
#'
#' @param fields_to_remove Remove top-level fields in the job settings.
#' @param job_id Required. The canonical identifier of the job to update.
#' @param new_settings The new settings for the job.
#'
#' @keywords internal
#'
#' @rdname jobs_update
#'
#' @aliases jobs_update
jobs_update <- function(job_id, fields_to_remove = NULL, new_settings = NULL) {
  body <- list(fields_to_remove = fields_to_remove, job_id = job_id, new_settings = new_settings)
  .state$api$do("POST", "/api/2.1/jobs/update", body = body)
}
jobs$update <- jobs_update

