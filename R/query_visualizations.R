# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Add visualization to a query.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param description A short description of this visualization.
#' @param name The name of the visualization that appears on dashboards and the query screen.
#' @param options Required. The options object varies widely from one visualization type to the next and is unsupported.
#' @param query_id Required. The identifier returned by :method:queries/create.
#' @param type Required. The type of visualization: chart, table, pivot table, and so on.
#'
#'
#' @rdname create_query_visualization
#' @alias queryVisualizationsCreate
#' @export
create_query_visualization <- function(client, query_id, type, options, description = NULL,
  name = NULL) {
  body <- list(description = description, name = name, options = options, query_id = query_id,
    type = type)
  client$do("POST", "/api/2.0/preview/sql/visualizations", body = body)
}

#' @rdname create_query_visualization
#' @export 
queryVisualizationsCreate <- create_query_visualization
#' Remove visualization.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Widget ID returned by :method:queryvizualisations/create.
#'
#'
#' @rdname delete_query_visualization
#' @alias queryVisualizationsDelete
#' @export
delete_query_visualization <- function(client, id) {

  client$do("DELETE", paste("/api/2.0/preview/sql/visualizations/", id, sep = ""))
}

#' @rdname delete_query_visualization
#' @export 
queryVisualizationsDelete <- delete_query_visualization
#' Edit existing visualization.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param created_at This field has no description yet.
#' @param description A short description of this visualization.
#' @param id The UUID for this visualization.
#' @param name The name of the visualization that appears on dashboards and the query screen.
#' @param options The options object varies widely from one visualization type to the next and is unsupported.
#' @param type The type of visualization: chart, table, pivot table, and so on.
#' @param updated_at This field has no description yet.
#'
#'
#' @rdname update_query_visualization
#' @alias queryVisualizationsUpdate
#' @export
update_query_visualization <- function(client, id, created_at = NULL, description = NULL,
  name = NULL, options = NULL, type = NULL, updated_at = NULL) {
  body <- list(created_at = created_at, description = description, id = id, name = name,
    options = options, type = type, updated_at = updated_at)
  client$do("POST", paste("/api/2.0/preview/sql/visualizations/", id, sep = ""),
    body = body)
}

#' @rdname update_query_visualization
#' @export 
queryVisualizationsUpdate <- update_query_visualization



