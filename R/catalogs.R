# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a catalog.
#' 
#' Creates a new catalog instance in the parent metastore if the caller is a
#' metastore admin or has the **CREATE_CATALOG** privilege.
#'
#' @param comment User-provided free-form text description.
#' @param name Name of catalog.
#' @param properties A map of key-value properties attached to the securable.
#' @param provider_name The name of delta sharing provider.
#' @param share_name The name of the share under the share provider.
#' @param storage_root Storage root URL for managed tables within catalog.
catalogs_create <- function(name, comment = NULL, 
    properties = NULL, 
    provider_name = NULL, 
    share_name = NULL, 
    storage_root = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, 
        properties = properties, 
        provider_name = provider_name, 
        share_name = share_name, 
        storage_root = storage_root, ...)
    
    .api$do("POST", "/api/2.1/unity-catalog/catalogs", body = body)
}

#' Delete a catalog.
#' 
#' Deletes the catalog that matches the supplied name. The caller must be a
#' metastore admin or the owner of the catalog.
#'
#' @param force Force deletion even if the catalog is not empty.
#' @param name The name of the catalog.
catalogs_delete <- function(name, force = NULL, 
    ...) {
    query <- list(
        force = force, ...)
    
    .api$do("DELETE", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""), query = query)
}

#' Get a catalog.
#' 
#' Gets the specified catalog in a metastore. The caller must be a metastore
#' admin, the owner of the catalog, or a user that has the **USE_CATALOG**
#' privilege set for their account.
#'
#' @param name The name of the catalog.
catalogs_get <- function(name, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""))
}

#' List catalogs.
#' 
#' Gets an array of catalogs in the metastore. If the caller is the metastore
#' admin, all catalogs will be retrieved. Otherwise, only catalogs owned by the
#' caller (or for which the caller has the **USE_CATALOG** privilege) will be
#' retrieved. There is no guarantee of a specific ordering of the elements in
#' the array.
catalogs_list <- function(...) {
    
    
    json <- .api$do("GET", "/api/2.1/unity-catalog/catalogs")
    return (json$catalogs)
    
}

#' Update a catalog.
#' 
#' Updates the catalog that matches the supplied name. The caller must be either
#' the owner of the catalog, or a metastore admin (when changing the owner field
#' of the catalog).
#'
#' @param comment User-provided free-form text description.
#' @param name Name of catalog.
#' @param owner Username of current owner of catalog.
#' @param properties A map of key-value properties attached to the securable.
catalogs_update <- function(name, comment = NULL, 
    owner = NULL, 
    properties = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, 
        owner = owner, 
        properties = properties, ...)
    
    .api$do("PATCH", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""), body = body)
}













