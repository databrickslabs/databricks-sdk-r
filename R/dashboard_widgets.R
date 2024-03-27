# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Add widget to a dashboard.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param dashboard_id Required. Dashboard ID returned by :method:dashboards/create.
#' @param options Required. This field has no description yet.
#' @param text If this is a textbox widget, the application displays this text.
#' @param visualization_id Query Vizualization ID returned by :method:queryvisualizations/create.
#' @param width Required. Width of a widget.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/dashboardwidgets/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_dashboard_widget
#' @alias dashboardWidgetsCreate
#' @export
create_dashboard_widget <- function(client, dashboard_id, options, width, text = NULL,
  visualization_id = NULL) {
  body <- list(dashboard_id = dashboard_id, options = options, text = text, visualization_id = visualization_id,
    width = width)
  client$do("POST", "/api/2.0/preview/sql/widgets", body = body)
}

#' @rdname create_dashboard_widget
#' @export 
dashboardWidgetsCreate <- create_dashboard_widget
#' Remove widget.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Widget ID returned by :method:dashboardwidgets/create.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/dashboardwidgets/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_dashboard_widget
#' @alias dashboardWidgetsDelete
#' @export
delete_dashboard_widget <- function(client, id) {

  client$do("DELETE", paste("/api/2.0/preview/sql/widgets/", id, sep = ""))
}

#' @rdname delete_dashboard_widget
#' @export 
dashboardWidgetsDelete <- delete_dashboard_widget
#' Update existing widget.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param dashboard_id Required. Dashboard ID returned by :method:dashboards/create.
#' @param id Required. Widget ID returned by :method:dashboardwidgets/create.
#' @param options Required. This field has no description yet.
#' @param text If this is a textbox widget, the application displays this text.
#' @param visualization_id Query Vizualization ID returned by :method:queryvisualizations/create.
#' @param width Required. Width of a widget.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/dashboardwidgets/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_dashboard_widget
#' @alias dashboardWidgetsUpdate
#' @export
update_dashboard_widget <- function(client, id, dashboard_id, options, width, text = NULL,
  visualization_id = NULL) {
  body <- list(dashboard_id = dashboard_id, options = options, text = text, visualization_id = visualization_id,
    width = width)
  client$do("POST", paste("/api/2.0/preview/sql/widgets/", id, sep = ""), body = body)
}

#' @rdname update_dashboard_widget
#' @export 
dashboardWidgetsUpdate <- update_dashboard_widget



