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
#'
#' @rdname get_esm_enablement
#' @alias esmEnablementGet
#' @export
get_esm_enablement <- function(client, etag = NULL) {
  query <- list(etag = etag)
  client$do("GET", "/api/2.0/settings/types/shield_esm_enablement_ws_db/names/default",
    query = query)
}

#' @rdname get_esm_enablement
#' @export 
esmEnablementGet <- get_esm_enablement
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
#' @param setting Required. This field has no description yet.
#'
#'
#' @rdname update_esm_enablement
#' @alias esmEnablementUpdate
#' @export
update_esm_enablement <- function(client, allow_missing, setting, field_mask) {
  body <- list(allow_missing = allow_missing, field_mask = field_mask, setting = setting)
  client$do("PATCH", "/api/2.0/settings/types/shield_esm_enablement_ws_db/names/default",
    body = body)
}

#' @rdname update_esm_enablement
#' @export 
esmEnablementUpdate <- update_esm_enablement


