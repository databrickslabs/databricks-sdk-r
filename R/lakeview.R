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
#'
#' @rdname create_lakeview
#' @alias lakeviewCreate
#' @export
create_lakeview <- function(client, display_name, parent_path = NULL, serialized_dashboard = NULL,
  warehouse_id = NULL) {
  body <- list(display_name = display_name, parent_path = parent_path, serialized_dashboard = serialized_dashboard,
    warehouse_id = warehouse_id)
  client$do("POST", "/api/2.0/lakeview/dashboards", body = body)
}

#' @rdname create_lakeview
#' @export 
lakeviewCreate <- create_lakeview
#' Get dashboard.
#' 
#' Get a draft dashboard.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param dashboard_id Required. UUID identifying the dashboard.
#'
#'
#' @rdname get_lakeview
#' @alias lakeviewGet
#' @export
get_lakeview <- function(client, dashboard_id) {

  client$do("GET", paste("/api/2.0/lakeview/dashboards/", dashboard_id, sep = ""))
}

#' @rdname get_lakeview
#' @export 
lakeviewGet <- get_lakeview
#' Get published dashboard.
#' 
#' Get the current published dashboard.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param dashboard_id Required. UUID identifying the dashboard to be published.
#'
#'
#' @rdname get_lakeview_published
#' @alias lakeviewGetPublished
#' @export
get_lakeview_published <- function(client, dashboard_id) {

  client$do("GET", paste("/api/2.0/lakeview/dashboards/", dashboard_id, "/published",
    , sep = ""))
}

#' @rdname get_lakeview_published
#' @export 
lakeviewGetPublished <- get_lakeview_published
#' Publish dashboard.
#' 
#' Publish the current draft dashboard.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param dashboard_id Required. UUID identifying the dashboard to be published.
#' @param embed_credentials Flag to indicate if the publisher's credentials should be embedded in the published dashboard.
#' @param warehouse_id The ID of the warehouse that can be used to override the warehouse which was set in the draft.
#'
#'
#' @rdname publish_lakeview
#' @alias lakeviewPublish
#' @export
publish_lakeview <- function(client, dashboard_id, embed_credentials = NULL, warehouse_id = NULL) {
  body <- list(embed_credentials = embed_credentials, warehouse_id = warehouse_id)
  client$do("POST", paste("/api/2.0/lakeview/dashboards/", dashboard_id, "/published",
    , sep = ""), body = body)
}

#' @rdname publish_lakeview
#' @export 
lakeviewPublish <- publish_lakeview
#' Trash dashboard.
#' 
#' Trash a dashboard.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param dashboard_id Required. UUID identifying the dashboard.
#'
#'
#' @rdname trash_lakeview
#' @alias lakeviewTrash
#' @export
trash_lakeview <- function(client, dashboard_id) {

  client$do("DELETE", paste("/api/2.0/lakeview/dashboards/", dashboard_id, sep = ""))
}

#' @rdname trash_lakeview
#' @export 
lakeviewTrash <- trash_lakeview
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
#'
#' @rdname update_lakeview
#' @alias lakeviewUpdate
#' @export
update_lakeview <- function(client, dashboard_id, display_name = NULL, etag = NULL,
  serialized_dashboard = NULL, warehouse_id = NULL) {
  body <- list(display_name = display_name, etag = etag, serialized_dashboard = serialized_dashboard,
    warehouse_id = warehouse_id)
  client$do("PATCH", paste("/api/2.0/lakeview/dashboards/", dashboard_id, sep = ""),
    body = body)
}

#' @rdname update_lakeview
#' @export 
lakeviewUpdate <- update_lakeview






