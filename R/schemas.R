# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a schema.
#' 
#' Creates a new schema for catalog in the Metatastore. The caller must be a
#' metastore admin, or have the **CREATE_SCHEMA** privilege in the parent
#' catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. Name of parent catalog.
#' @param comment User-provided free-form text description.
#' @param name Required. Name of schema, relative to parent catalog.
#' @param properties A map of key-value properties attached to the securable.
#' @param storage_root Storage root URL for managed tables within schema.
#'
#' @rdname schemasCreate
schemasCreate <- function(client, name, catalog_name, comment = NULL, properties = NULL,
  storage_root = NULL) {
  body <- list(catalog_name = catalog_name, comment = comment, name = name, properties = properties,
    storage_root = storage_root)
  client$do("POST", "/api/2.1/unity-catalog/schemas", body = body)
}

#' Delete a schema.
#' 
#' Deletes the specified schema from the parent catalog. The caller must be the
#' owner of the schema or an owner of the parent catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the schema.
#'
#' @rdname schemasDelete
schemasDelete <- function(client, full_name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""))
}

#' Get a schema.
#' 
#' Gets the specified schema within the metastore. The caller must be a
#' metastore admin, the owner of the schema, or a user that has the
#' **USE_SCHEMA** privilege on the schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the schema.
#'
#' @rdname schemasGet
schemasGet <- function(client, full_name) {

  client$do("GET", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""))
}

#' List schemas.
#' 
#' Gets an array of schemas for a catalog in the metastore. If the caller is the
#' metastore admin or the owner of the parent catalog, all schemas for the
#' catalog will be retrieved. Otherwise, only schemas owned by the caller (or
#' for which the caller has the **USE_SCHEMA** privilege) will be retrieved.
#' There is no guarantee of a specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. Parent catalog for schemas of interest.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname schemasList
schemasList <- function(client, catalog_name) {
  query <- list(catalog_name = catalog_name)

  json <- client$do("GET", "/api/2.1/unity-catalog/schemas", query = query)
  return(json$schemas)

}

#' Update a schema.
#' 
#' Updates a schema for a catalog. The caller must be the owner of the schema or
#' a metastore admin. If the caller is a metastore admin, only the __owner__
#' field can be changed in the update. If the __name__ field must be updated,
#' the caller must be a metastore admin or have the **CREATE_SCHEMA** privilege
#' on the parent catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param full_name Required. Full name of the schema.
#' @param name Name of schema, relative to parent catalog.
#' @param owner Username of current owner of schema.
#' @param properties A map of key-value properties attached to the securable.
#'
#' @rdname schemasUpdate
schemasUpdate <- function(client, full_name, comment = NULL, name = NULL, owner = NULL,
  properties = NULL) {
  body <- list(comment = comment, name = name, owner = owner, properties = properties)
  client$do("PATCH", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""),
    body = body)
}

