# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' In Unity Catalog, data is secure by default. Initially, users have no access
#' to data in a metastore. Access can be granted by either a metastore admin,
#' the owner of an object, or the owner of the catalog or schema that contains
#' the object. Securable objects in Unity Catalog are hierarchical and
#' privileges are inherited downward.
#' 
#' Securable objects in Unity Catalog are hierarchical and privileges are
#' inherited downward. This means that granting a privilege on the catalog
#' automatically grants the privilege to all current and future objects within
#' the catalog. Similarly, privileges granted on a schema are inherited by all
#' current and future objects within that schema.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=grants_get]{get} \tab Get permissions.\cr
#'  \link[=grants_get_effective]{get_effective} \tab Get effective permissions.\cr
#'  \link[=grants_update]{update} \tab Update permissions.\cr
#' }
#'
#' @rdname grants
#' @export
grants <- list()

#' Get permissions.
#' 
#' Gets the permissions for a securable.
#'
#' @param full_name [required] Full name of securable.
#' @param principal If provided, only the permissions for the specified principal (user or group) are returned.
#' @param securable_type [required] Type of securable.
#'
#' @keywords internal
#'
#' @rdname grants_get
#'
#' @aliases grants_get
grants_get <- function(securable_type, full_name, principal = NULL, ...) {
  query <- list(principal = principal, ...)

  .api$do("GET", paste("/api/2.1/unity-catalog/permissions/", securable_type, "/",
    full_name, sep = ""), query = query)
}
grants$get <- grants_get

#' Get effective permissions.
#' 
#' Gets the effective permissions for a securable.
#'
#' @param full_name [required] Full name of securable.
#' @param principal If provided, only the effective permissions for the specified principal (user or group) are returned.
#' @param securable_type [required] Type of securable.
#'
#' @keywords internal
#'
#' @rdname grants_get_effective
#'
#' @aliases grants_get_effective
grants_get_effective <- function(securable_type, full_name, principal = NULL, ...) {
  query <- list(principal = principal, ...)

  .api$do("GET", paste("/api/2.1/unity-catalog/effective-permissions/", securable_type,
    "/", full_name, sep = ""), query = query)
}
grants$get_effective <- grants_get_effective

#' Update permissions.
#' 
#' Updates the permissions for a securable.
#'
#' @param changes Array of permissions change objects.
#' @param full_name [required] Full name of securable.
#' @param securable_type [required] Type of securable.
#'
#' @keywords internal
#'
#' @rdname grants_update
#'
#' @aliases grants_update
grants_update <- function(securable_type, full_name, changes = NULL, ...) {
  body <- list(changes = changes, ...)

  .api$do("PATCH", paste("/api/2.1/unity-catalog/permissions/", securable_type,
    "/", full_name, sep = ""), body = body)
}
grants$update <- grants_update













