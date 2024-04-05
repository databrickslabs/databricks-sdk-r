# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create on-behalf token.
#' 
#' Creates a token on behalf of a service principal.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param application_id Required. Application ID of the service principal.
#' @param comment Comment that describes the purpose of the token.
#' @param lifetime_seconds The number of seconds before the token expires.
#'
#'
#' @rdname create_obo_token
#' @alias tokenManagementCreateOboToken
#' @export
create_obo_token <- function(client, application_id, comment = NULL, lifetime_seconds = NULL) {
  body <- list(application_id = application_id, comment = comment, lifetime_seconds = lifetime_seconds)
  client$do("POST", "/api/2.0/token-management/on-behalf-of/tokens", body = body)
}

#' @rdname create_obo_token
#' @export 
tokenManagementCreateOboToken <- create_obo_token
#' Delete a token.
#' 
#' Deletes a token, specified by its ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param token_id Required. The ID of the token to get.
#'
#'
#' @rdname delete_token_management
#' @alias tokenManagementDelete
#' @export
delete_token_management <- function(client, token_id) {

  client$do("DELETE", paste("/api/2.0/token-management/tokens/", token_id, sep = ""))
}

#' @rdname delete_token_management
#' @export 
tokenManagementDelete <- delete_token_management
#' Get token info.
#' 
#' Gets information about a token, specified by its ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param token_id Required. The ID of the token to get.
#'
#'
#' @rdname get_token_management
#' @alias tokenManagementGet
#' @export
get_token_management <- function(client, token_id) {

  client$do("GET", paste("/api/2.0/token-management/tokens/", token_id, sep = ""))
}

#' @rdname get_token_management
#' @export 
tokenManagementGet <- get_token_management
#' Get token permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#'
#' @rdname get_token_management_permission_levels
#' @alias tokenManagementGetPermissionLevels
#' @export
get_token_management_permission_levels <- function(client) {
  client$do("GET", "/api/2.0/permissions/authorization/tokens/permissionLevels")
}

#' @rdname get_token_management_permission_levels
#' @export 
tokenManagementGetPermissionLevels <- get_token_management_permission_levels
#' Get token permissions.
#' 
#' Gets the permissions of all tokens. Tokens can inherit permissions from their
#' root object.
#' @param client Required. Instance of DatabricksClient()
#'
#'
#' @rdname get_token_management_permissions
#' @alias tokenManagementGetPermissions
#' @export
get_token_management_permissions <- function(client) {
  client$do("GET", "/api/2.0/permissions/authorization/tokens")
}

#' @rdname get_token_management_permissions
#' @export 
tokenManagementGetPermissions <- get_token_management_permissions
#' List all tokens.
#' 
#' Lists all tokens associated with the specified workspace or user.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param created_by_id User ID of the user that created the token.
#' @param created_by_username Username of the user that created the token.
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname list_token_management
#' @alias tokenManagementList
#' @export
list_token_management <- function(client, created_by_id = NULL, created_by_username = NULL) {
  query <- list(created_by_id = created_by_id, created_by_username = created_by_username)

  json <- client$do("GET", "/api/2.0/token-management/tokens", query = query)
  return(json$token_infos)

}

#' @rdname list_token_management
#' @export 
tokenManagementList <- list_token_management
#' Set token permissions.
#' 
#' Sets permissions on all tokens. Tokens can inherit permissions from their
#' root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#'
#'
#' @rdname set_token_management_permissions
#' @alias tokenManagementSetPermissions
#' @export
set_token_management_permissions <- function(client, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", "/api/2.0/permissions/authorization/tokens", body = body)
}

#' @rdname set_token_management_permissions
#' @export 
tokenManagementSetPermissions <- set_token_management_permissions
#' Update token permissions.
#' 
#' Updates the permissions on all tokens. Tokens can inherit permissions from
#' their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#'
#'
#' @rdname update_token_management_permissions
#' @alias tokenManagementUpdatePermissions
#' @export
update_token_management_permissions <- function(client, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", "/api/2.0/permissions/authorization/tokens", body = body)
}

#' @rdname update_token_management_permissions
#' @export 
tokenManagementUpdatePermissions <- update_token_management_permissions








