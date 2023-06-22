# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Identities for use with jobs, automated tools, and systems such as scripts,
#' apps, and CI/CD platforms. Databricks recommends creating service principals
#' to run production jobs or modify production data. If all processes that act
#' on production data run with service principals, interactive users do not need
#' any write, delete, or modify privileges in production. This eliminates the
#' risk of a user overwriting production data by accident.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=service_principals_create]{create} \tab Create a service principal.\cr
#'  \link[=service_principals_delete]{delete} \tab Delete a service principal.\cr
#'  \link[=service_principals_get]{get} \tab Get service principal details.\cr
#'  \link[=service_principals_list]{list} \tab List service principals.\cr
#'  \link[=service_principals_patch]{patch} \tab Update service principal details.\cr
#'  \link[=service_principals_update]{update} \tab Replace service principal.\cr
#' }
#'
#' @rdname service_principals
#' @export
service_principals <- list()

#' Create a service principal.
#' 
#' Creates a new service principal in the Databricks workspace.
#'
#' @param active If this user is active.
#' @param application_id UUID relating to the service principal.
#' @param display_name String that represents a concatenation of given and family names.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks service principal ID.
#' @param roles 
#'
#' @keywords internal
#'
#' @rdname service_principals_create
#'
#' @aliases service_principals_create
service_principals_create <- function(active = NULL, application_id = NULL, display_name = NULL,
  entitlements = NULL, external_id = NULL, groups = NULL, id = NULL, roles = NULL) {
  body <- list(active = active, applicationId = application_id, displayName = display_name,
    entitlements = entitlements, externalId = external_id, groups = groups, id = id,
    roles = roles)
  .state$api$do("POST", "/api/2.0/preview/scim/v2/ServicePrincipals", body = body)
}
service_principals$create <- service_principals_create

#' Delete a service principal.
#' 
#' Delete a single service principal in the Databricks workspace.
#'
#' @param id Required. Unique ID for a service principal in the Databricks workspace.
#'
#' @keywords internal
#'
#' @rdname service_principals_delete
#'
#' @aliases service_principals_delete
service_principals_delete <- function(id) {

  .state$api$do("DELETE", paste("/api/2.0/preview/scim/v2/ServicePrincipals/",
    id, sep = ""))
}
service_principals$delete <- service_principals_delete

#' Get service principal details.
#' 
#' Gets the details for a single service principal define in the Databricks
#' workspace.
#'
#' @param id Required. Unique ID for a service principal in the Databricks workspace.
#'
#' @keywords internal
#'
#' @rdname service_principals_get
#'
#' @aliases service_principals_get
service_principals_get <- function(id) {

  .state$api$do("GET", paste("/api/2.0/preview/scim/v2/ServicePrincipals/", id,
    sep = ""))
}
service_principals$get <- service_principals_get

#' List service principals.
#' 
#' Gets the set of service principals associated with a Databricks workspace.
#'
#' @param attributes Comma-separated list of attributes to return in response.
#' @param count Desired number of results per page.
#' @param excluded_attributes Comma-separated list of attributes to exclude in response.
#' @param filter Query by which the results have to be filtered.
#' @param sort_by Attribute to sort the results.
#' @param sort_order The order to sort the results.
#' @param start_index Specifies the index of the first result.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname service_principals_list
#'
#' @aliases service_principals_list
service_principals_list <- function(attributes = NULL, count = NULL, excluded_attributes = NULL,
  filter = NULL, sort_by = NULL, sort_order = NULL, start_index = NULL) {
  query <- list(attributes = attributes, count = count, excludedAttributes = excluded_attributes,
    filter = filter, sortBy = sort_by, sortOrder = sort_order, startIndex = start_index)

  json <- .state$api$do("GET", "/api/2.0/preview/scim/v2/ServicePrincipals", query = query)
  return(json$Resources)

}
service_principals$list <- service_principals_list

#' Update service principal details.
#' 
#' Partially updates the details of a single service principal in the Databricks
#' workspace.
#'
#' @param id Required. Unique ID for a service principal in the Databricks workspace.
#' @param operations 
#'
#' @keywords internal
#'
#' @rdname service_principals_patch
#'
#' @aliases service_principals_patch
service_principals_patch <- function(id, operations = NULL) {
  body <- list(, operations = operations)
  .state$api$do("PATCH", paste("/api/2.0/preview/scim/v2/ServicePrincipals/", id,
    sep = ""), body = body)
}
service_principals$patch <- service_principals_patch

#' Replace service principal.
#' 
#' Updates the details of a single service principal.
#' 
#' This action replaces the existing service principal with the same name.
#'
#' @param active If this user is active.
#' @param application_id UUID relating to the service principal.
#' @param display_name String that represents a concatenation of given and family names.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks service principal ID.
#' @param roles 
#'
#' @keywords internal
#'
#' @rdname service_principals_update
#'
#' @aliases service_principals_update
service_principals_update <- function(id, active = NULL, application_id = NULL, display_name = NULL,
  entitlements = NULL, external_id = NULL, groups = NULL, roles = NULL) {
  body <- list(active = active, applicationId = application_id, displayName = display_name,
    entitlements = entitlements, externalId = external_id, groups = groups, id = id,
    roles = roles)
  .state$api$do("PUT", paste("/api/2.0/preview/scim/v2/ServicePrincipals/", id,
    sep = ""), body = body)
}
service_principals$update <- service_principals_update

