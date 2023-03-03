# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Cancel a command.
#' 
#' Cancels a currently running command within an execution context.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#'
#' @param clusterId 
#' @param command_id 
#' @param context_id 
databricks_command_execution_cancel <- function(clusterId = NULL, 
    command_id = NULL, 
    context_id = NULL, 
    timeout=20, ...) {
    body <- list(
        clusterId = clusterId, 
        command_id = command_id, 
        context_id = context_id, ...)
    
    .api$do("POST", "/api/1.2/commands/cancel", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("Cancelled", c())
    failure_states <- c("Error", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_command_execution_command_status(clusterId = clusterId, command_id = command_id, context_id = context_id)
        status <- poll$status
        status_message <- paste("current status:", status)
        if (!is.null(poll$results)) {
            status_message <- poll$results$cause
        }
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach Cancelled, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_command_execution_command_status(clusterId=", clusterId, "command_id=", command_id, "context_id=", context_id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
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
#'
#' @param clusterId 
#' @param command_id 
#' @param context_id 
databricks_command_execution_command_status <- function(clusterId, context_id, command_id, ...) {
    query <- list(
        clusterId = clusterId, 
        command_id = command_id, 
        context_id = context_id, ...)
    
    .api$do("GET", "/api/1.2/commands/status", query = query)
}

#' Get status.
#' 
#' Gets the status for an execution context.
#'
#' @param clusterId 
#' @param context_id 
databricks_command_execution_context_status <- function(clusterId, context_id, ...) {
    query <- list(
        clusterId = clusterId, 
        context_id = context_id, ...)
    
    .api$do("GET", "/api/1.2/contexts/status", query = query)
}

#' Create an execution context.
#' 
#' Creates an execution context for running cluster commands.
#' 
#' If successful, this method returns the ID of the new execution context.
#'
#' @param clusterId Running cluster id.
#' @param language 
databricks_command_execution_create <- function(clusterId = NULL, 
    language = NULL, 
    timeout=20, ...) {
    body <- list(
        clusterId = clusterId, 
        language = language, ...)
    
    op_response <- .api$do("POST", "/api/1.2/contexts/create", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("Running", c())
    failure_states <- c("Error", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_command_execution_context_status(clusterId = clusterId, context_id = op_response$id)
        status <- poll$status
        status_message <- paste("current status:", status)
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach Running, got ", status, "-", status_message)
            stop(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_command_execution_context_status(clusterId=", clusterId, "context_id=", op_response$id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
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
#'
#' @param clusterId 
#' @param context_id 
databricks_command_execution_destroy <- function(clusterId, context_id, ...) {
    body <- list(
        clusterId = clusterId, 
        context_id = context_id, ...)
    
    .api$do("POST", "/api/1.2/contexts/destroy", body = body)
}

#' Run a command.
#' 
#' Runs a cluster command in the given execution context, using the provided
#' language.
#' 
#' If successful, it returns an ID for tracking the status of the command's
#' execution.
#'
#' @param clusterId Running cluster id.
#' @param command Executable code.
#' @param context_id Running context id.
#' @param language 
databricks_command_execution_execute <- function(clusterId = NULL, 
    command = NULL, 
    context_id = NULL, 
    language = NULL, 
    timeout=20, ...) {
    body <- list(
        clusterId = clusterId, 
        command = command, 
        context_id = context_id, 
        language = language, ...)
    
    op_response <- .api$do("POST", "/api/1.2/commands/execute", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("Finished", "Error", c())
    failure_states <- c("Cancelled", "Cancelling", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_command_execution_command_status(clusterId = clusterId, command_id = op_response$id, context_id = context_id)
        status <- poll$status
        status_message <- paste("current status:", status)
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach Finished or Error, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_command_execution_command_status(clusterId=", clusterId, "command_id=", op_response$id, "context_id=", context_id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
        random_pause <- runif(1, min = 0.1, max = 0.5)
        Sys.sleep(sleep + random_pause)
        attempt <- attempt + 1
    }
    msg <- paste("timed out after", timeout, "minutes:", status_message)
    rlang::abort(msg, call = rlang::caller_env())
}













