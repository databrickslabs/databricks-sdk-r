# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' User identities recognized by Databricks and represented by email addresses.
#' 
#' Databricks recommends using SCIM provisioning to sync users and groups
#' automatically from your identity provider to your Databricks workspace. SCIM
#' streamlines onboarding a new employee or team by using your identity provider
#' to create users and groups in Databricks workspace and give them the proper
#' level of access. When a user leaves your organization or no longer needs
#' access to Databricks workspace, admins can terminate the user in your
#' identity provider and that user’s account will also be removed from
#' Databricks workspace. This ensures a consistent offboarding process and
#' prevents unauthorized users from accessing sensitive data.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=users_create]{create} \tab Create a new user.\cr
#'  \link[=users_delete]{delete} \tab Delete a user.\cr
#'  \link[=users_get]{get} \tab Get user details.\cr
#'  \link[=users_list]{list} \tab List users.\cr
#'  \link[=users_patch]{patch} \tab Update user details.\cr
#'  \link[=users_update]{update} \tab Replace a user.\cr
#' }
#'
#' @rdname users
#' @export
users <- list()

#' Create a new user.
#' 
#' Creates a new user in the Databricks workspace. This new user will also be
#' added to the Databricks account.
#'
#' @param active If this user is active.
#' @param display_name String that represents a concatenation of given and family names.
#' @param emails All the emails associated with the Databricks user.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks user ID.
#' @param name 
#' @param roles 
#' @param user_name Email address of the Databricks user.
#'
#' @keywords internal
#'
#' @rdname users_create
#'
#' @aliases users_create
users_create <- function(active = NULL, display_name = NULL, emails = NULL, entitlements = NULL,
  external_id = NULL, groups = NULL, id = NULL, name = NULL, roles = NULL, user_name = NULL) {
  body <- list(active = active, displayName = display_name, emails = emails, entitlements = entitlements,
    externalId = external_id, groups = groups, id = id, name = name, roles = roles,
    userName = user_name)
  .state$api$do("POST", "/api/2.0/preview/scim/v2/Users", body = body)
}
users$create <- users_create

#' Delete a user.
#' 
#' Deletes a user. Deleting a user from a Databricks workspace also removes
#' objects associated with the user.
#'
#' @param id Required. Unique ID for a user in the Databricks workspace.
#'
#' @keywords internal
#'
#' @rdname users_delete
#'
#' @aliases users_delete
users_delete <- function(id) {

  .state$api$do("DELETE", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""))
}
users$delete <- users_delete

#' Get user details.
#' 
#' Gets information for a specific user in Databricks workspace.
#'
#' @param id Required. Unique ID for a user in the Databricks workspace.
#'
#' @keywords internal
#'
#' @rdname users_get
#'
#' @aliases users_get
users_get <- function(id) {

  .state$api$do("GET", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""))
}
users$get <- users_get

#' List users.
#' 
#' Gets details for all the users associated with a Databricks workspace.
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
#' @rdname users_list
#'
#' @aliases users_list
users_list <- function(attributes = NULL, count = NULL, excluded_attributes = NULL,
  filter = NULL, sort_by = NULL, sort_order = NULL, start_index = NULL) {
  query <- list(attributes = attributes, count = count, excludedAttributes = excluded_attributes,
    filter = filter, sortBy = sort_by, sortOrder = sort_order, startIndex = start_index)

  json <- .state$api$do("GET", "/api/2.0/preview/scim/v2/Users", query = query)
  return(json$Resources)

}
users$list <- users_list

#' Update user details.
#' 
#' Partially updates a user resource by applying the supplied operations on
#' specific user attributes.
#'
#' @param id Required. Unique ID for a user in the Databricks workspace.
#' @param operations 
#'
#' @keywords internal
#'
#' @rdname users_patch
#'
#' @aliases users_patch
users_patch <- function(id, operations = NULL) {
  body <- list(, operations = operations)
  .state$api$do("PATCH", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""),
    body = body)
}
users$patch <- users_patch

#' Replace a user.
#' 
#' Replaces a user's information with the data supplied in request.
#'
#' @param active If this user is active.
#' @param display_name String that represents a concatenation of given and family names.
#' @param emails All the emails associated with the Databricks user.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks user ID.
#' @param name 
#' @param roles 
#' @param user_name Email address of the Databricks user.
#'
#' @keywords internal
#'
#' @rdname users_update
#'
#' @aliases users_update
users_update <- function(id, active = NULL, display_name = NULL, emails = NULL, entitlements = NULL,
  external_id = NULL, groups = NULL, name = NULL, roles = NULL, user_name = NULL) {
  body <- list(active = active, displayName = display_name, emails = emails, entitlements = entitlements,
    externalId = external_id, groups = groups, id = id, name = name, roles = roles,
    userName = user_name)
  .state$api$do("PUT", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""),
    body = body)
}
users$update <- users_update

