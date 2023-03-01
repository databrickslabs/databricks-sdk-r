# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a new user.
#' 
#' Creates a new user in the Databricks Workspace. This new user will also be
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
databricks_users_create <- function(id, active = NULL, 
    display_name = NULL, 
    emails = NULL, 
    entitlements = NULL, 
    external_id = NULL, 
    groups = NULL, 
    name = NULL, 
    roles = NULL, 
    user_name = NULL, 
    ...) {
    body <- list(
        active = active, 
        display_name = display_name, 
        emails = emails, 
        entitlements = entitlements, 
        external_id = external_id, 
        groups = groups, 
        id = id, 
        name = name, 
        roles = roles, 
        user_name = user_name, ...)
    .api$do("POST", "/api/2.0/preview/scim/v2/Users", body = body)
}

#' Delete a user.
#' 
#' Deletes a user. Deleting a user from a Databricks Workspace also removes
#' objects associated with the user.
#'
#' @param id Unique ID for a user in the Databricks Workspace.
databricks_users_delete <- function(id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""))
}

#' Get user details.
#' 
#' Gets information for a specific user in Databricks Workspace.
#'
#' @param id Unique ID for a user in the Databricks Workspace.
databricks_users_get <- function(id, ...) {
    
    .api$do("GET", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""))
}

#' List users.
#' 
#' Gets details for all the users associated with a Databricks Workspace.
#'
#' @param attributes Comma-separated list of attributes to return in response.
#' @param count Desired number of results per page.
#' @param excluded_attributes Comma-separated list of attributes to exclude in response.
#' @param filter Query by which the results have to be filtered.
#' @param sort_by Attribute to sort the results.
#' @param sort_order The order to sort the results.
#' @param start_index Specifies the index of the first result.
databricks_users_list <- function(attributes = NULL, 
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
    .api$do("GET", "/api/2.0/preview/scim/v2/Users", query = query)
}

#' Update user details.
#' 
#' Partially updates a user resource by applying the supplied operations on
#' specific user attributes.
#'
#' @param id Unique ID for a group in the Databricks Account.
#' @param operations 
databricks_users_patch <- function(id, operations = NULL, 
    ...) {
    body <- list(
        operations = operations, ...)
    .api$do("PATCH", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""), body = body)
}

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
databricks_users_update <- function(id, active = NULL, 
    display_name = NULL, 
    emails = NULL, 
    entitlements = NULL, 
    external_id = NULL, 
    groups = NULL, 
    name = NULL, 
    roles = NULL, 
    user_name = NULL, 
    ...) {
    body <- list(
        active = active, 
        display_name = display_name, 
        emails = emails, 
        entitlements = entitlements, 
        external_id = external_id, 
        groups = groups, 
        id = id, 
        name = name, 
        roles = roles, 
        user_name = user_name, ...)
    .api$do("PUT", paste("/api/2.0/preview/scim/v2/Users/", id, sep = ""), body = body)
}

