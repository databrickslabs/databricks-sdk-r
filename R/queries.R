# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param data_source_id The ID of the data source / SQL warehouse where this query will run.
#' @param description General description that can convey additional information about this query such as usage notes.
#' @param name The name or title of this query to display in list views.
#' @param options Exclusively used for storing a list parameter definitions.
#' @param parent The identifier of the workspace folder containing the query.
#' @param query The text of the query.
#'
#' @rdname queriesCreate
queriesCreate <- function(client, data_source_id = NULL, description = NULL, name = NULL,
  options = NULL, parent = NULL, query = NULL) {
  body <- list(data_source_id = data_source_id, description = description, name = name,
    options = options, parent = parent, query = query)
  client$do("POST", "/api/2.0/preview/sql/queries", body = body)
}

#' Delete a query.
#' 
#' Moves a query to the trash. Trashed queries immediately disappear from
#' searches and list views, and they cannot be used for alerts. The trash is
#' deleted after 30 days.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param query_id Required. 
#'
#' @rdname queriesDelete
queriesDelete <- function(client, query_id) {

  client$do("DELETE", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""))
}

#' Get a query definition.
#' 
#' Retrieve a query object definition along with contextual permissions
#' information about the currently authenticated user.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param query_id Required. 
#'
#' @rdname queriesGet
queriesGet <- function(client, query_id) {

  client$do("GET", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""))
}

#' Get a list of queries.
#' 
#' Gets a list of queries. Optionally, this list can be filtered by a search
#' term.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param order Name of query attribute to order by.
#' @param page Page number to retrieve.
#' @param page_size Number of queries to return per page.
#' @param q Full text search term.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname queriesList
queriesList <- function(client, order = NULL, page = NULL, page_size = NULL, q = NULL) {
  query <- list(order = order, page = page, page_size = page_size, q = q)

  query$page = 1
  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/preview/sql/queries", query = query)
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

#' Restore a query.
#' 
#' Restore a query that has been moved to the trash. A restored query appears in
#' list views and searches. You can use restored queries for alerts.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param query_id Required. 
#'
#' @rdname queriesRestore
queriesRestore <- function(client, query_id) {

  client$do("POST", paste("/api/2.0/preview/sql/queries/trash/", query_id, sep = ""))
}

#' Change a query definition.
#' 
#' Modify this query definition.
#' 
#' **Note**: You cannot undo this operation.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param data_source_id The ID of the data source / SQL warehouse where this query will run.
#' @param description General description that can convey additional information about this query such as usage notes.
#' @param name The name or title of this query to display in list views.
#' @param options Exclusively used for storing a list parameter definitions.
#' @param query The text of the query.
#' @param query_id Required. 
#'
#' @rdname queriesUpdate
queriesUpdate <- function(client, query_id, data_source_id = NULL, description = NULL,
  name = NULL, options = NULL, query = NULL) {
  body <- list(data_source_id = data_source_id, description = description, name = name,
    options = options, query = query)
  client$do("POST", paste("/api/2.0/preview/sql/queries/", query_id, sep = ""),
    body = body)
}

