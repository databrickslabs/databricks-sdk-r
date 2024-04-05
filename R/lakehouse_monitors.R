# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Cancel refresh.
#' 
#' Cancel an active monitor refresh for the given refresh ID.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog 2. have
#' **USE_CATALOG** on the table's parent catalog and be an owner of the table's
#' parent schema 3. have the following permissions: - **USE_CATALOG** on the
#' table's parent catalog - **USE_SCHEMA** on the table's parent schema - be an
#' owner of the table
#' 
#' Additionally, the call must be made from the workspace where the monitor was
#' created.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#' @param refresh_id Required. ID of the refresh.
#'
#'
#' @rdname cancel_lakehouse_monitor_refresh
#' @alias lakehouseMonitorsCancelRefresh
#' @export
cancel_lakehouse_monitor_refresh <- function(client, full_name, refresh_id) {

  client$do("POST", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor/refreshes/",
    refresh_id, "/cancel", , sep = ""))
}

#' @rdname cancel_lakehouse_monitor_refresh
#' @export 
lakehouseMonitorsCancelRefresh <- cancel_lakehouse_monitor_refresh
#' Create a table monitor.
#' 
#' Creates a new monitor for the specified table.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog, have
#' **USE_SCHEMA** on the table's parent schema, and have **SELECT** access on
#' the table 2. have **USE_CATALOG** on the table's parent catalog, be an owner
#' of the table's parent schema, and have **SELECT** access on the table. 3.
#' have the following permissions: - **USE_CATALOG** on the table's parent
#' catalog - **USE_SCHEMA** on the table's parent schema - be an owner of the
#' table.
#' 
#' Workspace assets, such as the dashboard, will be created in the workspace
#' where this call was made.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param assets_dir Required. The directory to store monitoring assets (e.g.
#' @param baseline_table_name Name of the baseline table from which drift metrics are computed from.
#' @param custom_metrics Custom metrics to compute on the monitored table.
#' @param data_classification_config The data classification config for the monitor.
#' @param full_name Required. Full name of the table.
#' @param inference_log Configuration for monitoring inference logs.
#' @param notifications The notification settings for the monitor.
#' @param output_schema_name Required. Schema where output metric tables are created.
#' @param schedule The schedule for automatically updating and refreshing metric tables.
#' @param skip_builtin_dashboard Whether to skip creating a default dashboard summarizing data quality metrics.
#' @param slicing_exprs List of column expressions to slice data with for targeted analysis.
#' @param snapshot Configuration for monitoring snapshot tables.
#' @param time_series Configuration for monitoring time series tables.
#' @param warehouse_id Optional argument to specify the warehouse for dashboard creation.
#'
#'
#' @rdname create_lakehouse_monitor
#' @alias lakehouseMonitorsCreate
#' @export
create_lakehouse_monitor <- function(client, full_name, assets_dir, output_schema_name,
  baseline_table_name = NULL, custom_metrics = NULL, data_classification_config = NULL,
  inference_log = NULL, notifications = NULL, schedule = NULL, skip_builtin_dashboard = NULL,
  slicing_exprs = NULL, snapshot = NULL, time_series = NULL, warehouse_id = NULL) {
  body <- list(assets_dir = assets_dir, baseline_table_name = baseline_table_name,
    custom_metrics = custom_metrics, data_classification_config = data_classification_config,
    inference_log = inference_log, notifications = notifications, output_schema_name = output_schema_name,
    schedule = schedule, skip_builtin_dashboard = skip_builtin_dashboard, slicing_exprs = slicing_exprs,
    snapshot = snapshot, time_series = time_series, warehouse_id = warehouse_id)
  client$do("POST", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor",
    , sep = ""), body = body)
}

#' @rdname create_lakehouse_monitor
#' @export 
lakehouseMonitorsCreate <- create_lakehouse_monitor
#' Delete a table monitor.
#' 
#' Deletes a monitor for the specified table.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog 2. have
#' **USE_CATALOG** on the table's parent catalog and be an owner of the table's
#' parent schema 3. have the following permissions: - **USE_CATALOG** on the
#' table's parent catalog - **USE_SCHEMA** on the table's parent schema - be an
#' owner of the table.
#' 
#' Additionally, the call must be made from the workspace where the monitor was
#' created.
#' 
#' Note that the metric tables and dashboard will not be deleted as part of this
#' call; those assets must be manually cleaned up (if desired).
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#'
#'
#' @rdname delete_lakehouse_monitor
#' @alias lakehouseMonitorsDelete
#' @export
delete_lakehouse_monitor <- function(client, full_name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor",
    , sep = ""))
}

#' @rdname delete_lakehouse_monitor
#' @export 
lakehouseMonitorsDelete <- delete_lakehouse_monitor
#' Get a table monitor.
#' 
#' Gets a monitor for the specified table.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog 2. have
#' **USE_CATALOG** on the table's parent catalog and be an owner of the table's
#' parent schema. 3. have the following permissions: - **USE_CATALOG** on the
#' table's parent catalog - **USE_SCHEMA** on the table's parent schema -
#' **SELECT** privilege on the table.
#' 
#' The returned information includes configuration values, as well as
#' information on assets created by the monitor. Some information (e.g.,
#' dashboard) may be filtered out if the caller is in a different workspace than
#' where the monitor was created.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#'
#'
#' @rdname get_lakehouse_monitor
#' @alias lakehouseMonitorsGet
#' @export
get_lakehouse_monitor <- function(client, full_name) {

  client$do("GET", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor",
    , sep = ""))
}

#' @rdname get_lakehouse_monitor
#' @export 
lakehouseMonitorsGet <- get_lakehouse_monitor
#' Get refresh.
#' 
#' Gets info about a specific monitor refresh using the given refresh ID.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog 2. have
#' **USE_CATALOG** on the table's parent catalog and be an owner of the table's
#' parent schema 3. have the following permissions: - **USE_CATALOG** on the
#' table's parent catalog - **USE_SCHEMA** on the table's parent schema -
#' **SELECT** privilege on the table.
#' 
#' Additionally, the call must be made from the workspace where the monitor was
#' created.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#' @param refresh_id Required. ID of the refresh.
#'
#'
#' @rdname get_lakehouse_monitor_refresh
#' @alias lakehouseMonitorsGetRefresh
#' @export
get_lakehouse_monitor_refresh <- function(client, full_name, refresh_id) {

  client$do("GET", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor/refreshes/",
    refresh_id, sep = ""))
}

#' @rdname get_lakehouse_monitor_refresh
#' @export 
lakehouseMonitorsGetRefresh <- get_lakehouse_monitor_refresh
#' List refreshes.
#' 
#' Gets an array containing the history of the most recent refreshes (up to 25)
#' for this table.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog 2. have
#' **USE_CATALOG** on the table's parent catalog and be an owner of the table's
#' parent schema 3. have the following permissions: - **USE_CATALOG** on the
#' table's parent catalog - **USE_SCHEMA** on the table's parent schema -
#' **SELECT** privilege on the table.
#' 
#' Additionally, the call must be made from the workspace where the monitor was
#' created.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#'
#'
#' @rdname list_lakehouse_monitor_refreshes
#' @alias lakehouseMonitorsListRefreshes
#' @export
list_lakehouse_monitor_refreshes <- function(client, full_name) {

  client$do("GET", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor/refreshes",
    , sep = ""))
}

#' @rdname list_lakehouse_monitor_refreshes
#' @export 
lakehouseMonitorsListRefreshes <- list_lakehouse_monitor_refreshes
#' Queue a metric refresh for a monitor.
#' 
#' Queues a metric refresh on the monitor for the specified table. The refresh
#' will execute in the background.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog 2. have
#' **USE_CATALOG** on the table's parent catalog and be an owner of the table's
#' parent schema 3. have the following permissions: - **USE_CATALOG** on the
#' table's parent catalog - **USE_SCHEMA** on the table's parent schema - be an
#' owner of the table
#' 
#' Additionally, the call must be made from the workspace where the monitor was
#' created.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the table.
#'
#'
#' @rdname run_lakehouse_monitor_refresh
#' @alias lakehouseMonitorsRunRefresh
#' @export
run_lakehouse_monitor_refresh <- function(client, full_name) {

  client$do("POST", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor/refreshes",
    , sep = ""))
}

#' @rdname run_lakehouse_monitor_refresh
#' @export 
lakehouseMonitorsRunRefresh <- run_lakehouse_monitor_refresh
#' Update a table monitor.
#' 
#' Updates a monitor for the specified table.
#' 
#' The caller must either: 1. be an owner of the table's parent catalog 2. have
#' **USE_CATALOG** on the table's parent catalog and be an owner of the table's
#' parent schema 3. have the following permissions: - **USE_CATALOG** on the
#' table's parent catalog - **USE_SCHEMA** on the table's parent schema - be an
#' owner of the table.
#' 
#' Additionally, the call must be made from the workspace where the monitor was
#' created, and the caller must be the original creator of the monitor.
#' 
#' Certain configuration fields, such as output asset identifiers, cannot be
#' updated.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param baseline_table_name Name of the baseline table from which drift metrics are computed from.
#' @param custom_metrics Custom metrics to compute on the monitored table.
#' @param data_classification_config The data classification config for the monitor.
#' @param full_name Required. Full name of the table.
#' @param inference_log Configuration for monitoring inference logs.
#' @param notifications The notification settings for the monitor.
#' @param output_schema_name Required. Schema where output metric tables are created.
#' @param schedule The schedule for automatically updating and refreshing metric tables.
#' @param slicing_exprs List of column expressions to slice data with for targeted analysis.
#' @param snapshot Configuration for monitoring snapshot tables.
#' @param time_series Configuration for monitoring time series tables.
#'
#'
#' @rdname update_lakehouse_monitor
#' @alias lakehouseMonitorsUpdate
#' @export
update_lakehouse_monitor <- function(client, full_name, output_schema_name, baseline_table_name = NULL,
  custom_metrics = NULL, data_classification_config = NULL, inference_log = NULL,
  notifications = NULL, schedule = NULL, slicing_exprs = NULL, snapshot = NULL,
  time_series = NULL) {
  body <- list(baseline_table_name = baseline_table_name, custom_metrics = custom_metrics,
    data_classification_config = data_classification_config, inference_log = inference_log,
    notifications = notifications, output_schema_name = output_schema_name, schedule = schedule,
    slicing_exprs = slicing_exprs, snapshot = snapshot, time_series = time_series)
  client$do("PUT", paste("/api/2.1/unity-catalog/tables/", full_name, "/monitor",
    , sep = ""), body = body)
}

#' @rdname update_lakehouse_monitor
#' @export 
lakehouseMonitorsUpdate <- update_lakehouse_monitor








