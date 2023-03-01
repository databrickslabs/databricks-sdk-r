# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get permissions.
#' 
#' Gets the permissions for a securable.
#'
#' @param full_name Full name of securable.
#' @param principal If provided, only the permissions for the specified principal (user or group) are returned.
#' @param securable_type Type of securable.
databricks_grants_get <- function(securable_type, full_name, principal = NULL, 
    ...) {
    query <- list(
        principal = principal, ...)
    .api$do("GET", paste("/api/2.1/unity-catalog/permissions/", securable_type, "/", full_name, sep = ""), query = query)
}

#' Get effective permissions.
#' 
#' Gets the effective permissions for a securable.
#'
#' @param full_name Full name of securable.
#' @param principal If provided, only the effective permissions for the specified principal (user or group) are returned.
#' @param securable_type Type of securable.
databricks_grants_get_effective <- function(securable_type, full_name, principal = NULL, 
    ...) {
    query <- list(
        principal = principal, ...)
    .api$do("GET", paste("/api/2.1/unity-catalog/effective-permissions/", securable_type, "/", full_name, sep = ""), query = query)
}

#' Update permissions.
#' 
#' Updates the permissions for a securable.
#'
#' @param changes Array of permissions change objects.
#' @param full_name Full name of securable.
#' @param securable_type Type of securable.
databricks_grants_update <- function(securable_type, full_name, changes = NULL, 
    ...) {
    body <- list(
        changes = changes, ...)
    .api$do("PATCH", paste("/api/2.1/unity-catalog/permissions/", securable_type, "/", full_name, sep = ""), body = body)
}

