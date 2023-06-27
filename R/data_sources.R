# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' This API is provided to assist you in making new query objects. When creating
#' a query object, you may optionally specify a `data_source_id` for the SQL
#' warehouse against which it will run. If you don't already know the
#' `data_source_id` for your desired SQL warehouse, this API will help you find
#' it.
#' 
#' This API does not support searches. It returns the full list of SQL
#' warehouses in your workspace. We advise you to use any text editor, REST
#' client, or `grep` to search the response from this API for the name of your
#' SQL warehouse as it appears in Databricks SQL.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=data_sources_list]{list} \tab Get a list of SQL warehouses.\cr
#' }
#'
#' @rdname data_sources
#' @export
data_sources <- list()

#' Get a list of SQL warehouses.
#' 
#' Retrieves a full list of SQL warehouses available in this workspace. All
#' fields that appear in this API response are enumerated for clarity. However,
#' you need only a SQL warehouse's `id` to create new queries against it.#'
#' @keywords internal
#'
#' @rdname data_sources_list
#'
#' @aliases data_sources_list
data_sources_list <- function() {
  .state$api$do("GET", "/api/2.0/preview/sql/data_sources")
}
data_sources$list <- data_sources_list

