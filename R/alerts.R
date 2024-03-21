# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an alert.
#' 
#' Creates an alert. An alert is a Databricks SQL object that periodically runs
#' a query, evaluates a condition of its result, and notifies users or
#' notification destinations if the condition was met.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the alert.
#' @param options Required. Alert configuration options.
#' @param parent The identifier of the workspace folder containing the object.
#' @param query_id Required. Query ID.
#' @param rearm Number of seconds after being triggered before the alert rearms itself and can be triggered again.
#'
#' @rdname alertsCreate
#' @export
alertsCreate <- function(client, name, options, query_id, parent = NULL, rearm = NULL) {
  body <- list(name = name, options = options, parent = parent, query_id = query_id,
    rearm = rearm)
  client$do("POST", "/api/2.0/preview/sql/alerts", body = body)
}

#' Delete an alert.
#' 
#' Deletes an alert. Deleted alerts are no longer accessible and cannot be
#' restored. **Note:** Unlike queries and dashboards, alerts cannot be moved to
#' the trash.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alert_id Required. 
#'
#' @rdname alertsDelete
#' @export
alertsDelete <- function(client, alert_id) {

  client$do("DELETE", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}

#' Get an alert.
#' 
#' Gets an alert.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alert_id Required. 
#'
#' @rdname alertsGet
#' @export
alertsGet <- function(client, alert_id) {

  client$do("GET", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}

#' Get alerts.
#' 
#' Gets a list of alerts.#'
#' @rdname alertsList
#' @export
alertsList <- function(client) {
  client$do("GET", "/api/2.0/preview/sql/alerts")
}

#' Update an alert.
#' 
#' Updates an alert.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alert_id Required. 
#' @param name Required. Name of the alert.
#' @param options Required. Alert configuration options.
#' @param query_id Required. Query ID.
#' @param rearm Number of seconds after being triggered before the alert rearms itself and can be triggered again.
#'
#' @rdname alertsUpdate
#' @export
alertsUpdate <- function(client, alert_id, name, options, query_id, rearm = NULL) {
  body <- list(, name = name, options = options, query_id = query_id, rearm = rearm)
  client$do("PUT", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""), body = body)
}

