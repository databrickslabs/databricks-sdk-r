# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id 
#' @param command_id 
#' @param context_id 
#'
#' @rdname commandExecutionCancel
commandExecutionCancel <- function(client, cluster_id = NULL, command_id = NULL,
  context_id = NULL, timeout = 20, callback = cli_reporter) {
  body <- list(clusterId = cluster_id, commandId = command_id, contextId = context_id)
  client$do("POST", "/api/1.2/commands/cancel", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("Cancelled", c())
  failure_states <- c("Error", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- commandExecutionCommandStatus(client, cluster_id = cluster_id, command_id = command_id,
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
    prefix <- paste0("databricks::commandExecutionCommandStatus(cluster_id=",
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

#' Get command info.
#' 
#' Gets the status of and, if available, the results from a currently executing
#' command.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. 
#' @param command_id Required. 
#' @param context_id Required. 
#'
#' @rdname commandExecutionCommandStatus
commandExecutionCommandStatus <- function(client, cluster_id, context_id, command_id) {
  query <- list(clusterId = cluster_id, commandId = command_id, contextId = context_id)
  client$do("GET", "/api/1.2/commands/status", query = query)
}

#' Get status.
#' 
#' Gets the status for an execution context.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. 
#' @param context_id Required. 
#'
#' @rdname commandExecutionContextStatus
commandExecutionContextStatus <- function(client, cluster_id, context_id) {
  query <- list(clusterId = cluster_id, contextId = context_id)
  client$do("GET", "/api/1.2/contexts/status", query = query)
}

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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Running cluster id.
#' @param language 
#'
#' @rdname commandExecutionCreate
commandExecutionCreate <- function(client, cluster_id = NULL, language = NULL, timeout = 20,
  callback = cli_reporter) {
  body <- list(clusterId = cluster_id, language = language)
  op_response <- client$do("POST", "/api/1.2/contexts/create", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("Running", c())
  failure_states <- c("Error", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- commandExecutionContextStatus(client, cluster_id = cluster_id, context_id = op_response$id)
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
    prefix <- paste0("databricks::commandExecutionContextStatus(cluster_id=",
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

#' Delete an execution context.
#' 
#' Deletes an execution context.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. 
#' @param context_id Required. 
#'
#' @rdname commandExecutionDestroy
commandExecutionDestroy <- function(client, cluster_id, context_id) {
  body <- list(clusterId = cluster_id, contextId = context_id)
  client$do("POST", "/api/1.2/contexts/destroy", body = body)
}

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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Running cluster id.
#' @param command Executable code.
#' @param context_id Running context id.
#' @param language 
#'
#' @rdname commandExecutionExecute
commandExecutionExecute <- function(client, cluster_id = NULL, command = NULL, context_id = NULL,
  language = NULL, timeout = 20, callback = cli_reporter) {
  body <- list(clusterId = cluster_id, command = command, contextId = context_id,
    language = language)
  op_response <- client$do("POST", "/api/1.2/commands/execute", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("Finished", "Error", c())
  failure_states <- c("Cancelled", "Cancelling", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- commandExecutionCommandStatus(client, cluster_id = cluster_id, command_id = op_response$id,
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
    prefix <- paste0("databricks::commandExecutionCommandStatus(cluster_id=",
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

