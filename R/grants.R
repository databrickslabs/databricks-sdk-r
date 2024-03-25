# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get permissions.
#' 
#' Gets the permissions for a securable.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of securable.
#' @param principal If provided, only the permissions for the specified principal (user or group) are returned.
#' @param securable_type Required. Type of securable.
#'
#' @rdname get_grant
#' @export
get_grant <- function(client, securable_type, full_name, principal = NULL) {
  query <- list(principal = principal)
  client$do("GET", paste("/api/2.1/unity-catalog/permissions/", securable_type,
    "/", full_name, sep = ""), query = query)
}
#' Get effective permissions.
#' 
#' Gets the effective permissions for a securable.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of securable.
#' @param principal If provided, only the effective permissions for the specified principal (user or group) are returned.
#' @param securable_type Required. Type of securable.
#'
#' @rdname get_grant_effective
#' @export
get_grant_effective <- function(client, securable_type, full_name, principal = NULL) {
  query <- list(principal = principal)
  client$do("GET", paste("/api/2.1/unity-catalog/effective-permissions/", securable_type,
    "/", full_name, sep = ""), query = query)
}
#' Update permissions.
#' 
#' Updates the permissions for a securable.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param changes Array of permissions change objects.
#' @param full_name Required. Full name of securable.
#' @param securable_type Required. Type of securable.
#'
#' @rdname update_grant
#' @export
update_grant <- function(client, securable_type, full_name, changes = NULL) {
  body <- list(changes = changes)
  client$do("PATCH", paste("/api/2.1/unity-catalog/permissions/", securable_type,
    "/", full_name, sep = ""), body = body)
}



