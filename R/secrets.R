# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' The Secrets API allows you to manage secrets, secret scopes, and access
#' permissions.
#' 
#' Sometimes accessing data requires that you authenticate to external data
#' sources through JDBC. Instead of directly entering your credentials into a
#' notebook, use Databricks secrets to store your credentials and reference them
#' in notebooks and jobs.
#' 
#' Administrators, secret creators, and users granted permission can read
#' Databricks secrets. While Databricks makes an effort to redact secret values
#' that might be displayed in notebooks, it is not possible to prevent such
#' users from reading secrets.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=secrets_create_scope]{create_scope} \tab Create a new secret scope.\cr
#'  \link[=secrets_delete_acl]{delete_acl} \tab Delete an ACL.\cr
#'  \link[=secrets_delete_scope]{delete_scope} \tab Delete a secret scope.\cr
#'  \link[=secrets_delete_secret]{delete_secret} \tab Delete a secret.\cr
#'  \link[=secrets_get_acl]{get_acl} \tab Get secret ACL details.\cr
#'  \link[=secrets_list_acls]{list_acls} \tab Lists ACLs.\cr
#'  \link[=secrets_list_scopes]{list_scopes} \tab List all scopes.\cr
#'  \link[=secrets_list_secrets]{list_secrets} \tab List secret keys.\cr
#'  \link[=secrets_put_acl]{put_acl} \tab Create/update an ACL.\cr
#'  \link[=secrets_put_secret]{put_secret} \tab Add a secret.\cr
#' }
#'
#' @rdname secrets
#' @export
secrets <- list()

#' Create a new secret scope.
#' 
#' The scope name must consist of alphanumeric characters, dashes, underscores,
#' and periods, and may not exceed 128 characters. The maximum number of scopes
#' in a workspace is 100.
#'
#' @param initial_manage_principal The principal that is initially granted `MANAGE` permission to the created scope.
#' @param keyvault_metadata The metadata for the secret scope if the type is `AZURE_KEYVAULT`.
#' @param scope Required. Scope name requested by the user.
#' @param scope_backend_type The backend type the scope will be created with.
#'
#' @keywords internal
#'
#' @rdname secrets_create_scope
#'
#' @aliases secrets_create_scope
secrets_create_scope <- function(scope, initial_manage_principal = NULL, keyvault_metadata = NULL,
  scope_backend_type = NULL) {
  body <- list(initial_manage_principal = initial_manage_principal, keyvault_metadata = keyvault_metadata,
    scope = scope, scope_backend_type = scope_backend_type)
  .api$do("POST", "/api/2.0/secrets/scopes/create", body = body)
}
secrets$create_scope <- secrets_create_scope

#' Delete an ACL.
#' 
#' Deletes the given ACL on the given scope.
#' 
#' Users must have the `MANAGE` permission to invoke this API. Throws
#' `RESOURCE_DOES_NOT_EXIST` if no such secret scope, principal, or ACL exists.
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.
#'
#' @param principal Required. The principal to remove an existing ACL from.
#' @param scope Required. The name of the scope to remove permissions from.
#'
#' @keywords internal
#'
#' @rdname secrets_delete_acl
#'
#' @aliases secrets_delete_acl
secrets_delete_acl <- function(scope, principal) {
  body <- list(principal = principal, scope = scope)
  .api$do("POST", "/api/2.0/secrets/acls/delete", body = body)
}
secrets$delete_acl <- secrets_delete_acl

#' Delete a secret scope.
#' 
#' Deletes a secret scope.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if the scope does not exist. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#'
#' @param scope Required. Name of the scope to delete.
#'
#' @keywords internal
#'
#' @rdname secrets_delete_scope
#'
#' @aliases secrets_delete_scope
secrets_delete_scope <- function(scope) {
  body <- list(scope = scope)
  .api$do("POST", "/api/2.0/secrets/scopes/delete", body = body)
}
secrets$delete_scope <- secrets_delete_scope

#' Delete a secret.
#' 
#' Deletes the secret stored in this secret scope. You must have `WRITE` or
#' `MANAGE` permission on the secret scope.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope or secret exists.
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.
#'
#' @param key Required. Name of the secret to delete.
#' @param scope Required. The name of the scope that contains the secret to delete.
#'
#' @keywords internal
#'
#' @rdname secrets_delete_secret
#'
#' @aliases secrets_delete_secret
secrets_delete_secret <- function(scope, key) {
  body <- list(key = key, scope = scope)
  .api$do("POST", "/api/2.0/secrets/delete", body = body)
}
secrets$delete_secret <- secrets_delete_secret

#' Get secret ACL details.
#' 
#' Gets the details about the given ACL, such as the group and permission. Users
#' must have the `MANAGE` permission to invoke this API.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope exists. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#'
#' @param principal Required. The principal to fetch ACL information for.
#' @param scope Required. The name of the scope to fetch ACL information from.
#'
#' @keywords internal
#'
#' @rdname secrets_get_acl
#'
#' @aliases secrets_get_acl
secrets_get_acl <- function(scope, principal) {
  query <- list(principal = principal, scope = scope)
  .api$do("GET", "/api/2.0/secrets/acls/get", query = query)
}
secrets$get_acl <- secrets_get_acl

#' Lists ACLs.
#' 
#' List the ACLs for a given secret scope. Users must have the `MANAGE`
#' permission to invoke this API.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no such secret scope exists. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#'
#' @param scope Required. The name of the scope to fetch ACL information from.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname secrets_list_acls
#'
#' @aliases secrets_list_acls
secrets_list_acls <- function(scope) {
  query <- list(scope = scope)

  json <- .api$do("GET", "/api/2.0/secrets/acls/list", query = query)
  return(json$items)

}
secrets$list_acls <- secrets_list_acls

#' List all scopes.
#' 
#' Lists all secret scopes available in the workspace.
#' 
#' Throws `PERMISSION_DENIED` if the user does not have permission to make this
#' API call.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname secrets_list_scopes
#'
#' @aliases secrets_list_scopes
secrets_list_scopes <- function() {

  json <- .api$do("GET", "/api/2.0/secrets/scopes/list")
  return(json$scopes)

}
secrets$list_scopes <- secrets_list_scopes

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
#'
#' @param scope Required. The name of the scope to list secrets within.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname secrets_list_secrets
#'
#' @aliases secrets_list_secrets
secrets_list_secrets <- function(scope) {
  query <- list(scope = scope)

  json <- .api$do("GET", "/api/2.0/secrets/list", query = query)
  return(json$secrets)

}
secrets$list_secrets <- secrets_list_secrets

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
#' Throws `INVALID_PARAMETER_VALUE` if the permission is invalid. Throws
#' `PERMISSION_DENIED` if the user does not have permission to make this API
#' call.
#'
#' @param permission Required. The permission level applied to the principal.
#' @param principal Required. The principal in which the permission is applied.
#' @param scope Required. The name of the scope to apply permissions to.
#'
#' @keywords internal
#'
#' @rdname secrets_put_acl
#'
#' @aliases secrets_put_acl
secrets_put_acl <- function(scope, principal, permission) {
  body <- list(permission = permission, principal = principal, scope = scope)
  .api$do("POST", "/api/2.0/secrets/acls/put", body = body)
}
secrets$put_acl <- secrets_put_acl

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
#'
#' @param bytes_value If specified, value will be stored as bytes.
#' @param key Required. A unique name to identify the secret.
#' @param scope Required. The name of the scope to which the secret will be associated with.
#' @param string_value If specified, note that the value will be stored in UTF-8 (MB4) form.
#'
#' @keywords internal
#'
#' @rdname secrets_put_secret
#'
#' @aliases secrets_put_secret
secrets_put_secret <- function(scope, key, bytes_value = NULL, string_value = NULL) {
  body <- list(bytes_value = bytes_value, key = key, scope = scope, string_value = string_value)
  .api$do("POST", "/api/2.0/secrets/put", body = body)
}
secrets$put_secret <- secrets_put_secret

