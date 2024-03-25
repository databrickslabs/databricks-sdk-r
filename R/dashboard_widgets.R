# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Add widget to a dashboard.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param dashboard_id Required. Dashboard ID returned by :method:dashboards/create.
#' @param options Required. 
#' @param text If this is a textbox widget, the application displays this text.
#' @param visualization_id Query Vizualization ID returned by :method:queryvisualizations/create.
#' @param width Required. Width of a widget.
#'
#' @rdname dashboardWidgetsCreate
#' @export
dashboardWidgetsCreate <- function(client, dashboard_id, options, width, text = NULL,
  visualization_id = NULL) {
  body <- list(dashboard_id = dashboard_id, options = options, text = text, visualization_id = visualization_id,
    width = width)
  client$do("POST", "/api/2.0/preview/sql/widgets", body = body)
}

#' Remove widget.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param id Required. Widget ID returned by :method:dashboardwidgets/create.
#'
#' @rdname dashboardWidgetsDelete
#' @export
dashboardWidgetsDelete <- function(client, id) {

  client$do("DELETE", paste("/api/2.0/preview/sql/widgets/", id, sep = ""))
}

#' Update existing widget.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param dashboard_id Required. Dashboard ID returned by :method:dashboards/create.
#' @param id Required. Widget ID returned by :method:dashboardwidgets/create.
#' @param options Required. 
#' @param text If this is a textbox widget, the application displays this text.
#' @param visualization_id Query Vizualization ID returned by :method:queryvisualizations/create.
#' @param width Required. Width of a widget.
#'
#' @rdname dashboardWidgetsUpdate
#' @export
dashboardWidgetsUpdate <- function(client, id, dashboard_id, options, width, text = NULL,
  visualization_id = NULL) {
  body <- list(dashboard_id = dashboard_id, options = options, text = text, visualization_id = visualization_id,
    width = width)
  client$do("POST", paste("/api/2.0/preview/sql/widgets/", id, sep = ""), body = body)
}

