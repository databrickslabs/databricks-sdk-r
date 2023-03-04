# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Post a comment.
#' 
#' Posts a comment on a model version. A comment can be submitted either by a
#' user or programmatically to display relevant information about the model. For
#' example, test results or deployment errors.
#'
#' @param comment User-provided comment on the action.
#' @param name Name of the model.
#' @param version Version of the model.
model_version_comments_create <- function(name, version, comment, ...) {
    body <- list(
        comment = comment, 
        name = name, 
        version = version, ...)
    
    .api$do("POST", "/api/2.0/mlflow/comments/create", body = body)
}

#' Delete a comment.
#' 
#' Deletes a comment on a model version.
#'
#' @param id 
model_version_comments_delete <- function(id, ...) {
    query <- list(
        id = id, ...)
    
    .api$do("DELETE", "/api/2.0/mlflow/comments/delete", query = query)
}

#' Update a comment.
#' 
#' Post an edit to a comment on a model version.
#'
#' @param comment User-provided comment on the action.
#' @param id Unique identifier of an activity.
model_version_comments_update <- function(id, comment, ...) {
    body <- list(
        comment = comment, 
        id = id, ...)
    
    .api$do("POST", "/api/2.0/mlflow/comments/update", body = body)
}













