# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a new group.
#' 
#' Creates a group in the Databricks workspace with a unique name, using the
#' supplied group details.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param display_name String that represents a human-readable group name.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks group ID.
#' @param members 
#' @param meta Container for the group identifier.
#' @param roles 
#'
#' @rdname groupsCreate
groupsCreate <- function(client, display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, id = NULL, members = NULL, meta = NULL, roles = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, meta = meta, roles = roles)
  client$do("POST", "/api/2.0/preview/scim/v2/Groups", body = body)
}

#' Delete a group.
#' 
#' Deletes a group from the Databricks workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#'
#' @rdname groupsDelete
groupsDelete <- function(client, id) {

  client$do("DELETE", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}

#' Get group details.
#' 
#' Gets the information for a specific group in the Databricks workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#'
#' @rdname groupsGet
groupsGet <- function(client, id) {

  client$do("GET", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}

#' List group details.
#' 
#' Gets all details of the groups associated with the Databricks workspace.
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
#' @rdname groupsList
groupsList <- function(client, attributes = NULL, count = NULL, excluded_attributes = NULL,
  filter = NULL, sort_by = NULL, sort_order = NULL, start_index = NULL) {
  query <- list(attributes = attributes, count = count, excludedAttributes = excluded_attributes,
    filter = filter, sortBy = sort_by, sortOrder = sort_order, startIndex = start_index)

  json <- client$do("GET", "/api/2.0/preview/scim/v2/Groups", query = query)
  return(json$Resources)

}

#' Update group details.
#' 
#' Partially updates the details of a group.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#' @param operations 
#' @param schema The schema of the patch request.
#'
#' @rdname groupsPatch
groupsPatch <- function(client, id, operations = NULL, schema = NULL) {
  body <- list(, Operations = operations, schema = schema)
  client$do("PATCH", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}

#' Replace a group.
#' 
#' Updates the details of a group by replacing the entire group entity.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param display_name String that represents a human-readable group name.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks group ID.
#' @param members 
#' @param meta Container for the group identifier.
#' @param roles 
#'
#' @rdname groupsUpdate
groupsUpdate <- function(client, id, display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, members = NULL, meta = NULL, roles = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, meta = meta, roles = roles)
  client$do("PUT", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}

