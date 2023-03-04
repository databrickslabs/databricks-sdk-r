# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' The alerts API can be used to perform CRUD operations on alerts. An alert is
#' a Databricks SQL object that periodically runs a query, evaluates a condition
#' of its result, and notifies one or more users and/or alert destinations if
#' the condition was met.
#' 
#' **Note**: Programmatic operations on refresh schedules via the Databricks SQL
#' API are deprecated. Alert refresh schedules can be created, updated, fetched
#' and deleted using Jobs API, e.g. :method:jobs/create.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=alerts_create]{create} \tab Create an alert.\cr
#'  \link[=alerts_create_schedule]{create_schedule} \tab [DEPRECATED] Create a refresh schedule.\cr
#'  \link[=alerts_delete]{delete} \tab Delete an alert.\cr
#'  \link[=alerts_delete_schedule]{delete_schedule} \tab [DEPRECATED] Delete a refresh schedule.\cr
#'  \link[=alerts_get]{get} \tab Get an alert.\cr
#'  \link[=alerts_get_subscriptions]{get_subscriptions} \tab [DEPRECATED] Get an alert's subscriptions.\cr
#'  \link[=alerts_list]{list} \tab Get alerts.\cr
#'  \link[=alerts_list_schedules]{list_schedules} \tab [DEPRECATED] Get refresh schedules.\cr
#'  \link[=alerts_subscribe]{subscribe} \tab [DEPRECATED] Subscribe to an alert.\cr
#'  \link[=alerts_unsubscribe]{unsubscribe} \tab [DEPRECATED] Unsubscribe to an alert.\cr
#'  \link[=alerts_update]{update} \tab Update an alert.\cr
#' }
#'
#' @rdname alerts
#' @export
alerts <- list()

#' Create an alert.
#' 
#' Creates an alert. An alert is a Databricks SQL object that periodically runs
#' a query, evaluates a condition of its result, and notifies users or alert
#' destinations if the condition was met.
#'
#' @param name [required] Name of the alert.
#' @param options [required] Alert configuration options.
#' @param parent The identifier of the workspace folder containing the alert.
#' @param query_id [required] ID of the query evaluated by the alert.
#' @param rearm Number of seconds after being triggered before the alert rearms itself and can be triggered again.
#'
#' @keywords internal
#'
#' @rdname alerts_create
#'
#' @aliases alerts_create
alerts_create <- function(name, options, query_id, parent = NULL, rearm = NULL, ...) {
  body <- list(name = name, options = options, parent = parent, query_id = query_id,
    rearm = rearm, ...)

  .api$do("POST", "/api/2.0/preview/sql/alerts", body = body)
}
alerts$create <- alerts_create

#' [DEPRECATED] Create a refresh schedule.
#' 
#' Creates a new refresh schedule for an alert.
#' 
#' **Note:** The structure of refresh schedules is subject to change.
#' 
#' **Note:** This API is deprecated: Use :method:jobs/create to create a job
#' with the alert.
#'
#' @param alert_id [required] 
#' @param cron [required] Cron string representing the refresh schedule.
#' @param data_source_id ID of the SQL warehouse to refresh with.
#'
#' @keywords internal
#'
#' @rdname alerts_create_schedule
#'
#' @aliases alerts_create_schedule
alerts_create_schedule <- function(cron, alert_id, data_source_id = NULL, ...) {
  body <- list(cron = cron, data_source_id = data_source_id, ...)

  .api$do("POST", paste("/api/2.0/preview/sql/alerts/", alert_id, "/refresh-schedules",
    , sep = ""), body = body)
}
alerts$create_schedule <- alerts_create_schedule

#' Delete an alert.
#' 
#' Deletes an alert. Deleted alerts are no longer accessible and cannot be
#' restored. **Note:** Unlike queries and dashboards, alerts cannot be moved to
#' the trash.
#'
#' @param alert_id [required] 
#'
#' @keywords internal
#'
#' @rdname alerts_delete
#'
#' @aliases alerts_delete
alerts_delete <- function(alert_id, ...) {


  .api$do("DELETE", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}
alerts$delete <- alerts_delete

#' [DEPRECATED] Delete a refresh schedule.
#' 
#' Deletes an alert's refresh schedule. The refresh schedule specifies when to
#' refresh and evaluate the associated query result.
#' 
#' **Note:** This API is deprecated: Use :method:jobs/delete to delete a job for
#' the alert.
#'
#' @param alert_id [required] 
#' @param schedule_id [required] 
#'
#' @keywords internal
#'
#' @rdname alerts_delete_schedule
#'
#' @aliases alerts_delete_schedule
alerts_delete_schedule <- function(alert_id, schedule_id, ...) {


  .api$do("DELETE", paste("/api/2.0/preview/sql/alerts/", alert_id, "/refresh-schedules/",
    schedule_id, sep = ""))
}
alerts$delete_schedule <- alerts_delete_schedule

#' Get an alert.
#' 
#' Gets an alert.
#'
#' @param alert_id [required] 
#'
#' @keywords internal
#'
#' @rdname alerts_get
#'
#' @aliases alerts_get
alerts_get <- function(alert_id, ...) {


  .api$do("GET", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""))
}
alerts$get <- alerts_get

#' [DEPRECATED] Get an alert's subscriptions.
#' 
#' Get the subscriptions for an alert. An alert subscription represents exactly
#' one recipient being notified whenever the alert is triggered. The alert
#' recipient is specified by either the `user` field or the `destination` field.
#' The `user` field is ignored if `destination` is non-`null`.
#' 
#' **Note:** This API is deprecated: Use :method:jobs/get to get the
#' subscriptions associated with a job for an alert.
#'
#' @param alert_id [required] 
#'
#' @keywords internal
#'
#' @rdname alerts_get_subscriptions
#'
#' @aliases alerts_get_subscriptions
alerts_get_subscriptions <- function(alert_id, ...) {


  .api$do("GET", paste("/api/2.0/preview/sql/alerts/", alert_id, "/subscriptions",
    , sep = ""))
}
alerts$get_subscriptions <- alerts_get_subscriptions

#' Get alerts.
#' 
#' Gets a list of alerts.#'
#' @keywords internal
#'
#' @rdname alerts_list
#'
#' @aliases alerts_list
alerts_list <- function(...) {

  .api$do("GET", "/api/2.0/preview/sql/alerts")
}
alerts$list <- alerts_list

#' [DEPRECATED] Get refresh schedules.
#' 
#' Gets the refresh schedules for the specified alert. Alerts can have refresh
#' schedules that specify when to refresh and evaluate the associated query
#' result.
#' 
#' **Note:** Although refresh schedules are returned in a list, only one refresh
#' schedule per alert is currently supported. The structure of refresh schedules
#' is subject to change.
#' 
#' **Note:** This API is deprecated: Use :method:jobs/list to list jobs and
#' filter by the alert.
#'
#' @param alert_id [required] 
#'
#' @keywords internal
#'
#' @rdname alerts_list_schedules
#'
#' @aliases alerts_list_schedules
alerts_list_schedules <- function(alert_id, ...) {


  .api$do("GET", paste("/api/2.0/preview/sql/alerts/", alert_id, "/refresh-schedules",
    , sep = ""))
}
alerts$list_schedules <- alerts_list_schedules

#' [DEPRECATED] Subscribe to an alert.
#' 
#' **Note:** This API is deprecated: Use :method:jobs/update to subscribe to a
#' job for an alert.
#'
#' @param alert_id [required] ID of the alert.
#' @param destination_id ID of the alert subscriber (if subscribing an alert destination).
#' @param user_id ID of the alert subscriber (if subscribing a user).
#'
#' @keywords internal
#'
#' @rdname alerts_subscribe
#'
#' @aliases alerts_subscribe
alerts_subscribe <- function(alert_id, destination_id = NULL, user_id = NULL, ...) {
  body <- list(alert_id = alert_id, destination_id = destination_id, user_id = user_id,
    ...)

  .api$do("POST", paste("/api/2.0/preview/sql/alerts/", alert_id, "/subscriptions",
    , sep = ""), body = body)
}
alerts$subscribe <- alerts_subscribe

#' [DEPRECATED] Unsubscribe to an alert.
#' 
#' Unsubscribes a user or a destination to an alert.
#' 
#' **Note:** This API is deprecated: Use :method:jobs/update to unsubscribe to a
#' job for an alert.
#'
#' @param alert_id [required] 
#' @param subscription_id [required] 
#'
#' @keywords internal
#'
#' @rdname alerts_unsubscribe
#'
#' @aliases alerts_unsubscribe
alerts_unsubscribe <- function(alert_id, subscription_id, ...) {


  .api$do("DELETE", paste("/api/2.0/preview/sql/alerts/", alert_id, "/subscriptions/",
    subscription_id, sep = ""))
}
alerts$unsubscribe <- alerts_unsubscribe

#' Update an alert.
#' 
#' Updates an alert.
#'
#' @param alert_id [required] 
#' @param name [required] Name of the alert.
#' @param options [required] Alert configuration options.
#' @param query_id [required] ID of the query evaluated by the alert.
#' @param rearm Number of seconds after being triggered before the alert rearms itself and can be triggered again.
#'
#' @keywords internal
#'
#' @rdname alerts_update
#'
#' @aliases alerts_update
alerts_update <- function(name, options, query_id, alert_id, rearm = NULL, ...) {
  body <- list(name = name, options = options, query_id = query_id, rearm = rearm,
    ...)

  .api$do("PUT", paste("/api/2.0/preview/sql/alerts/", alert_id, sep = ""), body = body)
}
alerts$update <- alerts_update













