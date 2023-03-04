# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' IP Access List enables admins to configure IP access lists.
#' 
#' IP access lists affect web application access and REST API access to this
#' workspace only. If the feature is disabled for a workspace, all access is
#' allowed for this workspace. There is support for allow lists (inclusion) and
#' block lists (exclusion).
#' 
#' When a connection is attempted: 1. **First, all block lists are checked.** If
#' the connection IP address matches any block list, the connection is rejected.
#' 2. **If the connection was not rejected by block lists**, the IP address is
#' compared with the allow lists.
#' 
#' If there is at least one allow list for the workspace, the connection is
#' allowed only if the IP address matches an allow list. If there are no allow
#' lists for the workspace, all IP addresses are allowed.
#' 
#' For all allow lists and block lists combined, the workspace supports a
#' maximum of 1000 IP/CIDR values, where one CIDR counts as a single value.
#' 
#' After changes to the IP access list feature, it can take a few minutes for
#' changes to take effect.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=ip_access_lists_create]{create} \tab Create access list.\cr
#'  \link[=ip_access_lists_delete]{delete} \tab Delete access list.\cr
#'  \link[=ip_access_lists_get]{get} \tab Get access list.\cr
#'  \link[=ip_access_lists_list]{list} \tab Get access lists.\cr
#'  \link[=ip_access_lists_replace]{replace} \tab Replace access list.\cr
#'  \link[=ip_access_lists_update]{update} \tab Update access list.\cr
#' }
#'
#' @rdname ip_access_lists
#' @export
ip_access_lists <- list()

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
#' @param ip_addresses [required] Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label [required] Label for the IP access list.
#' @param list_type [required] This describes an enum.
#'
#' @keywords internal
#'
#' @rdname ip_access_lists_create
#'
#' @aliases ip_access_lists_create
ip_access_lists_create <- function(label, list_type, ip_addresses, ...) {
  body <- list(ip_addresses = ip_addresses, label = label, list_type = list_type,
    ...)

  .api$do("POST", "/api/2.0/ip-access-lists", body = body)
}
ip_access_lists$create <- ip_access_lists_create

#' Delete access list.
#' 
#' Deletes an IP access list, specified by its list ID.
#'
#' @param ip_access_list_id [required] The ID for the corresponding IP access list to modify.
#'
#' @keywords internal
#'
#' @rdname ip_access_lists_delete
#'
#' @aliases ip_access_lists_delete
ip_access_lists_delete <- function(ip_access_list_id, ...) {


  .api$do("DELETE", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""))
}
ip_access_lists$delete <- ip_access_lists_delete

#' Get access list.
#' 
#' Gets an IP access list, specified by its list ID.
#'
#' @param ip_access_list_id [required] The ID for the corresponding IP access list to modify.
#'
#' @keywords internal
#'
#' @rdname ip_access_lists_get
#'
#' @aliases ip_access_lists_get
ip_access_lists_get <- function(ip_access_list_id, ...) {


  .api$do("GET", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""))
}
ip_access_lists$get <- ip_access_lists_get

#' Get access lists.
#' 
#' Gets all IP access lists for the specified workspace.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname ip_access_lists_list
#'
#' @aliases ip_access_lists_list
ip_access_lists_list <- function(...) {


  json <- .api$do("GET", "/api/2.0/ip-access-lists")
  return(json$ip_access_lists)

}
ip_access_lists$list <- ip_access_lists_list

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
#' @param enabled [required] Specifies whether this IP access list is enabled.
#' @param ip_access_list_id [required] The ID for the corresponding IP access list to modify.
#' @param ip_addresses [required] Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label [required] Label for the IP access list.
#' @param list_id Universally unique identifier(UUID) of the IP access list.
#' @param list_type [required] This describes an enum.
#'
#' @keywords internal
#'
#' @rdname ip_access_lists_replace
#'
#' @aliases ip_access_lists_replace
ip_access_lists_replace <- function(label, list_type, ip_addresses, enabled, ip_access_list_id,
  list_id = NULL, ...) {
  body <- list(enabled = enabled, ip_addresses = ip_addresses, label = label, list_id = list_id,
    list_type = list_type, ...)

  .api$do("PUT", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""),
    body = body)
}
ip_access_lists$replace <- ip_access_lists_replace

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
#' @param enabled [required] Specifies whether this IP access list is enabled.
#' @param ip_access_list_id [required] The ID for the corresponding IP access list to modify.
#' @param ip_addresses [required] Array of IP addresses or CIDR values to be added to the IP access list.
#' @param label [required] Label for the IP access list.
#' @param list_id Universally unique identifier(UUID) of the IP access list.
#' @param list_type [required] This describes an enum.
#'
#' @keywords internal
#'
#' @rdname ip_access_lists_update
#'
#' @aliases ip_access_lists_update
ip_access_lists_update <- function(label, list_type, ip_addresses, enabled, ip_access_list_id,
  list_id = NULL, ...) {
  body <- list(enabled = enabled, ip_addresses = ip_addresses, label = label, list_id = list_id,
    list_type = list_type, ...)

  .api$do("PATCH", paste("/api/2.0/ip-access-lists/", ip_access_list_id, sep = ""),
    body = body)
}
ip_access_lists$update <- ip_access_lists_update













