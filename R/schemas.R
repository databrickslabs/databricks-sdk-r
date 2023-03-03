# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a schema.
#' 
#' Creates a new schema for catalog in the Metatastore. The caller must be a
#' metastore admin, or have the **CREATE_SCHEMA** privilege in the parent
#' catalog.
#'
#' @param catalog_name Name of parent catalog.
#' @param comment User-provided free-form text description.
#' @param name Name of schema, relative to parent catalog.
#' @param properties A map of key-value properties attached to the securable.
#' @param storage_root Storage root URL for managed tables within schema.
databricks_schemas_create <- function(name, catalog_name, comment = NULL, 
    properties = NULL, 
    storage_root = NULL, 
    ...) {
    body <- list(
        catalog_name = catalog_name, 
        comment = comment, 
        name = name, 
        properties = properties, 
        storage_root = storage_root, ...)
    
    .api$do("POST", "/api/2.1/unity-catalog/schemas", body = body)
}

#' Delete a schema.
#' 
#' Deletes the specified schema from the parent catalog. The caller must be the
#' owner of the schema or an owner of the parent catalog.
#'
#' @param full_name Full name of the schema.
databricks_schemas_delete <- function(full_name, ...) {
    
    
    .api$do("DELETE", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""))
}

#' Get a schema.
#' 
#' Gets the specified schema within the metastore. The caller must be a
#' metastore admin, the owner of the schema, or a user that has the
#' **USE_SCHEMA** privilege on the schema.
#'
#' @param full_name Full name of the schema.
databricks_schemas_get <- function(full_name, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""))
}

#' List schemas.
#' 
#' Gets an array of schemas for a catalog in the metastore. If the caller is the
#' metastore admin or the owner of the parent catalog, all schemas for the
#' catalog will be retrieved. Otherwise, only schemas owned by the caller (or
#' for which the caller has the **USE_SCHEMA** privilege) will be retrieved.
#' There is no guarantee of a specific ordering of the elements in the array.
#'
#' @param catalog_name Parent catalog for schemas of interest.
databricks_schemas_list <- function(catalog_name, ...) {
    query <- list(
        catalog_name = catalog_name, ...)
    
    
    json <- .api$do("GET", "/api/2.1/unity-catalog/schemas", query = query)
    return (json$schemas)
    
}

#' Update a schema.
#' 
#' Updates a schema for a catalog. The caller must be the owner of the schema or
#' a metastore admin. If the caller is a metastore admin, only the __owner__
#' field can be changed in the update. If the __name__ field must be updated,
#' the caller must be a metastore admin or have the **CREATE_SCHEMA** privilege
#' on the parent catalog.
#'
#' @param comment User-provided free-form text description.
#' @param full_name Full name of the schema.
#' @param name Name of schema, relative to parent catalog.
#' @param owner Username of current owner of schema.
#' @param properties A map of key-value properties attached to the securable.
databricks_schemas_update <- function(full_name, comment = NULL, 
    name = NULL, 
    owner = NULL, 
    properties = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, 
        owner = owner, 
        properties = properties, ...)
    
    .api$do("PATCH", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""), body = body)
}













