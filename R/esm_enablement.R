# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get the enhanced security monitoring setting.
#' 
#' Gets the enhanced security monitoring setting.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param etag etag used for versioning.
#'
#' @rdname esmEnablementGet
#' @export
esmEnablementGet <- function(client, etag = NULL) {
  query <- list(etag = etag)
  client$do("GET", "/api/2.0/settings/types/shield_esm_enablement_ws_db/names/default",
    query = query)
}

#' Update the enhanced security monitoring setting.
#' 
#' Updates the enhanced security monitoring setting for the workspace. A fresh
#' etag needs to be provided in `PATCH` requests (as part of the setting field).
#' The etag can be retrieved by making a `GET` request before the `PATCH`
#' request. If the setting is updated concurrently, `PATCH` fails with 409 and
#' the request must be retried by using the fresh etag in the 409 response.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param allow_missing Required. This should always be set to true for Settings API.
#' @param field_mask Required. Field mask is required to be passed into the PATCH request.
#' @param setting Required. 
#'
#' @rdname esmEnablementUpdate
#' @export
esmEnablementUpdate <- function(client, allow_missing, setting, field_mask) {
  body <- list(allow_missing = allow_missing, field_mask = field_mask, setting = setting)
  client$do("PATCH", "/api/2.0/settings/types/shield_esm_enablement_ws_db/names/default",
    body = body)
}

