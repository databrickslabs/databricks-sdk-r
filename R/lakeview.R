# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create dashboard.
#' 
#' Create a draft dashboard.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param display_name Required. The display name of the dashboard.
#' @param parent_path The workspace path of the folder containing the dashboard.
#' @param serialized_dashboard The contents of the dashboard in serialized string form.
#' @param warehouse_id The warehouse ID used to run the dashboard.
#'
#' @rdname lakeviewCreate
#' @export
lakeviewCreate <- function(client, display_name, parent_path = NULL, serialized_dashboard = NULL,
  warehouse_id = NULL) {
  body <- list(display_name = display_name, parent_path = parent_path, serialized_dashboard = serialized_dashboard,
    warehouse_id = warehouse_id)
  client$do("POST", "/api/2.0/lakeview/dashboards", body = body)
}

#' Get dashboard.
#' 
#' Get a draft dashboard.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param dashboard_id Required. UUID identifying the dashboard.
#'
#' @rdname lakeviewGet
#' @export
lakeviewGet <- function(client, dashboard_id) {

  client$do("GET", paste("/api/2.0/lakeview/dashboards/", dashboard_id, sep = ""))
}

#' Get published dashboard.
#' 
#' Get the current published dashboard.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param dashboard_id Required. UUID identifying the dashboard to be published.
#'
#' @rdname lakeviewGetPublished
#' @export
lakeviewGetPublished <- function(client, dashboard_id) {

  client$do("GET", paste("/api/2.0/lakeview/dashboards/", dashboard_id, "/published",
    , sep = ""))
}

#' Publish dashboard.
#' 
#' Publish the current draft dashboard.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param dashboard_id Required. UUID identifying the dashboard to be published.
#' @param embed_credentials Flag to indicate if the publisher's credentials should be embedded in the published dashboard.
#' @param warehouse_id The ID of the warehouse that can be used to override the warehouse which was set in the draft.
#'
#' @rdname lakeviewPublish
#' @export
lakeviewPublish <- function(client, dashboard_id, embed_credentials = NULL, warehouse_id = NULL) {
  body <- list(embed_credentials = embed_credentials, warehouse_id = warehouse_id)
  client$do("POST", paste("/api/2.0/lakeview/dashboards/", dashboard_id, "/published",
    , sep = ""), body = body)
}

#' Trash dashboard.
#' 
#' Trash a dashboard.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param dashboard_id Required. UUID identifying the dashboard.
#'
#' @rdname lakeviewTrash
#' @export
lakeviewTrash <- function(client, dashboard_id) {

  client$do("DELETE", paste("/api/2.0/lakeview/dashboards/", dashboard_id, sep = ""))
}

#' Update dashboard.
#' 
#' Update a draft dashboard.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param dashboard_id Required. UUID identifying the dashboard.
#' @param display_name The display name of the dashboard.
#' @param etag The etag for the dashboard.
#' @param serialized_dashboard The contents of the dashboard in serialized string form.
#' @param warehouse_id The warehouse ID used to run the dashboard.
#'
#' @rdname lakeviewUpdate
#' @export
lakeviewUpdate <- function(client, dashboard_id, display_name = NULL, etag = NULL,
  serialized_dashboard = NULL, warehouse_id = NULL) {
  body <- list(display_name = display_name, etag = etag, serialized_dashboard = serialized_dashboard,
    warehouse_id = warehouse_id)
  client$do("PATCH", paste("/api/2.0/lakeview/dashboards/", dashboard_id, sep = ""),
    body = body)
}

