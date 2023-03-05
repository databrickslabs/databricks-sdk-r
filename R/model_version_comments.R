# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL


#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=model_version_comments_create]{create} \tab Post a comment.\cr
#'  \link[=model_version_comments_delete]{delete} \tab Delete a comment.\cr
#'  \link[=model_version_comments_update]{update} \tab Update a comment.\cr
#' }
#'
#' @rdname model_version_comments
#' @export
model_version_comments <- list()

#' Post a comment.
#' 
#' Posts a comment on a model version. A comment can be submitted either by a
#' user or programmatically to display relevant information about the model. For
#' example, test results or deployment errors.
#'
#' @param comment Required. User-provided comment on the action.
#' @param name Required. Name of the model.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname model_version_comments_create
#'
#' @aliases model_version_comments_create
model_version_comments_create <- function(name, version, comment) {
  body <- list(comment = comment, name = name, version = version)
  .state$api$do("POST", "/api/2.0/mlflow/comments/create", body = body)
}
model_version_comments$create <- model_version_comments_create

#' Delete a comment.
#' 
#' Deletes a comment on a model version.
#'
#' @param id Required. 
#'
#' @keywords internal
#'
#' @rdname model_version_comments_delete
#'
#' @aliases model_version_comments_delete
model_version_comments_delete <- function(id) {
  query <- list(id = id)
  .state$api$do("DELETE", "/api/2.0/mlflow/comments/delete", query = query)
}
model_version_comments$delete <- model_version_comments_delete

#' Update a comment.
#' 
#' Post an edit to a comment on a model version.
#'
#' @param comment Required. User-provided comment on the action.
#' @param id Required. Unique identifier of an activity.
#'
#' @keywords internal
#'
#' @rdname model_version_comments_update
#'
#' @aliases model_version_comments_update
model_version_comments_update <- function(id, comment) {
  body <- list(comment = comment, id = id)
  .state$api$do("POST", "/api/2.0/mlflow/comments/update", body = body)
}
model_version_comments$update <- model_version_comments_update

