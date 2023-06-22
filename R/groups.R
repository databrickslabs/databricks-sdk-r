# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Groups simplify identity management, making it easier to assign access to
#' Databricks workspace, data, and other securable objects.
#' 
#' It is best practice to assign access to workspaces and access-control
#' policies in Unity Catalog to groups, instead of to users individually. All
#' Databricks workspace identities can be assigned as members of groups, and
#' members inherit permissions that are assigned to their group.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=groups_create]{create} \tab Create a new group.\cr
#'  \link[=groups_delete]{delete} \tab Delete a group.\cr
#'  \link[=groups_get]{get} \tab Get group details.\cr
#'  \link[=groups_list]{list} \tab List group details.\cr
#'  \link[=groups_patch]{patch} \tab Update group details.\cr
#'  \link[=groups_update]{update} \tab Replace a group.\cr
#' }
#'
#' @rdname groups
#' @export
groups <- list()

#' Create a new group.
#' 
#' Creates a group in the Databricks workspace with a unique name, using the
#' supplied group details.
#'
#' @param display_name String that represents a human-readable group name.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks group ID.
#' @param members 
#' @param roles 
#'
#' @keywords internal
#'
#' @rdname groups_create
#'
#' @aliases groups_create
groups_create <- function(display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, id = NULL, members = NULL, roles = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, roles = roles)
  .state$api$do("POST", "/api/2.0/preview/scim/v2/Groups", body = body)
}
groups$create <- groups_create

#' Delete a group.
#' 
#' Deletes a group from the Databricks workspace.
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#'
#' @keywords internal
#'
#' @rdname groups_delete
#'
#' @aliases groups_delete
groups_delete <- function(id) {

  .state$api$do("DELETE", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}
groups$delete <- groups_delete

#' Get group details.
#' 
#' Gets the information for a specific group in the Databricks workspace.
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#'
#' @keywords internal
#'
#' @rdname groups_get
#'
#' @aliases groups_get
groups_get <- function(id) {

  .state$api$do("GET", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}
groups$get <- groups_get

#' List group details.
#' 
#' Gets all details of the groups associated with the Databricks workspace.
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
#' @rdname groups_list
#'
#' @aliases groups_list
groups_list <- function(attributes = NULL, count = NULL, excluded_attributes = NULL,
  filter = NULL, sort_by = NULL, sort_order = NULL, start_index = NULL) {
  query <- list(attributes = attributes, count = count, excludedAttributes = excluded_attributes,
    filter = filter, sortBy = sort_by, sortOrder = sort_order, startIndex = start_index)

  json <- .state$api$do("GET", "/api/2.0/preview/scim/v2/Groups", query = query)
  return(json$Resources)

}
groups$list <- groups_list

#' Update group details.
#' 
#' Partially updates the details of a group.
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#' @param operations 
#'
#' @keywords internal
#'
#' @rdname groups_patch
#'
#' @aliases groups_patch
groups_patch <- function(id, operations = NULL) {
  body <- list(, operations = operations)
  .state$api$do("PATCH", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""),
    body = body)
}
groups$patch <- groups_patch

#' Replace a group.
#' 
#' Updates the details of a group by replacing the entire group entity.
#'
#' @param display_name String that represents a human-readable group name.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks group ID.
#' @param members 
#' @param roles 
#'
#' @keywords internal
#'
#' @rdname groups_update
#'
#' @aliases groups_update
groups_update <- function(id, display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, members = NULL, roles = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, roles = roles)
  .state$api$do("PUT", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""),
    body = body)
}
groups$update <- groups_update

