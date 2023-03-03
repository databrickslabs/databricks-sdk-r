# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Delete a table.
#' 
#' Deletes a table from the specified parent catalog and schema. The caller must
#' be the owner of the parent catalog, have the **USE_CATALOG** privilege on the
#' parent catalog and be the owner of the parent schema, or be the owner of the
#' table and have the **USE_CATALOG** privilege on the parent catalog and the
#' **USE_SCHEMA** privilege on the parent schema.
#'
#' @param full_name Full name of the table.
databricks_tables_delete <- function(full_name, ...) {
    
    
    .api$do("DELETE", paste("/api/2.1/unity-catalog/tables/", full_name, sep = ""))
}

#' Get a table.
#' 
#' Gets a table from the metastore for a specific catalog and schema. The caller
#' must be a metastore admin, be the owner of the table and have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema, or be the owner of the table and have the
#' **SELECT** privilege on it as well.
#'
#' @param full_name Full name of the table.
#' @param include_delta_metadata Whether delta metadata should be included in the response.
databricks_tables_get <- function(full_name, include_delta_metadata = NULL, 
    ...) {
    query <- list(
        include_delta_metadata = include_delta_metadata, ...)
    
    .api$do("GET", paste("/api/2.1/unity-catalog/tables/", full_name, sep = ""), query = query)
}

#' List tables.
#' 
#' Gets an array of all tables for the current metastore under the parent
#' catalog and schema. The caller must be a metastore admin or an owner of (or
#' have the **SELECT** privilege on) the table. For the latter case, the caller
#' must also be the owner or have the **USE_CATALOG** privilege on the parent
#' catalog and the **USE_SCHEMA** privilege on the parent schema. There is no
#' guarantee of a specific ordering of the elements in the array.
#'
#' @param catalog_name Name of parent catalog for tables of interest.
#' @param include_delta_metadata Whether delta metadata should be included in the response.
#' @param schema_name Parent schema of tables.
databricks_tables_list <- function(catalog_name, schema_name, include_delta_metadata = NULL, 
    ...) {
    query <- list(
        catalog_name = catalog_name, 
        include_delta_metadata = include_delta_metadata, 
        schema_name = schema_name, ...)
    
    
    json <- .api$do("GET", "/api/2.1/unity-catalog/tables", query = query)
    return (json$tables)
    
}

#' List table summaries.
#' 
#' Gets an array of summaries for tables for a schema and catalog within the
#' metastore. The table summaries returned are either:
#' 
#' * summaries for all tables (within the current metastore and parent catalog
#' and schema), when the user is a metastore admin, or: * summaries for all
#' tables and schemas (within the current metastore and parent catalog) for
#' which the user has ownership or the **SELECT** privilege on the table and
#' ownership or **USE_SCHEMA** privilege on the schema, provided that the user
#' also has ownership or the **USE_CATALOG** privilege on the parent catalog.
#' 
#' There is no guarantee of a specific ordering of the elements in the array.
#'
#' @param catalog_name Name of parent catalog for tables of interest.
#' @param max_results Maximum number of tables to return (page length).
#' @param page_token Opaque token to send for the next page of results (pagination).
#' @param schema_name_pattern A sql LIKE pattern (% and _) for schema names.
#' @param table_name_pattern A sql LIKE pattern (% and _) for table names.
databricks_tables_list_summaries <- function(catalog_name, max_results = NULL, 
    page_token = NULL, 
    schema_name_pattern = NULL, 
    table_name_pattern = NULL, 
    ...) {
    query <- list(
        catalog_name = catalog_name, 
        max_results = max_results, 
        page_token = page_token, 
        schema_name_pattern = schema_name_pattern, 
        table_name_pattern = table_name_pattern, ...)
    
    .api$do("GET", "/api/2.1/unity-catalog/table-summaries", query = query)
}











