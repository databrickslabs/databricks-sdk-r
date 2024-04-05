# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Cancel a command.
#' 
#' Cancels a currently running command within an execution context.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id This field has no description yet.
#' @param command_id This field has no description yet.
#' @param context_id This field has no description yet.
#'
#'
#' @rdname cancel_command_execution
#' @alias commandExecutionCancel
#' @export
cancel_command_execution <- function(client, cluster_id = NULL, command_id = NULL,
  context_id = NULL) {
  body <- list(clusterId = cluster_id, commandId = command_id, contextId = context_id)
  client$do("POST", "/api/1.2/commands/cancel", body = body)
}

#' @rdname cancel_command_execution
#' @export 
commandExecutionCancel <- cancel_command_execution
#' Get command info.
#' 
#' Gets the status of and, if available, the results from a currently executing
#' command.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. This field has no description yet.
#' @param command_id Required. This field has no description yet.
#' @param context_id Required. This field has no description yet.
#'
#'
#' @rdname command_execution_status
#' @alias commandExecutionCommandStatus
#' @export
command_execution_status <- function(client, cluster_id, context_id, command_id) {
  query <- list(clusterId = cluster_id, commandId = command_id, contextId = context_id)
  client$do("GET", "/api/1.2/commands/status", query = query)
}

#' @rdname command_execution_status
#' @export 
commandExecutionCommandStatus <- command_execution_status
#' Get status.
#' 
#' Gets the status for an execution context.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. This field has no description yet.
#' @param context_id Required. This field has no description yet.
#'
#'
#' @rdname context_command_execution_status
#' @alias commandExecutionContextStatus
#' @export
context_command_execution_status <- function(client, cluster_id, context_id) {
  query <- list(clusterId = cluster_id, contextId = context_id)
  client$do("GET", "/api/1.2/contexts/status", query = query)
}

#' @rdname context_command_execution_status
#' @export 
commandExecutionContextStatus <- context_command_execution_status
#' Create an execution context.
#' 
#' Creates an execution context for running cluster commands.
#' 
#' If successful, this method returns the ID of the new execution context.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Running cluster id.
#' @param language This field has no description yet.
#'
#'
#' @rdname create_command_execution
#' @alias commandExecutionCreate
#' @export
create_command_execution <- function(client, cluster_id = NULL, language = NULL) {
  body <- list(clusterId = cluster_id, language = language)
  client$do("POST", "/api/1.2/contexts/create", body = body)
}

#' @rdname create_command_execution
#' @export 
commandExecutionCreate <- create_command_execution
#' Delete an execution context.
#' 
#' Deletes an execution context.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. This field has no description yet.
#' @param context_id Required. This field has no description yet.
#'
#'
#' @rdname destroy_command_execution
#' @alias commandExecutionDestroy
#' @export
destroy_command_execution <- function(client, cluster_id, context_id) {
  body <- list(clusterId = cluster_id, contextId = context_id)
  client$do("POST", "/api/1.2/contexts/destroy", body = body)
}

#' @rdname destroy_command_execution
#' @export 
commandExecutionDestroy <- destroy_command_execution
#' Run a command.
#' 
#' Runs a cluster command in the given execution context, using the provided
#' language.
#' 
#' If successful, it returns an ID for tracking the status of the command's
#' execution.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Running cluster id.
#' @param command Executable code.
#' @param context_id Running context id.
#' @param language This field has no description yet.
#'
#'
#' @rdname execute_command
#' @alias commandExecutionExecute
#' @export
execute_command <- function(client, cluster_id = NULL, command = NULL, context_id = NULL,
  language = NULL) {
  body <- list(clusterId = cluster_id, command = command, contextId = context_id,
    language = language)
  client$do("POST", "/api/1.2/commands/execute", body = body)
}

#' @rdname execute_command
#' @export 
commandExecutionExecute <- execute_command
#' Cancel a command.
#' 
#' Cancels a currently running command within an execution context.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Command Execution on Databricks reach
#' Cancelled state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Command Execution is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param cluster_id This field has no description yet.
#' @param command_id This field has no description yet.
#' @param context_id This field has no description yet.
#'
#' @rdname cancel_command_execution_and_wait
#' @export
cancel_command_execution_and_wait <- function(client, cluster_id = NULL, command_id = NULL,
  context_id = NULL, timeout = 20, callback = cli_reporter) {
  body <- list(clusterId = cluster_id, commandId = command_id, contextId = context_id)
  op_response <- client$do("POST", "/api/1.2/commands/cancel", body = body)
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



#' Create an execution context.
#' 
#' Creates an execution context for running cluster commands.
#' 
#' If successful, this method returns the ID of the new execution context.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Command Execution on Databricks reach
#' Running state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Command Execution is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param cluster_id Running cluster id.
#' @param language This field has no description yet.
#'
#' @rdname create_command_execution_and_wait
#' @export
create_command_execution_and_wait <- function(client, cluster_id = NULL, language = NULL,
  timeout = 20, callback = cli_reporter) {
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


#' Run a command.
#' 
#' Runs a cluster command in the given execution context, using the provided
#' language.
#' 
#' If successful, it returns an ID for tracking the status of the command's
#' execution.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Command Execution on Databricks reach
#' Finished or Error state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Command Execution is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param cluster_id Running cluster id.
#' @param command Executable code.
#' @param context_id Running context id.
#' @param language This field has no description yet.
#'
#' @rdname execute_command_and_wait
#' @export
execute_command_and_wait <- function(client, cluster_id = NULL, command = NULL, context_id = NULL,
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

