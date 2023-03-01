# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a new query definition.
#' 
#' Creates a new query definition. Queries created with this endpoint belong to
#' the authenticated user making the request.
#' 
#' The `data_source_id` field specifies the ID of the SQL warehouse to run this
#' query against. You can use the Data Sources API to see a complete list of
#' available SQL warehouses. Or you can copy the `data_source_id` from an
#' existing query.
#' 
#' **Note**: You cannot add a visualization until you create the query.
#'
#' @param data_source_id The ID of the data source / SQL warehouse where this query will run.
#' @param description General description that can convey additional information about this query such as usage notes.
#' @param name The name or title of this query to display in list views.
#' @param options Exclusively used for storing a list parameter definitions.
#' @param parent The identifier of the workspace folder containing the query.
#' @param query The text of the query.
#' @param schedule JSON object that describes the scheduled execution frequency.
databricks_queries_create <- function(data_source_id = NULL, 
    description = NULL, 
    name = NULL, 
    options = NULL, 
    parent = NULL, 
    query = NULL, 
    schedule = NULL, 
    ...) {
    body <- list(
        data_source_id = data_source_id, 
        description = description, 
        name = name, 
        options = options, 
        parent = parent, 
        query = query, 
        schedule = schedule, ...)
    .api$do("POST", "/api/2.0/preview/sql/queries", body = body)
}

#' Delete a query.
#' 
#' Moves a query to the trash. Trashed queries immediately disappear from
#' searches and list views, and they cannot be used for alerts. The trash is
#' deleted after 30 days.
#'
#' @param query_id 
databricks_queries_delete <- function(query_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""))
}

#' Get a query definition.
#' 
#' Retrieve a query object definition along with contextual permissions
#' information about the currently authenticated user.
#'
#' @param query_id 
databricks_queries_get <- function(query_id, ...) {
    
    .api$do("GET", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""))
}

#' Get a list of queries.
#' 
#' Gets a list of queries. Optionally, this list can be filtered by a search
#' term.
#'
#' @param order Name of query attribute to order by.
#' @param page Page number to retrieve.
#' @param page_size Number of queries to return per page.
#' @param q Full text search term.
databricks_queries_list <- function(order = NULL, 
    page = NULL, 
    page_size = NULL, 
    q = NULL, 
    ...) {
    query <- list(
        order = order, 
        page = page, 
        page_size = page_size, 
        q = q, ...)
    .api$do("GET", "/api/2.0/preview/sql/queries", query = query)
}

#' Restore a query.
#' 
#' Restore a query that has been moved to the trash. A restored query appears in
#' list views and searches. You can use restored queries for alerts.
#'
#' @param query_id 
databricks_queries_restore <- function(query_id, ...) {
    
    .api$do("POST", paste("/api/2.0/preview/sql/queries/trash/", query_id, sep = ""))
}

#' Change a query definition.
#' 
#' Modify this query definition.
#' 
#' **Note**: You cannot undo this operation.
#'
#' @param data_source_id The ID of the data source / SQL warehouse where this query will run.
#' @param description General description that can convey additional information about this query such as usage notes.
#' @param name The name or title of this query to display in list views.
#' @param options Exclusively used for storing a list parameter definitions.
#' @param query The text of the query.
#' @param query_id 
#' @param schedule JSON object that describes the scheduled execution frequency.
databricks_queries_update <- function(query_id, data_source_id = NULL, 
    description = NULL, 
    name = NULL, 
    options = NULL, 
    query = NULL, 
    schedule = NULL, 
    ...) {
    body <- list(
        data_source_id = data_source_id, 
        description = description, 
        name = name, 
        options = options, 
        query = query, 
        schedule = schedule, ...)
    .api$do("POST", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""), body = body)
}

