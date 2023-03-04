# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' The SQL Permissions API is similar to the endpoints of the
#' :method:permissions/set. However, this exposes only one endpoint, which gets
#' the Access Control List for a given object. You cannot modify any permissions
#' using this API.
#' 
#' There are three levels of permission:
#' 
#' - `CAN_VIEW`: Allows read-only access
#' 
#' - `CAN_RUN`: Allows read access and run access (superset of `CAN_VIEW`)
#' 
#' - `CAN_MANAGE`: Allows all actions: read, run, edit, delete, modify
#' permissions (superset of `CAN_RUN`)
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=dbsql_permissions_get]{get} \tab Get object ACL.\cr
#'  \link[=dbsql_permissions_set]{set} \tab Set object ACL.\cr
#'  \link[=dbsql_permissions_transfer_ownership]{transfer_ownership} \tab Transfer object ownership.\cr
#' }
#'
#' @rdname dbsql_permissions
#' @export
dbsql_permissions <- list()

#' Get object ACL.
#' 
#' Gets a JSON representation of the access control list (ACL) for a specified
#' object.
#'
#' @param object_id [required] Object ID.
#' @param object_type [required] The type of object permissions to check.
#'
#' @keywords internal
#'
#' @rdname dbsql_permissions_get
#'
#' @aliases dbsql_permissions_get
dbsql_permissions_get <- function(object_type, object_id, ...) {


  .api$do("GET", paste("/api/2.0/preview/sql/permissions/", object_type, "/", object_id,
    sep = ""))
}
dbsql_permissions$get <- dbsql_permissions_get

#' Set object ACL.
#' 
#' Sets the access control list (ACL) for a specified object. This operation
#' will complete rewrite the ACL.
#'
#' @param access_control_list 
#' @param object_id [required] Object ID.
#' @param object_type [required] The type of object permission to set.
#'
#' @keywords internal
#'
#' @rdname dbsql_permissions_set
#'
#' @aliases dbsql_permissions_set
dbsql_permissions_set <- function(object_type, object_id, access_control_list = NULL,
  ...) {
  body <- list(access_control_list = access_control_list, ...)

  .api$do("POST", paste("/api/2.0/preview/sql/permissions/", object_type, "/",
    object_id, sep = ""), body = body)
}
dbsql_permissions$set <- dbsql_permissions_set

#' Transfer object ownership.
#' 
#' Transfers ownership of a dashboard, query, or alert to an active user.
#' Requires an admin API key.
#'
#' @param new_owner Email address for the new owner, who must exist in the workspace.
#' @param object_id [required] The ID of the object on which to change ownership.
#' @param object_type [required] The type of object on which to change ownership.
#'
#' @keywords internal
#'
#' @rdname dbsql_permissions_transfer_ownership
#'
#' @aliases dbsql_permissions_transfer_ownership
dbsql_permissions_transfer_ownership <- function(object_type, object_id, new_owner = NULL,
  ...) {
  body <- list(new_owner = new_owner, ...)

  .api$do("POST", paste("/api/2.0/preview/sql/permissions/", object_type, "/",
    object_id, "/transfer", , sep = ""), body = body)
}
dbsql_permissions$transfer_ownership <- dbsql_permissions_transfer_ownership













