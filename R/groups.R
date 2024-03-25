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
#' @param entitlements Entitlements assigned to the group.
#' @param external_id This field has no description yet.
#' @param groups This field has no description yet.
#' @param id Databricks group ID.
#' @param members This field has no description yet.
#' @param meta Container for the group identifier.
#' @param roles Corresponds to AWS instance profile/arn role.
#' @param schemas The schema of the group.
#'
#' @rdname groupsCreate
#' @export
groupsCreate <- function(client, display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, id = NULL, members = NULL, meta = NULL, roles = NULL, schemas = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, meta = meta, roles = roles,
    schemas = schemas)
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
#' @export
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
#' @export
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
#' @export
groupsList <- function(client, attributes = NULL, count = NULL, excluded_attributes = NULL,
  filter = NULL, sort_by = NULL, sort_order = NULL, start_index = NULL) {
  query <- list(attributes = attributes, count = count, excludedAttributes = excluded_attributes,
    filter = filter, sortBy = sort_by, sortOrder = sort_order, startIndex = start_index)

  query$startIndex = 0
  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/preview/scim/v2/Groups", query = query)
    if (is.null(nrow(json$Resources))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$Resources)
    query$startIndex <- query$startIndex + nrow(json$Resources)
  }
  # de-duplicate any records via id column
  results <- results[!duplicated(results$id), ]
  return(results)

}
#' Update group details.
#' 
#' Partially updates the details of a group.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#' @param operations This field has no description yet.
#' @param schemas The schema of the patch request.
#'
#' @rdname groupsPatch
#' @export
groupsPatch <- function(client, id, operations = NULL, schemas = NULL) {
  body <- list(Operations = operations, schemas = schemas)
  client$do("PATCH", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}
#' Replace a group.
#' 
#' Updates the details of a group by replacing the entire group entity.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param display_name String that represents a human-readable group name.
#' @param entitlements Entitlements assigned to the group.
#' @param external_id This field has no description yet.
#' @param groups This field has no description yet.
#' @param id Databricks group ID.
#' @param members This field has no description yet.
#' @param meta Container for the group identifier.
#' @param roles Corresponds to AWS instance profile/arn role.
#' @param schemas The schema of the group.
#'
#' @rdname groupsUpdate
#' @export
groupsUpdate <- function(client, id, display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, members = NULL, meta = NULL, roles = NULL, schemas = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, meta = meta, roles = roles,
    schemas = schemas)
  client$do("PUT", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}






