# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' The alerts API can be used to perform CRUD operations on alerts. An alert is
#' a Databricks SQL object that periodically runs a query, evaluates a condition
#' of its result, and notifies one or more users and/or notification
#' destinations if the condition was met. Alerts can be scheduled using the
#' `sql_task` type of the Jobs API, e.g. :method:jobs/create.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=alerts_create]{create} \tab Create an alert.\cr
#'  \link[=alerts_delete]{delete} \tab Delete an alert.\cr
#'  \link[=alerts_get]{get} \tab Get an alert.\cr
#'  \link[=alerts_list]{list} \tab Get alerts.\cr
#'  \link[=alerts_update]{update} \tab Update an alert.\cr
#' }
#'
#' @rdname alerts
#' @export
alerts <- list()

#' Create an alert.
#' 
#' Creates an alert. An alert is a Databricks SQL object that periodically runs
#' a query, evaluates a condition of its result, and notifies users or
#' notification destinations if the condition was met.
#'
#' @param name Required. Name of the alert.
#' @param options Required. Alert configuration options.
#' @param parent The identifier of the workspace folder containing the alert.
#' @param query_id Required. ID of the query evaluated by the alert.
#' @param rearm Number of seconds after being triggered before the alert rearms itself and can be triggered again.
#'
#' @keywords internal
#'
#' @rdname alerts_create
#'
#' @aliases alerts_create
alerts_create <- function(name, options, query_id, parent = NULL, rearm = NULL) {
  body <- list(name = name, options = options, parent = parent, query_id = query_id,
    rearm = rearm)
  .state$api$do("POST", "/api/2.0/preview/sql/alerts", body = body)
}
alerts$create <- alerts_create

#' Delete an alert.
#' 
#' Deletes an alert. Deleted alerts are no longer accessible and cannot be
#' restored. **Note:** Unlike queries and dashboards, alerts cannot be moved to
#' the trash.
#'
#' @param alert_id Required. 
#'
#' @keywords internal
#'
#' @rdname alerts_delete
#'
#' @aliases alerts_delete
alerts_delete <- function(alert_id) {

  .state$api$do("DELETE", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}
alerts$delete <- alerts_delete

#' Get an alert.
#' 
#' Gets an alert.
#'
#' @param alert_id Required. 
#'
#' @keywords internal
#'
#' @rdname alerts_get
#'
#' @aliases alerts_get
alerts_get <- function(alert_id) {

  .state$api$do("GET", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}
alerts$get <- alerts_get

#' Get alerts.
#' 
#' Gets a list of alerts.#'
#' @keywords internal
#'
#' @rdname alerts_list
#'
#' @aliases alerts_list
alerts_list <- function() {
  .state$api$do("GET", "/api/2.0/preview/sql/alerts")
}
alerts$list <- alerts_list

#' Update an alert.
#' 
#' Updates an alert.
#'
#' @param alert_id Required. 
#' @param name Required. Name of the alert.
#' @param options Required. Alert configuration options.
#' @param query_id Required. ID of the query evaluated by the alert.
#' @param rearm Number of seconds after being triggered before the alert rearms itself and can be triggered again.
#'
#' @keywords internal
#'
#' @rdname alerts_update
#'
#' @aliases alerts_update
alerts_update <- function(name, options, query_id, alert_id, rearm = NULL) {
  body <- list(, name = name, options = options, query_id = query_id, rearm = rearm)
  .state$api$do("PUT", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""),
    body = body)
}
alerts$update <- alerts_update

