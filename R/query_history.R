# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' List Queries.
#' 
#' List the history of queries through SQL warehouses.
#' 
#' You can filter by user ID, warehouse ID, status, and time range.
#'
#' @param filter_by A filter to limit query history results.
#' @param include_metrics Whether to include metrics about query.
#' @param max_results Limit the number of results returned in one page.
#' @param page_token A token that can be used to get the next page of results.
databricks_query_history_list <- function(filter_by = NULL, 
    include_metrics = NULL, 
    max_results = NULL, 
    page_token = NULL, 
    ...) {
    query <- list(
        filter_by = filter_by, 
        include_metrics = include_metrics, 
        max_results = max_results, 
        page_token = page_token, ...)
    .api$do("GET", "/api/2.0/sql/history/queries", query = query)
}

