# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Delete the restrict workspace admins setting.
#' 
#' Reverts the restrict workspace admins setting status for the workspace. A
#' fresh etag needs to be provided in `DELETE` requests (as a query parameter).
#' The etag can be retrieved by making a `GET` request before the DELETE
#' request. If the setting is updated/deleted concurrently, `DELETE` fails with
#' 409 and the request must be retried by using the fresh etag in the 409
#' response.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param etag etag used for versioning.
#'
#' @rdname restrictWorkspaceAdminsDelete
#' @export
restrictWorkspaceAdminsDelete <- function(client, etag = NULL) {
  query <- list(etag = etag)
  client$do("DELETE", "/api/2.0/settings/types/restrict_workspace_admins/names/default",
    query = query)
}

#' Get the restrict workspace admins setting.
#' 
#' Gets the restrict workspace admins setting.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param etag etag used for versioning.
#'
#' @rdname restrictWorkspaceAdminsGet
#' @export
restrictWorkspaceAdminsGet <- function(client, etag = NULL) {
  query <- list(etag = etag)
  client$do("GET", "/api/2.0/settings/types/restrict_workspace_admins/names/default",
    query = query)
}

#' Update the restrict workspace admins setting.
#' 
#' Updates the restrict workspace admins setting for the workspace. A fresh etag
#' needs to be provided in `PATCH` requests (as part of the setting field). The
#' etag can be retrieved by making a GET request before the `PATCH` request. If
#' the setting is updated concurrently, `PATCH` fails with 409 and the request
#' must be retried by using the fresh etag in the 409 response.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param allow_missing Required. This should always be set to true for Settings API.
#' @param field_mask Required. Field mask is required to be passed into the PATCH request.
#' @param setting Required. 
#'
#' @rdname restrictWorkspaceAdminsUpdate
#' @export
restrictWorkspaceAdminsUpdate <- function(client, allow_missing, setting, field_mask) {
  body <- list(allow_missing = allow_missing, field_mask = field_mask, setting = setting)
  client$do("PATCH", "/api/2.0/settings/types/restrict_workspace_admins/names/default",
    body = body)
}

