# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create access list.
#' 
#' Creates an IP access list for this workspace.
#' 
#' A list can be an allow list or a block list. See the top of this file for a
#' description of how the server treats allow lists and block lists at runtime.
#' 
#' When creating or updating an IP access list:
#' 
#' * For all allow lists and block lists combined, the API supports a maximum of
#' 1000 IP/CIDR values, where one CIDR counts as a single value. Attempts to
#' exceed that number return error 400 with `error_code` value `QUOTA_EXCEEDED`.
#' * If the new list would block the calling user's current IP, error 400 is
#' returned with `error_code` value `INVALID_STATE`.
#' 
#' It can take a few minutes for the changes to take effect. **Note**: Your new
#' IP access list has no effect until you enable the feature. See
#' :method:workspaceconf/setStatus
#'
#' @param ip_addresses Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label Label for the IP access list.
#' @param list_type This describes an enum.
databricks_ip_access_lists_create <- function(label, list_type, ip_addresses, ...) {
    body <- list(
        ip_addresses = ip_addresses, 
        label = label, 
        list_type = list_type, ...)
    
    .api$do("POST", "/api/2.0/ip-access-lists", body = body)
}

#' Delete access list.
#' 
#' Deletes an IP access list, specified by its list ID.
#'
#' @param ip_access_list_id The ID for the corresponding IP access list to modify.
databricks_ip_access_lists_delete <- function(ip_access_list_id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""))
}

#' Get access list.
#' 
#' Gets an IP access list, specified by its list ID.
#'
#' @param ip_access_list_id The ID for the corresponding IP access list to modify.
databricks_ip_access_lists_get <- function(ip_access_list_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""))
}

#' Get access lists.
#' 
#' Gets all IP access lists for the specified workspace.
databricks_ip_access_lists_list <- function(...) {
    
    
    json <- .api$do("GET", "/api/2.0/ip-access-lists")
    return (json$ip_access_lists)
    
}

#' Replace access list.
#' 
#' Replaces an IP access list, specified by its ID.
#' 
#' A list can include allow lists and block lists. See the top of this file for
#' a description of how the server treats allow lists and block lists at run
#' time. When replacing an IP access list: * For all allow lists and block lists
#' combined, the API supports a maximum of 1000 IP/CIDR values, where one CIDR
#' counts as a single value. Attempts to exceed that number return error 400
#' with `error_code` value `QUOTA_EXCEEDED`. * If the resulting list would block
#' the calling user's current IP, error 400 is returned with `error_code` value
#' `INVALID_STATE`. It can take a few minutes for the changes to take effect.
#' Note that your resulting IP access list has no effect until you enable the
#' feature. See :method:workspaceconf/setStatus.
#'
#' @param enabled Specifies whether this IP access list is enabled.
#' @param ip_access_list_id The ID for the corresponding IP access list to modify.
#' @param ip_addresses Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label Label for the IP access list.
#' @param list_id Universally unique identifier(UUID) of the IP access list.
#' @param list_type This describes an enum.
databricks_ip_access_lists_replace <- function(label, list_type, ip_addresses, enabled, ip_access_list_id, list_id = NULL, 
    ...) {
    body <- list(
        enabled = enabled, 
        ip_addresses = ip_addresses, 
        label = label, 
        list_id = list_id, 
        list_type = list_type, ...)
    
    .api$do("PUT", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""), body = body)
}

#' Update access list.
#' 
#' Updates an existing IP access list, specified by its ID.
#' 
#' A list can include allow lists and block lists. See the top of this file for
#' a description of how the server treats allow lists and block lists at run
#' time.
#' 
#' When updating an IP access list:
#' 
#' * For all allow lists and block lists combined, the API supports a maximum of
#' 1000 IP/CIDR values, where one CIDR counts as a single value. Attempts to
#' exceed that number return error 400 with `error_code` value `QUOTA_EXCEEDED`.
#' * If the updated list would block the calling user's current IP, error 400 is
#' returned with `error_code` value `INVALID_STATE`.
#' 
#' It can take a few minutes for the changes to take effect. Note that your
#' resulting IP access list has no effect until you enable the feature. See
#' :method:workspaceconf/setStatus.
#'
#' @param enabled Specifies whether this IP access list is enabled.
#' @param ip_access_list_id The ID for the corresponding IP access list to modify.
#' @param ip_addresses Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label Label for the IP access list.
#' @param list_id Universally unique identifier(UUID) of the IP access list.
#' @param list_type This describes an enum.
databricks_ip_access_lists_update <- function(label, list_type, ip_addresses, enabled, ip_access_list_id, list_id = NULL, 
    ...) {
    body <- list(
        enabled = enabled, 
        ip_addresses = ip_addresses, 
        label = label, 
        list_id = list_id, 
        list_type = list_type, ...)
    
    .api$do("PATCH", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""), body = body)
}











