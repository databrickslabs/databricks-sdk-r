# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a Volume.
#' 
#' Creates a new volume.
#' 
#' The user could create either an external volume or a managed volume. An
#' external volume will be created in the specified external location, while a
#' managed volume will be located in the default location which is specified by
#' the parent schema, or the parent catalog, or the Metastore.
#' 
#' For the volume creation to succeed, the user must satisfy following
#' conditions: - The caller must be a metastore admin, or be the owner of the
#' parent catalog and schema, or have the **USE_CATALOG** privilege on the
#' parent catalog and the **USE_SCHEMA** privilege on the parent schema. - The
#' caller must have **CREATE VOLUME** privilege on the parent schema.
#' 
#' For an external volume, following conditions also need to satisfy - The
#' caller must have **CREATE EXTERNAL VOLUME** privilege on the external
#' location. - There are no other tables, nor volumes existing in the specified
#' storage location. - The specified storage location is not under the location
#' of other tables, nor volumes, or catalogs or schemas.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. The name of the catalog where the schema and the volume are.
#' @param comment The comment attached to the volume.
#' @param name Required. The name of the volume.
#' @param schema_name Required. The name of the schema where the volume is.
#' @param storage_location The storage location on the cloud.
#' @param volume_type Required. 
#'
#' @rdname volumesCreate
#' @export
volumesCreate <- function(client, catalog_name, name, schema_name, volume_type, comment = NULL,
  storage_location = NULL) {
  body <- list(catalog_name = catalog_name, comment = comment, name = name, schema_name = schema_name,
    storage_location = storage_location, volume_type = volume_type)
  client$do("POST", "/api/2.1/unity-catalog/volumes", body = body)
}

#' Delete a Volume.
#' 
#' Deletes a volume from the specified parent catalog and schema.
#' 
#' The caller must be a metastore admin or an owner of the volume. For the
#' latter case, the caller must also be the owner or have the **USE_CATALOG**
#' privilege on the parent catalog and the **USE_SCHEMA** privilege on the
#' parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name_arg Required. The three-level (fully qualified) name of the volume.
#'
#' @rdname volumesDelete
#' @export
volumesDelete <- function(client, full_name_arg) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/volumes/", full_name_arg, sep = ""))
}

#' List Volumes.
#' 
#' Gets an array of all volumes for the current metastore under the parent
#' catalog and schema.
#' 
#' The returned volumes are filtered based on the privileges of the calling
#' user. For example, the metastore admin is able to list all the volumes. A
#' regular user needs to be the owner or have the **READ VOLUME** privilege on
#' the volume to recieve the volumes in the response. For the latter case, the
#' caller must also be the owner or have the **USE_CATALOG** privilege on the
#' parent catalog and the **USE_SCHEMA** privilege on the parent schema.
#' 
#' There is no guarantee of a specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. The identifier of the catalog.
#' @param schema_name Required. The identifier of the schema.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname volumesList
#' @export
volumesList <- function(client, catalog_name, schema_name) {
  query <- list(catalog_name = catalog_name, schema_name = schema_name)

  json <- client$do("GET", "/api/2.1/unity-catalog/volumes", query = query)
  return(json$volumes)

}

#' Get a Volume.
#' 
#' Gets a volume from the metastore for a specific catalog and schema.
#' 
#' The caller must be a metastore admin or an owner of (or have the **READ
#' VOLUME** privilege on) the volume. For the latter case, the caller must also
#' be the owner or have the **USE_CATALOG** privilege on the parent catalog and
#' the **USE_SCHEMA** privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name_arg Required. The three-level (fully qualified) name of the volume.
#'
#' @rdname volumesRead
#' @export
volumesRead <- function(client, full_name_arg) {

  client$do("GET", paste("/api/2.1/unity-catalog/volumes/", full_name_arg, sep = ""))
}

#' Update a Volume.
#' 
#' Updates the specified volume under the specified parent catalog and schema.
#' 
#' The caller must be a metastore admin or an owner of the volume. For the
#' latter case, the caller must also be the owner or have the **USE_CATALOG**
#' privilege on the parent catalog and the **USE_SCHEMA** privilege on the
#' parent schema.
#' 
#' Currently only the name, the owner or the comment of the volume could be
#' updated.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment The comment attached to the volume.
#' @param full_name_arg Required. The three-level (fully qualified) name of the volume.
#' @param name The name of the volume.
#' @param owner The identifier of the user who owns the volume.
#'
#' @rdname volumesUpdate
#' @export
volumesUpdate <- function(client, full_name_arg, comment = NULL, name = NULL, owner = NULL) {
  body <- list(comment = comment, name = name, owner = owner)
  client$do("PATCH", paste("/api/2.1/unity-catalog/volumes/", full_name_arg, sep = ""),
    body = body)
}

