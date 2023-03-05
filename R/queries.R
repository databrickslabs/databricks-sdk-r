# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' These endpoints are used for CRUD operations on query definitions. Query
#' definitions include the target SQL warehouse, query text, name, description,
#' tags, execution schedule, parameters, and visualizations.
#' 
#' **Note**: Programmatic operations on refresh schedules via the Databricks SQL
#' API are deprecated. Query refresh schedules can be created, updated, fetched
#' and deleted using Jobs API, e.g. :method:jobs/create.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=queries_create]{create} \tab Create a new query definition.\cr
#'  \link[=queries_delete]{delete} \tab Delete a query.\cr
#'  \link[=queries_get]{get} \tab Get a query definition.\cr
#'  \link[=queries_list]{list} \tab Get a list of queries.\cr
#'  \link[=queries_restore]{restore} \tab Restore a query.\cr
#'  \link[=queries_update]{update} \tab Change a query definition.\cr
#' }
#'
#' @rdname queries
#' @export
queries <- list()

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
#'
#' @keywords internal
#'
#' @rdname queries_create
#'
#' @aliases queries_create
queries_create <- function(data_source_id = NULL, description = NULL, name = NULL,
  options = NULL, parent = NULL, query = NULL, schedule = NULL) {
  body <- list(data_source_id = data_source_id, description = description, name = name,
    options = options, parent = parent, query = query, schedule = schedule)
  .state$api$do("POST", "/api/2.0/preview/sql/queries", body = body)
}
queries$create <- queries_create

#' Delete a query.
#' 
#' Moves a query to the trash. Trashed queries immediately disappear from
#' searches and list views, and they cannot be used for alerts. The trash is
#' deleted after 30 days.
#'
#' @param query_id Required. 
#'
#' @keywords internal
#'
#' @rdname queries_delete
#'
#' @aliases queries_delete
queries_delete <- function(query_id) {

  .state$api$do("DELETE", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""))
}
queries$delete <- queries_delete

#' Get a query definition.
#' 
#' Retrieve a query object definition along with contextual permissions
#' information about the currently authenticated user.
#'
#' @param query_id Required. 
#'
#' @keywords internal
#'
#' @rdname queries_get
#'
#' @aliases queries_get
queries_get <- function(query_id) {

  .state$api$do("GET", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""))
}
queries$get <- queries_get

#' Get a list of queries.
#' 
#' Gets a list of queries. Optionally, this list can be filtered by a search
#' term.
#'
#' @param order Name of query attribute to order by.
#' @param page Page number to retrieve.
#' @param page_size Number of queries to return per page.
#' @param q Full text search term.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname queries_list
#'
#' @aliases queries_list
queries_list <- function(order = NULL, page = NULL, page_size = NULL, q = NULL) {
  query <- list(order = order, page = page, page_size = page_size, q = q)

  query$page = 1
  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/preview/sql/queries", query = query)
    if (is.null(nrow(json$results))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$results)
    query$page <- query$page + 1
  }
  # de-duplicate any records via id column
  results <- results[!duplicated(results$id), ]
  return(results)

}
queries$list <- queries_list

#' Restore a query.
#' 
#' Restore a query that has been moved to the trash. A restored query appears in
#' list views and searches. You can use restored queries for alerts.
#'
#' @param query_id Required. 
#'
#' @keywords internal
#'
#' @rdname queries_restore
#'
#' @aliases queries_restore
queries_restore <- function(query_id) {

  .state$api$do("POST", paste("/api/2.0/preview/sql/queries/trash/", query_id,
    sep = ""))
}
queries$restore <- queries_restore

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
#' @param query_id Required. 
#' @param schedule JSON object that describes the scheduled execution frequency.
#'
#' @keywords internal
#'
#' @rdname queries_update
#'
#' @aliases queries_update
queries_update <- function(query_id, data_source_id = NULL, description = NULL, name = NULL,
  options = NULL, query = NULL, schedule = NULL) {
  body <- list(data_source_id = data_source_id, description = description, name = name,
    options = options, query = query, schedule = schedule)
  .state$api$do("POST", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""),
    body = body)
}
queries$update <- queries_update

