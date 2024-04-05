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
#'
#' @rdname create_group
#' @alias groupsCreate
#' @export
create_group <- function(client, display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, id = NULL, members = NULL, meta = NULL, roles = NULL, schemas = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, meta = meta, roles = roles,
    schemas = schemas)
  client$do("POST", "/api/2.0/preview/scim/v2/Groups", body = body)
}

#' @rdname create_group
#' @export 
groupsCreate <- create_group
#' Delete a group.
#' 
#' Deletes a group from the Databricks workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#'
#'
#' @rdname delete_group
#' @alias groupsDelete
#' @export
delete_group <- function(client, id) {

  client$do("DELETE", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}

#' @rdname delete_group
#' @export 
groupsDelete <- delete_group
#' Get group details.
#' 
#' Gets the information for a specific group in the Databricks workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#'
#'
#' @rdname get_group
#' @alias groupsGet
#' @export
get_group <- function(client, id) {

  client$do("GET", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}

#' @rdname get_group
#' @export 
groupsGet <- get_group
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
#'
#' @rdname list_groups
#' @alias groupsList
#' @export
list_groups <- function(client, attributes = NULL, count = NULL, excluded_attributes = NULL,
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

#' @rdname list_groups
#' @export 
groupsList <- list_groups
#' Update group details.
#' 
#' Partially updates the details of a group.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID for a group in the Databricks workspace.
#' @param operations This field has no description yet.
#' @param schemas The schema of the patch request.
#'
#'
#' @rdname patch_group
#' @alias groupsPatch
#' @export
patch_group <- function(client, id, operations = NULL, schemas = NULL) {
  body <- list(Operations = operations, schemas = schemas)
  client$do("PATCH", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}

#' @rdname patch_group
#' @export 
groupsPatch <- patch_group
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
#'
#' @rdname update_group
#' @alias groupsUpdate
#' @export
update_group <- function(client, id, display_name = NULL, entitlements = NULL, external_id = NULL,
  groups = NULL, members = NULL, meta = NULL, roles = NULL, schemas = NULL) {
  body <- list(displayName = display_name, entitlements = entitlements, externalId = external_id,
    groups = groups, id = id, members = members, meta = meta, roles = roles,
    schemas = schemas)
  client$do("PUT", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}

#' @rdname update_group
#' @export 
groupsUpdate <- update_group






