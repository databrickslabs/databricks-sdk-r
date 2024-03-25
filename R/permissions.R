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
#' @rdname get_permission
#' @export
get_permission <- function(client, request_object_type, request_object_id) {

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
#' @rdname get_permission_levels
#' @export
get_permission_levels <- function(client, request_object_type, request_object_id) {

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
#' @rdname set_permission
#' @export
set_permission <- function(client, request_object_type, request_object_id, access_control_list = NULL) {
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
#' @rdname update_permission
#' @export
update_permission <- function(client, request_object_type, request_object_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""), body = body)
}




