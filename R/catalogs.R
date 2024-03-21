# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a catalog.
#' 
#' Creates a new catalog instance in the parent metastore if the caller is a
#' metastore admin or has the **CREATE_CATALOG** privilege.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param connection_name The name of the connection to an external data source.
#' @param name Required. Name of catalog.
#' @param options A map of key-value properties attached to the securable.
#' @param properties A map of key-value properties attached to the securable.
#' @param provider_name The name of delta sharing provider.
#' @param share_name The name of the share under the share provider.
#' @param storage_root Storage root URL for managed tables within catalog.
#'
#' @rdname catalogsCreate
#' @export
catalogsCreate <- function(client, name, comment = NULL, connection_name = NULL,
  options = NULL, properties = NULL, provider_name = NULL, share_name = NULL, storage_root = NULL) {
  body <- list(comment = comment, connection_name = connection_name, name = name,
    options = options, properties = properties, provider_name = provider_name,
    share_name = share_name, storage_root = storage_root)
  client$do("POST", "/api/2.1/unity-catalog/catalogs", body = body)
}

#' Delete a catalog.
#' 
#' Deletes the catalog that matches the supplied name. The caller must be a
#' metastore admin or the owner of the catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param force Force deletion even if the catalog is not empty.
#' @param name Required. The name of the catalog.
#'
#' @rdname catalogsDelete
#' @export
catalogsDelete <- function(client, name, force = NULL) {
  query <- list(force = force)
  client$do("DELETE", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""),
    query = query)
}

#' Get a catalog.
#' 
#' Gets the specified catalog in a metastore. The caller must be a metastore
#' admin, the owner of the catalog, or a user that has the **USE_CATALOG**
#' privilege set for their account.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_browse Whether to include catalogs in the response for which the principal can only access selective metadata for.
#' @param name Required. The name of the catalog.
#'
#' @rdname catalogsGet
#' @export
catalogsGet <- function(client, name, include_browse = NULL) {
  query <- list(include_browse = include_browse)
  client$do("GET", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""), query = query)
}

#' List catalogs.
#' 
#' Gets an array of catalogs in the metastore. If the caller is the metastore
#' admin, all catalogs will be retrieved. Otherwise, only catalogs owned by the
#' caller (or for which the caller has the **USE_CATALOG** privilege) will be
#' retrieved. There is no guarantee of a specific ordering of the elements in
#' the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_browse Whether to include catalogs in the response for which the principal can only access selective metadata for.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname catalogsList
#' @export
catalogsList <- function(client, include_browse = NULL) {
  query <- list(include_browse = include_browse)

  json <- client$do("GET", "/api/2.1/unity-catalog/catalogs", query = query)
  return(json$catalogs)

}

#' Update a catalog.
#' 
#' Updates the catalog that matches the supplied name. The caller must be either
#' the owner of the catalog, or a metastore admin (when changing the owner field
#' of the catalog).
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param enable_predictive_optimization Whether predictive optimization should be enabled for this object and objects under it.
#' @param isolation_mode Whether the current securable is accessible from all workspaces or a specific set of workspaces.
#' @param name Required. The name of the catalog.
#' @param new_name New name for the catalog.
#' @param owner Username of current owner of catalog.
#' @param properties A map of key-value properties attached to the securable.
#'
#' @rdname catalogsUpdate
#' @export
catalogsUpdate <- function(client, name, comment = NULL, enable_predictive_optimization = NULL,
  isolation_mode = NULL, new_name = NULL, owner = NULL, properties = NULL) {
  body <- list(comment = comment, enable_predictive_optimization = enable_predictive_optimization,
    isolation_mode = isolation_mode, new_name = new_name, owner = owner, properties = properties)
  client$do("PATCH", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""),
    body = body)
}

