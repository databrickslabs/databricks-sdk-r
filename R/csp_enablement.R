# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get the compliance security profile setting.
#' 
#' Gets the compliance security profile setting.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param etag etag used for versioning.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/cspenablement/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_csp_enablement
#' @alias cspEnablementGet
#' @export
get_csp_enablement <- function(client, etag = NULL) {
  query <- list(etag = etag)
  client$do("GET", "/api/2.0/settings/types/shield_csp_enablement_ws_db/names/default",
    query = query)
}

#' @rdname get_csp_enablement
#' @export 
cspEnablementGet <- get_csp_enablement
#' Update the compliance security profile setting.
#' 
#' Updates the compliance security profile setting for the workspace. A fresh
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
#' See the [API documentation](https://docs.databricks.com/api/workspace/cspenablement/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_csp_enablement
#' @alias cspEnablementUpdate
#' @export
update_csp_enablement <- function(client, allow_missing, setting, field_mask) {
  body <- list(allow_missing = allow_missing, field_mask = field_mask, setting = setting)
  client$do("PATCH", "/api/2.0/settings/types/shield_csp_enablement_ws_db/names/default",
    body = body)
}

#' @rdname update_csp_enablement
#' @export 
cspEnablementUpdate <- update_csp_enablement


