# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get object ACL.
#' 
#' Gets a JSON representation of the access control list (ACL) for a specified
#' object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param object_id Required. Object ID.
#' @param object_type Required. The type of object permissions to check.
#'
#' @rdname get_dbsql_permission
#' @alias dbsqlPermissionsGet
#' @export
get_dbsql_permission <- function(client, object_type, object_id) {

  client$do("GET", paste("/api/2.0/preview/sql/permissions/", object_type, "/",
    object_id, sep = ""))
}

#' @rdname get_dbsql_permission
#' @export 
dbsqlPermissionsGet <- get_dbsql_permission
#' Set object ACL.
#' 
#' Sets the access control list (ACL) for a specified object. This operation
#' will complete rewrite the ACL.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param object_id Required. Object ID.
#' @param object_type Required. The type of object permission to set.
#'
#' @rdname set_dbsql_permission
#' @alias dbsqlPermissionsSet
#' @export
set_dbsql_permission <- function(client, object_type, object_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("POST", paste("/api/2.0/preview/sql/permissions/", object_type, "/",
    object_id, sep = ""), body = body)
}

#' @rdname set_dbsql_permission
#' @export 
dbsqlPermissionsSet <- set_dbsql_permission
#' Transfer object ownership.
#' 
#' Transfers ownership of a dashboard, query, or alert to an active user.
#' Requires an admin API key.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param new_owner Email address for the new owner, who must exist in the workspace.
#' @param object_id Required. The ID of the object on which to change ownership.
#' @param object_type Required. The type of object on which to change ownership.
#'
#' @rdname transfer_dbsql_permission_ownership
#' @alias dbsqlPermissionsTransferOwnership
#' @export
transfer_dbsql_permission_ownership <- function(client, object_type, object_id, new_owner = NULL) {
  body <- list(new_owner = new_owner)
  client$do("POST", paste("/api/2.0/preview/sql/permissions/", object_type, "/",
    object_id, "/transfer", , sep = ""), body = body)
}

#' @rdname transfer_dbsql_permission_ownership
#' @export 
dbsqlPermissionsTransferOwnership <- transfer_dbsql_permission_ownership



