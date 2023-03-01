# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Cancel a command.
#' 
#' Cancels a currently running command within an execution context.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#'
#' @param cluster_id 
#' @param command_id 
#' @param context_id 
databricks_command_execution_cancel <- function(cluster_id = NULL, 
    command_id = NULL, 
    context_id = NULL, 
    ...) {
    body <- list(
        cluster_id = cluster_id, 
        command_id = command_id, 
        context_id = context_id, ...)
    .api$do("POST", "/api/1.2/commands/cancel", body = body)
}

#' Get command info.
#' 
#' Gets the status of and, if available, the results from a currently executing
#' command.
#' 
#' The command ID is obtained from a prior successful call to __execute__.
#'
#' @param cluster_id 
#' @param command_id 
#' @param context_id 
databricks_command_execution_command_status <- function(cluster_id, context_id, command_id, ...) {
    query <- list(
        cluster_id = cluster_id, 
        command_id = command_id, 
        context_id = context_id, ...)
    .api$do("GET", "/api/1.2/commands/status", query = query)
}

#' Get status.
#' 
#' Gets the status for an execution context.
#'
#' @param cluster_id 
#' @param context_id 
databricks_command_execution_context_status <- function(cluster_id, context_id, ...) {
    query <- list(
        cluster_id = cluster_id, 
        context_id = context_id, ...)
    .api$do("GET", "/api/1.2/contexts/status", query = query)
}

#' Create an execution context.
#' 
#' Creates an execution context for running cluster commands.
#' 
#' If successful, this method returns the ID of the new execution context.
#'
#' @param cluster_id Running cluster id.
#' @param language 
databricks_command_execution_create <- function(cluster_id = NULL, 
    language = NULL, 
    ...) {
    body <- list(
        cluster_id = cluster_id, 
        language = language, ...)
    .api$do("POST", "/api/1.2/contexts/create", body = body)
}

#' Delete an execution context.
#' 
#' Deletes an execution context.
#'
#' @param cluster_id 
#' @param context_id 
databricks_command_execution_destroy <- function(cluster_id, context_id, ...) {
    body <- list(
        cluster_id = cluster_id, 
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
#' @param cluster_id Running cluster id.
#' @param command Executable code.
#' @param context_id Running context id.
#' @param language 
databricks_command_execution_execute <- function(cluster_id = NULL, 
    command = NULL, 
    context_id = NULL, 
    language = NULL, 
    ...) {
    body <- list(
        cluster_id = cluster_id, 
        command = command, 
        context_id = context_id, 
        language = language, ...)
    .api$do("POST", "/api/1.2/commands/execute", body = body)
}

