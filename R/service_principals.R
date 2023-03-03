# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a service principal.
#' 
#' Creates a new service principal in the Databricks Workspace.
#'
#' @param active If this user is active.
#' @param application_id UUID relating to the service principal.
#' @param display_name String that represents a concatenation of given and family names.
#' @param entitlements 
#' @param external_id 
#' @param groups 
#' @param id Databricks service principal ID.
#' @param roles 
databricks_service_principals_create <- function(id, active = NULL, 
    application_id = NULL, 
    display_name = NULL, 
    entitlements = NULL, 
    external_id = NULL, 
    groups = NULL, 
    roles = NULL, 
    ...) {
    body <- list(
        active = active, 
        application_id = application_id, 
        display_name = display_name, 
        entitlements = entitlements, 
        external_id = external_id, 
        groups = groups, 
        id = id, 
        roles = roles, ...)
    
    .api$do("POST", "/api/2.0/preview/scim/v2/ServicePrincipals", body = body)
}

#' Delete a service principal.
#' 
#' Delete a single service principal in the Databricks Workspace.
#'
#' @param id Unique ID for a service principal in the Databricks Workspace.
databricks_service_principals_delete <- function(id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/preview/scim/v2/ServicePrincipals/", id, sep = ""))
}

#' Get service principal details.
#' 
#' Gets the details for a single service principal define in the Databricks
#' Workspace.
#'
#' @param id Unique ID for a service principal in the Databricks Workspace.
databricks_service_principals_get <- function(id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/preview/scim/v2/ServicePrincipals/", id, sep = ""))
}

#' List service principals.
#' 
#' Gets the set of service principals associated with a Databricks Workspace.
#'
#' @param attributes Comma-separated list of attributes to return in response.
#' @param count Desired number of results per page.
#' @param excluded_attributes Comma-separated list of attributes to exclude in response.
#' @param filter Query by which the results have to be filtered.
#' @param sort_by Attribute to sort the results.
#' @param sort_order The order to sort the results.
#' @param start_index Specifies the index of the first result.
databricks_service_principals_list <- function(attributes = NULL, 
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
    
    
    json <- .api$do("GET", "/api/2.0/preview/scim/v2/ServicePrincipals", query = query)
    return (json$Resources)
    
}

#' Update service principal details.
#' 
#' Partially updates the details of a single service principal in the Databricks
#' Workspace.
#'
#' @param id Unique ID for a group in the Databricks Account.
#' @param operations 
databricks_service_principals_patch <- function(id, operations = NULL, 
    ...) {
    body <- list(
        operations = operations, ...)
    
    .api$do("PATCH", paste("/api/2.0/preview/scim/v2/ServicePrincipals/", id, sep = ""), body = body)
}

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
databricks_service_principals_update <- function(id, active = NULL, 
    application_id = NULL, 
    display_name = NULL, 
    entitlements = NULL, 
    external_id = NULL, 
    groups = NULL, 
    roles = NULL, 
    ...) {
    body <- list(
        active = active, 
        application_id = application_id, 
        display_name = display_name, 
        entitlements = entitlements, 
        external_id = external_id, 
        groups = groups, 
        id = id, 
        roles = roles, ...)
    
    .api$do("PUT", paste("/api/2.0/preview/scim/v2/ServicePrincipals/", id, sep = ""), body = body)
}











