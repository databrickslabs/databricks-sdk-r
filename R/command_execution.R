# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' This API allows execution of Python, Scala, SQL, or R commands on running
#' Databricks Clusters.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=command_execution_cancel]{cancel} \tab Cancel a command.\cr
#'  \link[=command_execution_command_status]{command_status} \tab Get command info.\cr
#'  \link[=command_execution_context_status]{context_status} \tab Get status.\cr
#'  \link[=command_execution_create]{create} \tab Create an execution context.\cr
#'  \link[=command_execution_destroy]{destroy} \tab Delete an execution context.\cr
#'  \link[=command_execution_execute]{execute} \tab Run a command.\cr
#' }
#'
#' @rdname command_execution
#' @export
command_execution <- list()

#' Cancel a command.
#' 
#' Cancels a currently running command within an execution context.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#'
#' @description
#' This is a long-running operation, which blocks until Command Execution on Databricks reach
#' Cancelled state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Command Execution is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param cluster_id 
#' @param command_id 
#' @param context_id 
#'
#' @keywords internal
#'
#' @rdname command_execution_cancel
#'
#' @aliases command_execution_cancel
command_execution_cancel <- function(cluster_id = NULL, command_id = NULL, context_id = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(clusterId = cluster_id, commandId = command_id, contextId = context_id)
  .state$api$do("POST", "/api/1.2/commands/cancel", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("Cancelled", c())
  failure_states <- c("Error", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- command_execution_command_status(cluster_id = cluster_id, command_id = command_id,
      context_id = context_id)
    status <- poll$status
    status_message <- paste("current status:", status)
    if (!is.null(poll$results)) {
      status_message <- poll$results$cause
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach Cancelled, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::command_execution_command_status(cluster_id=",
      cluster_id, "command_id=", command_id, "context_id=", context_id, ")")
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
command_execution$cancel <- command_execution_cancel

#' Get command info.
#' 
#' Gets the status of and, if available, the results from a currently executing
#' command.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#'
#' @param cluster_id Required. 
#' @param command_id Required. 
#' @param context_id Required. 
#'
#' @keywords internal
#'
#' @rdname command_execution_command_status
#'
#' @aliases command_execution_command_status
command_execution_command_status <- function(cluster_id, context_id, command_id) {
  query <- list(clusterId = cluster_id, commandId = command_id, contextId = context_id)
  .state$api$do("GET", "/api/1.2/commands/status", query = query)
}
command_execution$command_status <- command_execution_command_status

#' Get status.
#' 
#' Gets the status for an execution context.
#'
#' @param cluster_id Required. 
#' @param context_id Required. 
#'
#' @keywords internal
#'
#' @rdname command_execution_context_status
#'
#' @aliases command_execution_context_status
command_execution_context_status <- function(cluster_id, context_id) {
  query <- list(clusterId = cluster_id, contextId = context_id)
  .state$api$do("GET", "/api/1.2/contexts/status", query = query)
}
command_execution$context_status <- command_execution_context_status

#' Create an execution context.
#' 
#' Creates an execution context for running cluster commands.
#' 
#' If successful, this method returns the ID of the new execution context.
#'
#' @description
#' This is a long-running operation, which blocks until Command Execution on Databricks reach
#' Running state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Command Execution is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param cluster_id Running cluster id.
#' @param language 
#'
#' @keywords internal
#'
#' @rdname command_execution_create
#'
#' @aliases command_execution_create
command_execution_create <- function(cluster_id = NULL, language = NULL, timeout = 20,
  callback = cli_reporter) {
  body <- list(clusterId = cluster_id, language = language)
  op_response <- .state$api$do("POST", "/api/1.2/contexts/create", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("Running", c())
  failure_states <- c("Error", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- command_execution_context_status(cluster_id = cluster_id, context_id = op_response$id)
    status <- poll$status
    status_message <- paste("current status:", status)
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach Running, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::command_execution_context_status(cluster_id=",
      cluster_id, "context_id=", op_response$id, ")")
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
command_execution$create <- command_execution_create

#' Delete an execution context.
#' 
#' Deletes an execution context.
#'
#' @param cluster_id Required. 
#' @param context_id Required. 
#'
#' @keywords internal
#'
#' @rdname command_execution_destroy
#'
#' @aliases command_execution_destroy
command_execution_destroy <- function(cluster_id, context_id) {
  body <- list(clusterId = cluster_id, contextId = context_id)
  .state$api$do("POST", "/api/1.2/contexts/destroy", body = body)
}
command_execution$destroy <- command_execution_destroy

#' Run a command.
#' 
#' Runs a cluster command in the given execution context, using the provided
#' language.
#' 
#' If successful, it returns an ID for tracking the status of the command's
#' execution.
#'
#' @description
#' This is a long-running operation, which blocks until Command Execution on Databricks reach
#' Finished or Error state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Command Execution is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#'
#' @param cluster_id Running cluster id.
#' @param command Executable code.
#' @param context_id Running context id.
#' @param language 
#'
#' @keywords internal
#'
#' @rdname command_execution_execute
#'
#' @aliases command_execution_execute
command_execution_execute <- function(cluster_id = NULL, command = NULL, context_id = NULL,
  language = NULL, timeout = 20, callback = cli_reporter) {
  body <- list(clusterId = cluster_id, command = command, contextId = context_id,
    language = language)
  op_response <- .state$api$do("POST", "/api/1.2/commands/execute", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("Finished", "Error", c())
  failure_states <- c("Cancelled", "Cancelling", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- command_execution_command_status(cluster_id = cluster_id, command_id = op_response$id,
      context_id = context_id)
    status <- poll$status
    status_message <- paste("current status:", status)
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach Finished or Error, got ", status, "-",
        status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::command_execution_command_status(cluster_id=",
      cluster_id, "command_id=", op_response$id, "context_id=", context_id,
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
command_execution$execute <- command_execution_execute

