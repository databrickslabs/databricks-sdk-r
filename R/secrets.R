# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a new secret scope.
#' 
#' The scope name must consist of alphanumeric characters, dashes, underscores,
#' and periods, and may not exceed 128 characters.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param backend_azure_keyvault The metadata for the secret scope if the type is `AZURE_KEYVAULT`.
#' @param initial_manage_principal The principal that is initially granted `MANAGE` permission to the created scope.
#' @param scope Required. Scope name requested by the user.
#' @param scope_backend_type The backend type the scope will be created with.
#'
#' @rdname secretsCreateScope
#' @export
secretsCreateScope <- function(client, scope, backend_azure_keyvault = NULL, initial_manage_principal = NULL,
  scope_backend_type = NULL) {
  body <- list(backend_azure_keyvault = backend_azure_keyvault, initial_manage_principal = initial_manage_principal,
    scope = scope, scope_backend_type = scope_backend_type)
  client$do("POST", "/api/2.0/secrets/scopes/create", body = body)
}

#' Delete an ACL.
#' 
#' Deletes the given ACL on the given scope.
#' 
#' Users must have the `MANAGE` permission to invoke this API. Throws
#' `RESOURCE_DOES_NOT_EXIST` if no such secret scope, principal, or ACL exists.
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param principal Required. The principal to remove an existing ACL from.
#' @param scope Required. The name of the scope to remove permissions from.
#'
#' @rdname secretsDeleteAcl
#' @export
secretsDeleteAcl <- function(client, scope, principal) {
  body <- list(principal = principal, scope = scope)
  client$do("POST", "/api/2.0/secrets/acls/delete", body = body)
}

#' Delete a secret scope.
#' 
#' Deletes a secret scope.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if the scope does not exist. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param scope Required. Name of the scope to delete.
#'
#' @rdname secretsDeleteScope
#' @export
secretsDeleteScope <- function(client, scope) {
  body <- list(scope = scope)
  client$do("POST", "/api/2.0/secrets/scopes/delete", body = body)
}

#' Delete a secret.
#' 
#' Deletes the secret stored in this secret scope. You must have `WRITE` or
#' `MANAGE` permission on the secret scope.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope or secret exists.
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param key Required. Name of the secret to delete.
#' @param scope Required. The name of the scope that contains the secret to delete.
#'
#' @rdname secretsDeleteSecret
#' @export
secretsDeleteSecret <- function(client, scope, key) {
  body <- list(key = key, scope = scope)
  client$do("POST", "/api/2.0/secrets/delete", body = body)
}

#' Get secret ACL details.
#' 
#' Gets the details about the given ACL, such as the group and permission. Users
#' must have the `MANAGE` permission to invoke this API.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope exists. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param principal Required. The principal to fetch ACL information for.
#' @param scope Required. The name of the scope to fetch ACL information from.
#'
#' @rdname secretsGetAcl
#' @export
secretsGetAcl <- function(client, scope, principal) {
  query <- list(principal = principal, scope = scope)
  client$do("GET", "/api/2.0/secrets/acls/get", query = query)
}

#' Get a secret.
#' 
#' Gets the bytes representation of a secret value for the specified scope and
#' key.
#' 
#' Users need the READ permission to make this call.
#' 
#' Note that the secret value returned is in bytes. The interpretation of the
#' bytes is determined by the caller in DBUtils and the type the data is decoded
#' into.
#' 
#' Throws ``PERMISSION_DENIED`` if the user does not have permission to make
#' this API call. Throws ``RESOURCE_DOES_NOT_EXIST`` if no such secret or secret
#' scope exists.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param key Required. The key to fetch secret for.
#' @param scope Required. The name of the scope to fetch secret information from.
#'
#' @rdname secretsGetSecret
#' @export
secretsGetSecret <- function(client, scope, key) {
  query <- list(key = key, scope = scope)
  client$do("GET", "/api/2.0/secrets/get", query = query)
}

#' Lists ACLs.
#' 
#' List the ACLs for a given secret scope. Users must have the `MANAGE`
#' permission to invoke this API.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope exists. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param scope Required. The name of the scope to fetch ACL information from.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname secretsListAcls
#' @export
secretsListAcls <- function(client, scope) {
  query <- list(scope = scope)

  json <- client$do("GET", "/api/2.0/secrets/acls/list", query = query)
  return(json$items)

}

#' List all scopes.
#' 
#' Lists all secret scopes available in the workspace.
#' 
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname secretsListScopes
#' @export
secretsListScopes <- function(client) {

  json <- client$do("GET", "/api/2.0/secrets/scopes/list")
  return(json$scopes)

}

#' List secret keys.
#' 
#' Lists the secret keys that are stored at this scope. This is a metadata-only
#' operation; secret data cannot be retrieved using this API. Users need the
#' READ permission to make this call.
#' 
#' The lastUpdatedTimestamp returned is in milliseconds since epoch. Throws
#' `RESOURCE_DOES_NOT_EXIST` if no such secret scope exists. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param scope Required. The name of the scope to list secrets within.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname secretsListSecrets
#' @export
secretsListSecrets <- function(client, scope) {
  query <- list(scope = scope)

  json <- client$do("GET", "/api/2.0/secrets/list", query = query)
  return(json$secrets)

}

#' Create/update an ACL.
#' 
#' Creates or overwrites the Access Control List (ACL) associated with the given
#' principal (user or group) on the specified scope point.
#' 
#' In general, a user or group will use the most powerful permission available
#' to them, and permissions are ordered as follows:
#' 
#' * `MANAGE` - Allowed to change ACLs, and read and write to this secret scope.
#' * `WRITE` - Allowed to read and write to this secret scope. * `READ` -
#' Allowed to read this secret scope and list what secrets are available.
#' 
#' Note that in general, secret values can only be read from within a command on
#' a cluster (for example, through a notebook). There is no API to read the
#' actual secret value material outside of a cluster. However, the user's
#' permission will be applied based on who is executing the command, and they
#' must have at least READ permission.
#' 
#' Users must have the `MANAGE` permission to invoke this API.
#' 
#' The principal is a user or group name corresponding to an existing Databricks
#' principal to be granted or revoked access.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope exists. Throws
#' `RESOURCE_ALREADY_EXISTS` if a permission for the principal already exists.
#' Throws `INVALID_PARAMETER_VALUE` if the permission or principal is invalid.
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param permission Required. The permission level applied to the principal.
#' @param principal Required. The principal in which the permission is applied.
#' @param scope Required. The name of the scope to apply permissions to.
#'
#' @rdname secretsPutAcl
#' @export
secretsPutAcl <- function(client, scope, principal, permission) {
  body <- list(permission = permission, principal = principal, scope = scope)
  client$do("POST", "/api/2.0/secrets/acls/put", body = body)
}

#' Add a secret.
#' 
#' Inserts a secret under the provided scope with the given name. If a secret
#' already exists with the same name, this command overwrites the existing
#' secret's value. The server encrypts the secret using the secret scope's
#' encryption settings before storing it.
#' 
#' You must have `WRITE` or `MANAGE` permission on the secret scope. The secret
#' key must consist of alphanumeric characters, dashes, underscores, and
#' periods, and cannot exceed 128 characters. The maximum allowed secret value
#' size is 128 KB. The maximum number of secrets in a given scope is 1000.
#' 
#' The input fields 'string_value' or 'bytes_value' specify the type of the
#' secret, which will determine the value returned when the secret value is
#' requested. Exactly one must be specified.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope exists. Throws
#' `RESOURCE_LIMIT_EXCEEDED` if maximum number of secrets in scope is exceeded.
#' Throws `INVALID_PARAMETER_VALUE` if the key name or value length is invalid.
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param bytes_value If specified, value will be stored as bytes.
#' @param key Required. A unique name to identify the secret.
#' @param scope Required. The name of the scope to which the secret will be associated with.
#' @param string_value If specified, note that the value will be stored in UTF-8 (MB4) form.
#'
#' @rdname secretsPutSecret
#' @export
secretsPutSecret <- function(client, scope, key, bytes_value = NULL, string_value = NULL) {
  body <- list(bytes_value = bytes_value, key = key, scope = scope, string_value = string_value)
  client$do("POST", "/api/2.0/secrets/put", body = body)
}

