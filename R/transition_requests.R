# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Approve transition requests.
#' 
#' Approves a model version stage transition request.
#'
#' @param archive_existing_versions Specifies whether to archive all current model versions in the target stage.
#' @param comment User-provided comment on the action.
#' @param name Name of the model.
#' @param stage Target stage of the transition.
#' @param version Version of the model.
databricks_transition_requests_approve <- function(name, version, stage, archive_existing_versions, comment = NULL, 
    ...) {
    body <- list(
        archive_existing_versions = archive_existing_versions, 
        comment = comment, 
        name = name, 
        stage = stage, 
        version = version, ...)
    
    .api$do("POST", "/api/2.0/mlflow/transition-requests/approve", body = body)
}

#' Make a transition request.
#' 
#' Creates a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param name Name of the model.
#' @param stage Target stage of the transition.
#' @param version Version of the model.
databricks_transition_requests_create <- function(name, version, stage, comment = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, 
        stage = stage, 
        version = version, ...)
    
    .api$do("POST", "/api/2.0/mlflow/transition-requests/create", body = body)
}

#' Delete a ransition request.
#' 
#' Cancels a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param creator Username of the user who created this request.
#' @param name Name of the model.
#' @param stage Target stage of the transition request.
#' @param version Version of the model.
databricks_transition_requests_delete <- function(name, version, stage, creator, comment = NULL, 
    ...) {
    query <- list(
        comment = comment, 
        creator = creator, 
        name = name, 
        stage = stage, 
        version = version, ...)
    
    .api$do("DELETE", "/api/2.0/mlflow/transition-requests/delete", query = query)
}

#' List transition requests.
#' 
#' Gets a list of all open stage transition requests for the model version.
#'
#' @param name Name of the model.
#' @param version Version of the model.
databricks_transition_requests_list <- function(name, version, ...) {
    query <- list(
        name = name, 
        version = version, ...)
    
    
    json <- .api$do("GET", "/api/2.0/mlflow/transition-requests/list", query = query)
    return (json$requests)
    
}

#' Reject a transition request.
#' 
#' Rejects a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param name Name of the model.
#' @param stage Target stage of the transition.
#' @param version Version of the model.
databricks_transition_requests_reject <- function(name, version, stage, comment = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, 
        stage = stage, 
        version = version, ...)
    
    .api$do("POST", "/api/2.0/mlflow/transition-requests/reject", body = body)
}













