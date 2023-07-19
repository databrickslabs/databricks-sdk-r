# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param ip_addresses Required. Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label Required. Label for the IP access list.
#' @param list_type Required. This describes an enum.
#'
#' @rdname ipAccessListsCreate
#' @export
ipAccessListsCreate <- function(client, label, list_type, ip_addresses) {
    body <- list(
        ip_addresses = ip_addresses
        , label = label
        , list_type = list_type)
    client$do("POST", "/api/2.0/ip-access-lists", body = body)
}

#' Delete access list.
#' 
#' Deletes an IP access list, specified by its list ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param ip_access_list_id Required. The ID for the corresponding IP access list to modify.
#'
#' @rdname ipAccessListsDelete
#' @export
ipAccessListsDelete <- function(client, ip_access_list_id) {
    
    client$do("DELETE", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""))
}

#' Get access list.
#' 
#' Gets an IP access list, specified by its list ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param ip_access_list_id Required. The ID for the corresponding IP access list to modify.
#'
#' @rdname ipAccessListsGet
#' @export
ipAccessListsGet <- function(client, ip_access_list_id) {
    
    client$do("GET", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""))
}

#' Get access lists.
#' 
#' Gets all IP access lists for the specified workspace.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname ipAccessListsList
#' @export
ipAccessListsList <- function(client) {
    
    json <- client$do("GET", "/api/2.0/ip-access-lists")
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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param enabled Required. Specifies whether this IP access list is enabled.
#' @param ip_access_list_id Required. The ID for the corresponding IP access list to modify.
#' @param ip_addresses Required. Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label Required. Label for the IP access list.
#' @param list_id Universally unique identifier (UUID) of the IP access list.
#' @param list_type Required. This describes an enum.
#'
#' @rdname ipAccessListsReplace
#' @export
ipAccessListsReplace <- function(client, label, list_type, ip_addresses, enabled, ip_access_list_id, list_id=NULL) {
    body <- list(
        enabled = enabled
        , ip_addresses = ip_addresses
        , label = label
        , list_id = list_id
        , list_type = list_type)
    client$do("PUT", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""), body = body)
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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param enabled Required. Specifies whether this IP access list is enabled.
#' @param ip_access_list_id Required. The ID for the corresponding IP access list to modify.
#' @param ip_addresses Required. Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label Required. Label for the IP access list.
#' @param list_id Universally unique identifier (UUID) of the IP access list.
#' @param list_type Required. This describes an enum.
#'
#' @rdname ipAccessListsUpdate
#' @export
ipAccessListsUpdate <- function(client, label, list_type, ip_addresses, enabled, ip_access_list_id, list_id=NULL) {
    body <- list(
        enabled = enabled
        , ip_addresses = ip_addresses
        , label = label
        , list_id = list_id
        , list_type = list_type)
    client$do("PATCH", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""), body = body)
}

