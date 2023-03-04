# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Access the history of queries through SQL warehouses.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=query_history_list]{list} \tab List Queries.\cr
#' }
#'
#' @rdname query_history
#' @export
query_history <- list()

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
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname query_history_list
#'
#' @aliases query_history_list
query_history_list <- function(filter_by = NULL, include_metrics = NULL, max_results = NULL,
  page_token = NULL, ...) {
  query <- list(filter_by = filter_by, include_metrics = include_metrics, max_results = max_results,
    page_token = page_token, ...)



  results <- data.frame()
  while (TRUE) {
    json <- .api$do("GET", "/api/2.0/sql/history/queries", query = query)
    if (is.null(nrow(json$res))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$res)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
query_history$list <- query_history_list

