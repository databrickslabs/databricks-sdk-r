# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.


#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=transition_requests_approve]{approve} \tab Approve transition requests.\cr
#'  \link[=transition_requests_create]{create} \tab Make a transition request.\cr
#'  \link[=transition_requests_delete]{delete} \tab Delete a ransition request.\cr
#'  \link[=transition_requests_list]{list} \tab List transition requests.\cr
#'  \link[=transition_requests_reject]{reject} \tab Reject a transition request.\cr
#' }
#'
#' @rdname transition_requests
#' @export
transition_requests <- list()

#' Approve transition requests.
#' 
#' Approves a model version stage transition request.
#'
#' @param archive_existing_versions [required] Specifies whether to archive all current model versions in the target stage.
#' @param comment User-provided comment on the action.
#' @param name [required] Name of the model.
#' @param stage [required] Target stage of the transition.
#' @param version [required] Version of the model.
#'
#' @keywords internal
#'
#' @rdname transition_requests_approve
#'
#' @aliases transition_requests_approve
transition_requests_approve <- function(name, version, stage, archive_existing_versions,
  comment = NULL, ...) {
  body <- list(archive_existing_versions = archive_existing_versions, comment = comment,
    name = name, stage = stage, version = version, ...)

  .api$do("POST", "/api/2.0/mlflow/transition-requests/approve", body = body)
}
transition_requests$approve <- transition_requests_approve

#' Make a transition request.
#' 
#' Creates a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param name [required] Name of the model.
#' @param stage [required] Target stage of the transition.
#' @param version [required] Version of the model.
#'
#' @keywords internal
#'
#' @rdname transition_requests_create
#'
#' @aliases transition_requests_create
transition_requests_create <- function(name, version, stage, comment = NULL, ...) {
  body <- list(comment = comment, name = name, stage = stage, version = version,
    ...)

  .api$do("POST", "/api/2.0/mlflow/transition-requests/create", body = body)
}
transition_requests$create <- transition_requests_create

#' Delete a ransition request.
#' 
#' Cancels a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param creator [required] Username of the user who created this request.
#' @param name [required] Name of the model.
#' @param stage [required] Target stage of the transition request.
#' @param version [required] Version of the model.
#'
#' @keywords internal
#'
#' @rdname transition_requests_delete
#'
#' @aliases transition_requests_delete
transition_requests_delete <- function(name, version, stage, creator, comment = NULL,
  ...) {
  query <- list(comment = comment, creator = creator, name = name, stage = stage,
    version = version, ...)

  .api$do("DELETE", "/api/2.0/mlflow/transition-requests/delete", query = query)
}
transition_requests$delete <- transition_requests_delete

#' List transition requests.
#' 
#' Gets a list of all open stage transition requests for the model version.
#'
#' @param name [required] Name of the model.
#' @param version [required] Version of the model.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname transition_requests_list
#'
#' @aliases transition_requests_list
transition_requests_list <- function(name, version, ...) {
  query <- list(name = name, version = version, ...)


  json <- .api$do("GET", "/api/2.0/mlflow/transition-requests/list", query = query)
  return(json$requests)

}
transition_requests$list <- transition_requests_list

#' Reject a transition request.
#' 
#' Rejects a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param name [required] Name of the model.
#' @param stage [required] Target stage of the transition.
#' @param version [required] Version of the model.
#'
#' @keywords internal
#'
#' @rdname transition_requests_reject
#'
#' @aliases transition_requests_reject
transition_requests_reject <- function(name, version, stage, comment = NULL, ...) {
  body <- list(comment = comment, name = name, stage = stage, version = version,
    ...)

  .api$do("POST", "/api/2.0/mlflow/transition-requests/reject", body = body)
}
transition_requests$reject <- transition_requests_reject













