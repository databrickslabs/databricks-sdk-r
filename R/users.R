# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a new user.
#' 
#' Creates a new user in the Databricks workspace. This new user will also be
#' added to the Databricks account.
#' @param client Required. Instance of DatabricksClient()
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
#' @rdname usersCreate
usersCreate <- function(client, active = NULL, display_name = NULL, emails = NULL,
  entitlements = NULL, external_id = NULL, groups = NULL, id = NULL, name = NULL,
  roles = NULL, user_name = NULL) {
  body <- list(active = active, displayName = display_name, emails = emails, entitlements = entitlements,
    externalId = external_id, groups = groups, id = id, name = name, roles = roles,
    userName = user_name)
  client$do("POST", "/api/2.0/preview/scim/v2/Users", body = body)
}

#' Delete a user.
#' 
#' Deletes a user. Deleting a user from a Databricks workspace also removes
#' objects associated with the user.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a user in the Databricks workspace.
#'
#' @rdname usersDelete
usersDelete <- function(client, id) {

  client$do("DELETE", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""))
}

#' Get user details.
#' 
#' Gets information for a specific user in Databricks workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a user in the Databricks workspace.
#'
#' @rdname usersGet
usersGet <- function(client, id) {

  client$do("GET", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""))
}

#' List users.
#' 
#' Gets details for all the users associated with a Databricks workspace.
#' @param client Required. Instance of DatabricksClient()
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
#' @rdname usersList
usersList <- function(client, attributes = NULL, count = NULL, excluded_attributes = NULL,
  filter = NULL, sort_by = NULL, sort_order = NULL, start_index = NULL) {
  query <- list(attributes = attributes, count = count, excludedAttributes = excluded_attributes,
    filter = filter, sortBy = sort_by, sortOrder = sort_order, startIndex = start_index)

  json <- client$do("GET", "/api/2.0/preview/scim/v2/Users", query = query)
  return(json$Resources)

}

#' Update user details.
#' 
#' Partially updates a user resource by applying the supplied operations on
#' specific user attributes.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a user in the Databricks workspace.
#' @param operations 
#' @param schema The schema of the patch request.
#'
#' @rdname usersPatch
usersPatch <- function(client, id, operations = NULL, schema = NULL) {
  body <- list(, Operations = operations, schema = schema)
  client$do("PATCH", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""), body = body)
}

#' Replace a user.
#' 
#' Replaces a user's information with the data supplied in request.
#' @param client Required. Instance of DatabricksClient()
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
#' @rdname usersUpdate
usersUpdate <- function(client, id, active = NULL, display_name = NULL, emails = NULL,
  entitlements = NULL, external_id = NULL, groups = NULL, name = NULL, roles = NULL,
  user_name = NULL) {
  body <- list(active = active, displayName = display_name, emails = emails, entitlements = entitlements,
    externalId = external_id, groups = groups, id = id, name = name, roles = roles,
    userName = user_name)
  client$do("PUT", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""), body = body)
}

