# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Disable a system schema.
#' 
#' Disables the system schema and removes it from the system catalog. The caller
#' must be an account admin or a metastore admin.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param metastore_id Required. The metastore ID under which the system schema lives.
#' @param schema_name Required. Full name of the system schema.
#'
#' @rdname disable_system_schema
#' @alias systemSchemasDisable
#' @export
disable_system_schema <- function(client, metastore_id, schema_name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/metastores/", metastore_id,
    "/systemschemas/", schema_name, sep = ""))
}

#' @rdname disable_system_schema
#' @export 
systemSchemasDisable <- disable_system_schema
#' Enable a system schema.
#' 
#' Enables the system schema and adds it to the system catalog. The caller must
#' be an account admin or a metastore admin.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param metastore_id Required. The metastore ID under which the system schema lives.
#' @param schema_name Required. Full name of the system schema.
#'
#' @rdname enable_system_schema
#' @alias systemSchemasEnable
#' @export
enable_system_schema <- function(client, metastore_id, schema_name) {

  client$do("PUT", paste("/api/2.1/unity-catalog/metastores/", metastore_id, "/systemschemas/",
    schema_name, sep = ""))
}

#' @rdname enable_system_schema
#' @export 
systemSchemasEnable <- enable_system_schema
#' List system schemas.
#' 
#' Gets an array of system schemas for a metastore. The caller must be an
#' account admin or a metastore admin.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param metastore_id Required. The ID for the metastore in which the system schema resides.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_system_schemas
#' @alias systemSchemasList
#' @export
list_system_schemas <- function(client, metastore_id) {


  json <- client$do("GET", paste("/api/2.1/unity-catalog/metastores/", metastore_id,
    "/systemschemas", , sep = ""))
  return(json$schemas)

}

#' @rdname list_system_schemas
#' @export 
systemSchemasList <- list_system_schemas



