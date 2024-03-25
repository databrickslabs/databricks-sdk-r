# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get object permissions.
#' 
#' Gets the permissions of an object. Objects can inherit permissions from their
#' parent objects or root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param request_object_id Required. The id of the request object.
#' @param request_object_type Required. The type of the request object.
#'
#' @rdname permissionsGet
#' @export
permissionsGet <- function(client, request_object_type, request_object_id) {

  client$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""))
}
#' Get object permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param request_object_id Required. <needs content>.
#' @param request_object_type Required. <needs content>.
#'
#' @rdname permissionsGetPermissionLevels
#' @export
permissionsGetPermissionLevels <- function(client, request_object_type, request_object_id) {

  client$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    "/permissionLevels", , sep = ""))
}
#' Set object permissions.
#' 
#' Sets permissions on an object. Objects can inherit permissions from their
#' parent objects or root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param request_object_id Required. The id of the request object.
#' @param request_object_type Required. The type of the request object.
#'
#' @rdname permissionsSet
#' @export
permissionsSet <- function(client, request_object_type, request_object_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""), body = body)
}
#' Update object permissions.
#' 
#' Updates the permissions on an object. Objects can inherit permissions from
#' their parent objects or root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param request_object_id Required. The id of the request object.
#' @param request_object_type Required. The type of the request object.
#'
#' @rdname permissionsUpdate
#' @export
permissionsUpdate <- function(client, request_object_type, request_object_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""), body = body)
}




