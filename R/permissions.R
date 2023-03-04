# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Permissions API are used to create read, write, edit, update and manage
#' access for various users on different objects and endpoints.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=permissions_get]{get} \tab Get object permissions.\cr
#'  \link[=permissions_get_permission_levels]{get_permission_levels} \tab Get permission levels.\cr
#'  \link[=permissions_set]{set} \tab Set permissions.\cr
#'  \link[=permissions_update]{update} \tab Update permission.\cr
#' }
#'
#' @rdname permissions
#' @export
permissions <- list()

#' Get object permissions.
#' 
#' Gets the permission of an object. Objects can inherit permissions from their
#' parent objects or root objects.
#'
#' @param request_object_id Required. 
#' @param request_object_type Required. <needs content>.
#'
#' @keywords internal
#'
#' @rdname permissions_get
#'
#' @aliases permissions_get
permissions_get <- function(request_object_type, request_object_id, ...) {


  .api$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""))
}
permissions$get <- permissions_get

#' Get permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#'
#' @param request_object_id Required. <needs content>.
#' @param request_object_type Required. <needs content>.
#'
#' @keywords internal
#'
#' @rdname permissions_get_permission_levels
#'
#' @aliases permissions_get_permission_levels
permissions_get_permission_levels <- function(request_object_type, request_object_id,
  ...) {


  .api$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    "/permissionLevels", , sep = ""))
}
permissions$get_permission_levels <- permissions_get_permission_levels

#' Set permissions.
#' 
#' Sets permissions on object. Objects can inherit permissions from their parent
#' objects and root objects.
#'
#' @param access_control_list 
#' @param request_object_id Required. 
#' @param request_object_type Required. <needs content>.
#'
#' @keywords internal
#'
#' @rdname permissions_set
#'
#' @aliases permissions_set
permissions_set <- function(request_object_type, request_object_id, access_control_list = NULL,
  ...) {
  body <- list(access_control_list = access_control_list, ...)

  .api$do("PUT", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""), body = body)
}
permissions$set <- permissions_set

#' Update permission.
#' 
#' Updates the permissions on an object.
#'
#' @param access_control_list 
#' @param request_object_id Required. 
#' @param request_object_type Required. <needs content>.
#'
#' @keywords internal
#'
#' @rdname permissions_update
#'
#' @aliases permissions_update
permissions_update <- function(request_object_type, request_object_id, access_control_list = NULL,
  ...) {
  body <- list(access_control_list = access_control_list, ...)

  .api$do("PATCH", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""), body = body)
}
permissions$update <- permissions_update

