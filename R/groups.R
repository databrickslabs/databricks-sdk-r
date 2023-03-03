# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a new group.
#' 
#' Creates a group in the Databricks Workspace with a unique name, using the
#' supplied group details.
#'
#' @param display_name String that represents a human-readable group name.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks group ID.
#' @param members 
#' @param roles 
databricks_groups_create <- function(id, display_name = NULL, 
    entitlements = NULL, 
    external_id = NULL, 
    groups = NULL, 
    members = NULL, 
    roles = NULL, 
    ...) {
    body <- list(
        display_name = display_name, 
        entitlements = entitlements, 
        external_id = external_id, 
        groups = groups, 
        id = id, 
        members = members, 
        roles = roles, ...)
    
    .api$do("POST", "/api/2.0/preview/scim/v2/Groups", body = body)
}

#' Delete a group.
#' 
#' Deletes a group from the Databricks Workspace.
#'
#' @param id Unique ID for a group in the Databricks Workspace.
databricks_groups_delete <- function(id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}

#' Get group details.
#' 
#' Gets the information for a specific group in the Databricks Workspace.
#'
#' @param id Unique ID for a group in the Databricks Workspace.
databricks_groups_get <- function(id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""))
}

#' List group details.
#' 
#' Gets all details of the groups associated with the Databricks Workspace.
#'
#' @param attributes Comma-separated list of attributes to return in response.
#' @param count Desired number of results per page.
#' @param excluded_attributes Comma-separated list of attributes to exclude in response.
#' @param filter Query by which the results have to be filtered.
#' @param sort_by Attribute to sort the results.
#' @param sort_order The order to sort the results.
#' @param start_index Specifies the index of the first result.
databricks_groups_list <- function(attributes = NULL, 
    count = NULL, 
    excluded_attributes = NULL, 
    filter = NULL, 
    sort_by = NULL, 
    sort_order = NULL, 
    start_index = NULL, 
    ...) {
    query <- list(
        attributes = attributes, 
        count = count, 
        excluded_attributes = excluded_attributes, 
        filter = filter, 
        sort_by = sort_by, 
        sort_order = sort_order, 
        start_index = start_index, ...)
    
    
    json <- .api$do("GET", "/api/2.0/preview/scim/v2/Groups", query = query)
    return (json$Resources)
    
}

#' Update group details.
#' 
#' Partially updates the details of a group.
#'
#' @param id Unique ID for a group in the Databricks Account.
#' @param operations 
databricks_groups_patch <- function(id, operations = NULL, 
    ...) {
    body <- list(
        operations = operations, ...)
    
    .api$do("PATCH", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}

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
databricks_groups_update <- function(id, display_name = NULL, 
    entitlements = NULL, 
    external_id = NULL, 
    groups = NULL, 
    members = NULL, 
    roles = NULL, 
    ...) {
    body <- list(
        display_name = display_name, 
        entitlements = entitlements, 
        external_id = external_id, 
        groups = groups, 
        id = id, 
        members = members, 
        roles = roles, ...)
    
    .api$do("PUT", paste("/api/2.0/preview/scim/v2/Groups/", id, sep = ""), body = body)
}













