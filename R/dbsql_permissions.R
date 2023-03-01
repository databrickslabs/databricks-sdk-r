# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get object ACL.
#' 
#' Gets a JSON representation of the access control list (ACL) for a specified
#' object.
#'
#' @param object_id Object ID.
#' @param object_type The type of object permissions to check.
databricks_dbsql_permissions_get <- function(object_type, object_id, ...) {
    
    .api$do("GET", paste("/api/2.0/preview/sql/permissions/", object_type, "/", object_id, sep = ""))
}

#' Set object ACL.
#' 
#' Sets the access control list (ACL) for a specified object. This operation
#' will complete rewrite the ACL.
#'
#' @param access_control_list 
#' @param object_id Object ID.
#' @param object_type The type of object permission to set.
databricks_dbsql_permissions_set <- function(object_type, object_id, access_control_list = NULL, 
    ...) {
    body <- list(
        access_control_list = access_control_list, ...)
    .api$do("POST", paste("/api/2.0/preview/sql/permissions/", object_type, "/", object_id, sep = ""), body = body)
}

#' Transfer object ownership.
#' 
#' Transfers ownership of a dashboard, query, or alert to an active user.
#' Requires an admin API key.
#'
#' @param new_owner Email address for the new owner, who must exist in the workspace.
#' @param object_id The ID of the object on which to change ownership.
#' @param object_type The type of object on which to change ownership.
databricks_dbsql_permissions_transfer_ownership <- function(object_type, object_id, new_owner = NULL, 
    ...) {
    body <- list(
        new_owner = new_owner, ...)
    .api$do("POST", paste("/api/2.0/preview/sql/permissions/", object_type, "/", object_id, "/transfer", , sep = ""), body = body)
}

