# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get object permissions.
#' 
#' Gets the permission of an object. Objects can inherit permissions from their
#' parent objects or root objects.
#'
#' @param request_object_id 
#' @param request_object_type <needs content>.
databricks_permissions_get <- function(request_object_type, request_object_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id, sep = ""))
}

#' Get permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#'
#' @param request_object_id <needs content>.
#' @param request_object_type <needs content>.
databricks_permissions_get_permission_levels <- function(request_object_type, request_object_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id, "/permissionLevels", , sep = ""))
}

#' Set permissions.
#' 
#' Sets permissions on object. Objects can inherit permissions from their parent
#' objects and root objects.
#'
#' @param access_control_list 
#' @param request_object_id 
#' @param request_object_type <needs content>.
databricks_permissions_set <- function(request_object_type, request_object_id, access_control_list = NULL, 
    ...) {
    body <- list(
        access_control_list = access_control_list, ...)
    
    .api$do("PUT", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id, sep = ""), body = body)
}

#' Update permission.
#' 
#' Updates the permissions on an object.
#'
#' @param access_control_list 
#' @param request_object_id 
#' @param request_object_type <needs content>.
databricks_permissions_update <- function(request_object_type, request_object_id, access_control_list = NULL, 
    ...) {
    body <- list(
        access_control_list = access_control_list, ...)
    
    .api$do("PATCH", paste("/api/2.0/permissions/", request_object_type, "/", request_object_id, sep = ""), body = body)
}













