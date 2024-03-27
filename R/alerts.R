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
#' See the [API documentation](https://docs.databricks.com/api/workspace/alerts/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_alert
#' @alias alertsCreate
#' @export
create_alert <- function(client, name, options, query_id, parent = NULL, rearm = NULL) {
  body <- list(name = name, options = options, parent = parent, query_id = query_id,
    rearm = rearm)
  client$do("POST", "/api/2.0/preview/sql/alerts", body = body)
}

#' @rdname create_alert
#' @export 
alertsCreate <- create_alert
#' Delete an alert.
#' 
#' Deletes an alert. Deleted alerts are no longer accessible and cannot be
#' restored. **Note:** Unlike queries and dashboards, alerts cannot be moved to
#' the trash.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alert_id Required. This field has no description yet.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/alerts/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_alert
#' @alias alertsDelete
#' @export
delete_alert <- function(client, alert_id) {

  client$do("DELETE", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}

#' @rdname delete_alert
#' @export 
alertsDelete <- delete_alert
#' Get an alert.
#' 
#' Gets an alert.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alert_id Required. This field has no description yet.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/alerts/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_alert
#' @alias alertsGet
#' @export
get_alert <- function(client, alert_id) {

  client$do("GET", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}

#' @rdname get_alert
#' @export 
alertsGet <- get_alert
#' Get alerts.
#' 
#' Gets a list of alerts.
#' @param client Required. Instance of DatabricksClient()
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/alerts/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_alerts
#' @alias alertsList
#' @export
list_alerts <- function(client) {
  client$do("GET", "/api/2.0/preview/sql/alerts")
}

#' @rdname list_alerts
#' @export 
alertsList <- list_alerts
#' Update an alert.
#' 
#' Updates an alert.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alert_id Required. This field has no description yet.
#' @param name Required. Name of the alert.
#' @param options Required. Alert configuration options.
#' @param query_id Required. Query ID.
#' @param rearm Number of seconds after being triggered before the alert rearms itself and can be triggered again.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/alerts/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_alert
#' @alias alertsUpdate
#' @export
update_alert <- function(client, alert_id, name, options, query_id, rearm = NULL) {
  body <- list(name = name, options = options, query_id = query_id, rearm = rearm)
  client$do("PUT", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""), body = body)
}

#' @rdname update_alert
#' @export 
alertsUpdate <- update_alert





