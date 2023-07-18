# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get object permissions.
#' 
#' Gets the permission of an object. Objects can inherit permissions from their
#' parent objects or root objects.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param request_object_id Required. 
#' @param request_object_type Required. <needs content>.
#'
#' @rdname permissionsGet
permissionsGet <- function(client, request_object_type, request_object_id) {

  client$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""))
}

#' Get permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param request_object_id Required. <needs content>.
#' @param request_object_type Required. <needs content>.
#'
#' @rdname permissionsGetPermissionLevels
permissionsGetPermissionLevels <- function(client, request_object_type, request_object_id) {

  client$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    "/permissionLevels", , sep = ""))
}

#' Set permissions.
#' 
#' Sets permissions on object. Objects can inherit permissions from their parent
#' objects and root objects.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param request_object_id Required. 
#' @param request_object_type Required. <needs content>.
#'
#' @rdname permissionsSet
permissionsSet <- function(client, request_object_type, request_object_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""), body = body)
}

#' Update permission.
#' 
#' Updates the permissions on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param request_object_id Required. 
#' @param request_object_type Required. <needs content>.
#'
#' @rdname permissionsUpdate
permissionsUpdate <- function(client, request_object_type, request_object_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id,
    sep = ""), body = body)
}

