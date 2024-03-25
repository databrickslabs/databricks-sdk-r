# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Delete a table.
#' 
#' Deletes a table from the specified parent catalog and schema. The caller must
#' be the owner of the parent catalog, have the **USE_CATALOG** privilege on the
#' parent catalog and be the owner of the parent schema, or be the owner of the
#' table and have the **USE_CATALOG** privilege on the parent catalog and the
#' **USE_SCHEMA** privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#'
#' @rdname delete_table
#' @export
delete_table <- function(client, full_name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/tables/", full_name, sep = ""))
}
#' Get boolean reflecting if table exists.
#' 
#' Gets if a table exists in the metastore for a specific catalog and schema.
#' The caller must satisfy one of the following requirements: * Be a metastore
#' admin * Be the owner of the parent catalog * Be the owner of the parent
#' schema and have the USE_CATALOG privilege on the parent catalog * Have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema, and either be the table owner or have the
#' SELECT privilege on the table. * Have BROWSE privilege on the parent catalog
#' * Have BROWSE privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#'
#' @rdname exists_table
#' @export
exists_table <- function(client, full_name) {

  client$do("GET", paste("/api/2.1/unity-catalog/tables/", full_name, "/exists",
    , sep = ""))
}
#' Get a table.
#' 
#' Gets a table from the metastore for a specific catalog and schema. The caller
#' must satisfy one of the following requirements: * Be a metastore admin * Be
#' the owner of the parent catalog * Be the owner of the parent schema and have
#' the USE_CATALOG privilege on the parent catalog * Have the **USE_CATALOG**
#' privilege on the parent catalog and the **USE_SCHEMA** privilege on the
#' parent schema, and either be the table owner or have the SELECT privilege on
#' the table.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#' @param include_browse Whether to include tables in the response for which the principal can only access selective metadata for.
#' @param include_delta_metadata Whether delta metadata should be included in the response.
#'
#' @rdname get_table
#' @export
get_table <- function(client, full_name, include_browse = NULL, include_delta_metadata = NULL) {
  query <- list(include_browse = include_browse, include_delta_metadata = include_delta_metadata)
  client$do("GET", paste("/api/2.1/unity-catalog/tables/", full_name, sep = ""),
    query = query)
}
#' List tables.
#' 
#' Gets an array of all tables for the current metastore under the parent
#' catalog and schema. The caller must be a metastore admin or an owner of (or
#' have the **SELECT** privilege on) the table. For the latter case, the caller
#' must also be the owner or have the **USE_CATALOG** privilege on the parent
#' catalog and the **USE_SCHEMA** privilege on the parent schema. There is no
#' guarantee of a specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. Name of parent catalog for tables of interest.
#' @param include_browse Whether to include tables in the response for which the principal can only access selective metadata for.
#' @param include_delta_metadata Whether delta metadata should be included in the response.
#' @param max_results Maximum number of tables to return.
#' @param omit_columns Whether to omit the columns of the table from the response or not.
#' @param omit_properties Whether to omit the properties of the table from the response or not.
#' @param page_token Opaque token to send for the next page of results (pagination).
#' @param schema_name Required. Parent schema of tables.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_tables
#' @export
list_tables <- function(client, catalog_name, schema_name, include_browse = NULL,
  include_delta_metadata = NULL, max_results = NULL, omit_columns = NULL, omit_properties = NULL,
  page_token = NULL) {
  query <- list(catalog_name = catalog_name, include_browse = include_browse, include_delta_metadata = include_delta_metadata,
    max_results = max_results, omit_columns = omit_columns, omit_properties = omit_properties,
    page_token = page_token, schema_name = schema_name)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/tables", query = query)
    if (is.null(nrow(json$tables))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$tables)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
#' List table summaries.
#' 
#' Gets an array of summaries for tables for a schema and catalog within the
#' metastore. The table summaries returned are either:
#' 
#' * summaries for tables (within the current metastore and parent catalog and
#' schema), when the user is a metastore admin, or: * summaries for tables and
#' schemas (within the current metastore and parent catalog) for which the user
#' has ownership or the **SELECT** privilege on the table and ownership or
#' **USE_SCHEMA** privilege on the schema, provided that the user also has
#' ownership or the **USE_CATALOG** privilege on the parent catalog.
#' 
#' There is no guarantee of a specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. Name of parent catalog for tables of interest.
#' @param max_results Maximum number of summaries for tables to return.
#' @param page_token Opaque pagination token to go to next page based on previous query.
#' @param schema_name_pattern A sql LIKE pattern (% and _) for schema names.
#' @param table_name_pattern A sql LIKE pattern (% and _) for table names.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_table_summaries
#' @export
list_table_summaries <- function(client, catalog_name, max_results = NULL, page_token = NULL,
  schema_name_pattern = NULL, table_name_pattern = NULL) {
  query <- list(catalog_name = catalog_name, max_results = max_results, page_token = page_token,
    schema_name_pattern = schema_name_pattern, table_name_pattern = table_name_pattern)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/table-summaries", query = query)
    if (is.null(nrow(json$tables))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$tables)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
#' Update a table owner.
#' 
#' Change the owner of the table. The caller must be the owner of the parent
#' catalog, have the **USE_CATALOG** privilege on the parent catalog and be the
#' owner of the parent schema, or be the owner of the table and have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#' @param owner This field has no description yet.
#'
#' @rdname update_table
#' @export
update_table <- function(client, full_name, owner = NULL) {
  body <- list(owner = owner)
  client$do("PATCH", paste("/api/2.1/unity-catalog/tables/", full_name, sep = ""),
    body = body)
}






