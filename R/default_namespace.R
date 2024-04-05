# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Delete the default namespace setting.
#' 
#' Deletes the default namespace setting for the workspace. A fresh etag needs
#' to be provided in `DELETE` requests (as a query parameter). The etag can be
#' retrieved by making a `GET` request before the `DELETE` request. If the
#' setting is updated/deleted concurrently, `DELETE` fails with 409 and the
#' request must be retried by using the fresh etag in the 409 response.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param etag etag used for versioning.
#'
#'
#' @rdname delete_default_namespace
#' @alias defaultNamespaceDelete
#' @export
delete_default_namespace <- function(client, etag = NULL) {
  query <- list(etag = etag)
  client$do("DELETE", "/api/2.0/settings/types/default_namespace_ws/names/default",
    query = query)
}

#' @rdname delete_default_namespace
#' @export 
defaultNamespaceDelete <- delete_default_namespace
#' Get the default namespace setting.
#' 
#' Gets the default namespace setting.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param etag etag used for versioning.
#'
#'
#' @rdname get_default_namespace
#' @alias defaultNamespaceGet
#' @export
get_default_namespace <- function(client, etag = NULL) {
  query <- list(etag = etag)
  client$do("GET", "/api/2.0/settings/types/default_namespace_ws/names/default",
    query = query)
}

#' @rdname get_default_namespace
#' @export 
defaultNamespaceGet <- get_default_namespace
#' Update the default namespace setting.
#' 
#' Updates the default namespace setting for the workspace. A fresh etag needs
#' to be provided in `PATCH` requests (as part of the setting field). The etag
#' can be retrieved by making a `GET` request before the `PATCH` request. Note
#' that if the setting does not exist, `GET` returns a NOT_FOUND error and the
#' etag is present in the error response, which should be set in the `PATCH`
#' request. If the setting is updated concurrently, `PATCH` fails with 409 and
#' the request must be retried by using the fresh etag in the 409 response.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param allow_missing Required. This should always be set to true for Settings API.
#' @param field_mask Required. Field mask is required to be passed into the PATCH request.
#' @param setting Required. This represents the setting configuration for the default namespace in the Databricks workspace.
#'
#'
#' @rdname update_default_namespace
#' @alias defaultNamespaceUpdate
#' @export
update_default_namespace <- function(client, allow_missing, setting, field_mask) {
  body <- list(allow_missing = allow_missing, field_mask = field_mask, setting = setting)
  client$do("PATCH", "/api/2.0/settings/types/default_namespace_ws/names/default",
    body = body)
}

#' @rdname update_default_namespace
#' @export 
defaultNamespaceUpdate <- update_default_namespace



