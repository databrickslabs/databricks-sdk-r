# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a warehouse.
#' 
#' Creates a new SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param auto_stop_mins The amount of time in minutes that a SQL warehouse must be idle (i.e., no RUNNING queries) before it is automatically stopped.
#' @param channel Channel Details.
#' @param cluster_size Size of the clusters allocated for this warehouse.
#' @param creator_name warehouse creator name.
#' @param enable_photon Configures whether the warehouse should use Photon optimized clusters.
#' @param enable_serverless_compute Configures whether the warehouse should use serverless compute.
#' @param instance_profile_arn Deprecated.
#' @param max_num_clusters Maximum number of clusters that the autoscaler will create to handle concurrent queries.
#' @param min_num_clusters Minimum number of available clusters that will be maintained for this SQL warehouse.
#' @param name Logical name for the cluster.
#' @param spot_instance_policy Configurations whether the warehouse should use spot instances.
#' @param tags A set of key-value pairs that will be tagged on all resources (e.g., AWS instances and EBS volumes) associated with this SQL warehouse.
#' @param warehouse_type Warehouse type: `PRO` or `CLASSIC`.
#'
#' @rdname warehousesCreate
#' @export
warehousesCreate <- function(client, auto_stop_mins = NULL, channel = NULL, cluster_size = NULL,
  creator_name = NULL, enable_photon = NULL, enable_serverless_compute = NULL,
  instance_profile_arn = NULL, max_num_clusters = NULL, min_num_clusters = NULL,
  name = NULL, spot_instance_policy = NULL, tags = NULL, warehouse_type = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(auto_stop_mins = auto_stop_mins, channel = channel, cluster_size = cluster_size,
    creator_name = creator_name, enable_photon = enable_photon, enable_serverless_compute = enable_serverless_compute,
    instance_profile_arn = instance_profile_arn, max_num_clusters = max_num_clusters,
    min_num_clusters = min_num_clusters, name = name, spot_instance_policy = spot_instance_policy,
    tags = tags, warehouse_type = warehouse_type)
  op_response <- client$do("POST", "/api/2.0/sql/warehouses", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("STOPPED", "DELETED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehousesGet(client, id = op_response$id)
    status <- poll$state
    status_message <- paste("current status:", status)
    if (!is.null(poll$health)) {
      status_message <- poll$health$summary
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::warehousesGet(id=", op_response$id, ")")
    sleep <- attempt
    if (sleep > 10) {
      # sleep 10s max per attempt
      sleep <- 10
    }
    if (!is.null(callback)) {
      callback(paste0(status, ": ", status_message), done = FALSE)
    }
    random_pause <- runif(1, min = 0.1, max = 0.5)
    Sys.sleep(sleep + random_pause)
    attempt <- attempt + 1
  }
  msg <- paste("timed out after", timeout, "minutes:", status_message)
  rlang::abort(msg, call = rlang::caller_env())
}

#' Delete a warehouse.
#' 
#' Deletes a SQL warehouse.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Required.
#'
#' @rdname warehousesDelete
#' @export
warehousesDelete <- function(client, id) {

  client$do("DELETE", paste("/api/2.0/sql/warehouses/", id, sep = ""))
}

#' Update a warehouse.
#' 
#' Updates the configuration for a SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param auto_stop_mins The amount of time in minutes that a SQL warehouse must be idle (i.e., no RUNNING queries) before it is automatically stopped.
#' @param channel Channel Details.
#' @param cluster_size Size of the clusters allocated for this warehouse.
#' @param creator_name warehouse creator name.
#' @param enable_photon Configures whether the warehouse should use Photon optimized clusters.
#' @param enable_serverless_compute Configures whether the warehouse should use serverless compute.
#' @param id Required. Required.
#' @param instance_profile_arn Deprecated.
#' @param max_num_clusters Maximum number of clusters that the autoscaler will create to handle concurrent queries.
#' @param min_num_clusters Minimum number of available clusters that will be maintained for this SQL warehouse.
#' @param name Logical name for the cluster.
#' @param spot_instance_policy Configurations whether the warehouse should use spot instances.
#' @param tags A set of key-value pairs that will be tagged on all resources (e.g., AWS instances and EBS volumes) associated with this SQL warehouse.
#' @param warehouse_type Warehouse type: `PRO` or `CLASSIC`.
#'
#' @rdname warehousesEdit
#' @export
warehousesEdit <- function(client, id, auto_stop_mins = NULL, channel = NULL, cluster_size = NULL,
  creator_name = NULL, enable_photon = NULL, enable_serverless_compute = NULL,
  instance_profile_arn = NULL, max_num_clusters = NULL, min_num_clusters = NULL,
  name = NULL, spot_instance_policy = NULL, tags = NULL, warehouse_type = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(auto_stop_mins = auto_stop_mins, channel = channel, cluster_size = cluster_size,
    creator_name = creator_name, enable_photon = enable_photon, enable_serverless_compute = enable_serverless_compute,
    instance_profile_arn = instance_profile_arn, max_num_clusters = max_num_clusters,
    min_num_clusters = min_num_clusters, name = name, spot_instance_policy = spot_instance_policy,
    tags = tags, warehouse_type = warehouse_type)
  op_response <- client$do("POST", paste("/api/2.0/sql/warehouses/", id, "/edit",
    , sep = ""), body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("STOPPED", "DELETED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehousesGet(client, id = id)
    status <- poll$state
    status_message <- paste("current status:", status)
    if (!is.null(poll$health)) {
      status_message <- poll$health$summary
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::warehousesGet(id=", id, ")")
    sleep <- attempt
    if (sleep > 10) {
      # sleep 10s max per attempt
      sleep <- 10
    }
    if (!is.null(callback)) {
      callback(paste0(status, ": ", status_message), done = FALSE)
    }
    random_pause <- runif(1, min = 0.1, max = 0.5)
    Sys.sleep(sleep + random_pause)
    attempt <- attempt + 1
  }
  msg <- paste("timed out after", timeout, "minutes:", status_message)
  rlang::abort(msg, call = rlang::caller_env())
}

#' Get warehouse info.
#' 
#' Gets the information for a single SQL warehouse.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Required.
#'
#' @rdname warehousesGet
#' @export
warehousesGet <- function(client, id) {

  client$do("GET", paste("/api/2.0/sql/warehouses/", id, sep = ""))
}

#' Get SQL warehouse permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param warehouse_id Required. The SQL warehouse for which to get or manage permissions.
#'
#' @rdname warehousesGetPermissionLevels
#' @export
warehousesGetPermissionLevels <- function(client, warehouse_id) {

  client$do("GET", paste("/api/2.0/permissions/warehouses/", warehouse_id, "/permissionLevels",
    , sep = ""))
}

#' Get SQL warehouse permissions.
#' 
#' Gets the permissions of a SQL warehouse. SQL warehouses can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param warehouse_id Required. The SQL warehouse for which to get or manage permissions.
#'
#' @rdname warehousesGetPermissions
#' @export
warehousesGetPermissions <- function(client, warehouse_id) {

  client$do("GET", paste("/api/2.0/permissions/warehouses/", warehouse_id, sep = ""))
}

#' Get the workspace configuration.
#' 
#' Gets the workspace level configuration that is shared by all SQL warehouses
#' in a workspace.#'
#' @rdname warehousesGetWorkspaceWarehouseConfig
#' @export
warehousesGetWorkspaceWarehouseConfig <- function(client) {
  client$do("GET", "/api/2.0/sql/config/warehouses")
}

#' List warehouses.
#' 
#' Lists all SQL warehouses that a user has manager permissions on.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param run_as_user_id Service Principal which will be used to fetch the list of warehouses.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname warehousesList
#' @export
warehousesList <- function(client, run_as_user_id = NULL) {
  query <- list(run_as_user_id = run_as_user_id)

  json <- client$do("GET", "/api/2.0/sql/warehouses", query = query)
  return(json$warehouses)

}

#' Set SQL warehouse permissions.
#' 
#' Sets permissions on a SQL warehouse. SQL warehouses can inherit permissions
#' from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param warehouse_id Required. The SQL warehouse for which to get or manage permissions.
#'
#' @rdname warehousesSetPermissions
#' @export
warehousesSetPermissions <- function(client, warehouse_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/warehouses/", warehouse_id, sep = ""),
    body = body)
}

#' Set the workspace configuration.
#' 
#' Sets the workspace level configuration that is shared by all SQL warehouses
#' in a workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param channel Optional: Channel selection details.
#' @param config_param Deprecated: Use sql_configuration_parameters.
#' @param data_access_config Spark confs for external hive metastore configuration JSON serialized size must be less than <= 512K.
#' @param enabled_warehouse_types List of Warehouse Types allowed in this workspace (limits allowed value of the type field in CreateWarehouse and EditWarehouse).
#' @param global_param Deprecated: Use sql_configuration_parameters.
#' @param google_service_account GCP only: Google Service Account used to pass to cluster to access Google Cloud Storage.
#' @param instance_profile_arn AWS Only: Instance profile used to pass IAM role to the cluster.
#' @param security_policy Security policy for warehouses.
#' @param sql_configuration_parameters SQL configuration parameters.
#'
#' @rdname warehousesSetWorkspaceWarehouseConfig
#' @export
warehousesSetWorkspaceWarehouseConfig <- function(client, channel = NULL, config_param = NULL,
  data_access_config = NULL, enabled_warehouse_types = NULL, global_param = NULL,
  google_service_account = NULL, instance_profile_arn = NULL, security_policy = NULL,
  sql_configuration_parameters = NULL) {
  body <- list(channel = channel, config_param = config_param, data_access_config = data_access_config,
    enabled_warehouse_types = enabled_warehouse_types, global_param = global_param,
    google_service_account = google_service_account, instance_profile_arn = instance_profile_arn,
    security_policy = security_policy, sql_configuration_parameters = sql_configuration_parameters)
  client$do("PUT", "/api/2.0/sql/config/warehouses", body = body)
}

#' Start a warehouse.
#' 
#' Starts a SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Required.
#'
#' @rdname warehousesStart
#' @export
warehousesStart <- function(client, id, timeout = 20, callback = cli_reporter) {

  op_response <- client$do("POST", paste("/api/2.0/sql/warehouses/", id, "/start",
    , sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("STOPPED", "DELETED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehousesGet(client, id = id)
    status <- poll$state
    status_message <- paste("current status:", status)
    if (!is.null(poll$health)) {
      status_message <- poll$health$summary
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::warehousesGet(id=", id, ")")
    sleep <- attempt
    if (sleep > 10) {
      # sleep 10s max per attempt
      sleep <- 10
    }
    if (!is.null(callback)) {
      callback(paste0(status, ": ", status_message), done = FALSE)
    }
    random_pause <- runif(1, min = 0.1, max = 0.5)
    Sys.sleep(sleep + random_pause)
    attempt <- attempt + 1
  }
  msg <- paste("timed out after", timeout, "minutes:", status_message)
  rlang::abort(msg, call = rlang::caller_env())
}

#' Stop a warehouse.
#' 
#' Stops a SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach
#' STOPPED state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Required.
#'
#' @rdname warehousesStop
#' @export
warehousesStop <- function(client, id, timeout = 20, callback = cli_reporter) {

  op_response <- client$do("POST", paste("/api/2.0/sql/warehouses/", id, "/stop",
    , sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("STOPPED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehousesGet(client, id = id)
    status <- poll$state
    status_message <- paste("current status:", status)
    if (!is.null(poll$health)) {
      status_message <- poll$health$summary
    }
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    prefix <- paste0("databricks::warehousesGet(id=", id, ")")
    sleep <- attempt
    if (sleep > 10) {
      # sleep 10s max per attempt
      sleep <- 10
    }
    if (!is.null(callback)) {
      callback(paste0(status, ": ", status_message), done = FALSE)
    }
    random_pause <- runif(1, min = 0.1, max = 0.5)
    Sys.sleep(sleep + random_pause)
    attempt <- attempt + 1
  }
  msg <- paste("timed out after", timeout, "minutes:", status_message)
  rlang::abort(msg, call = rlang::caller_env())
}

#' Update SQL warehouse permissions.
#' 
#' Updates the permissions on a SQL warehouse. SQL warehouses can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param warehouse_id Required. The SQL warehouse for which to get or manage permissions.
#'
#' @rdname warehousesUpdatePermissions
#' @export
warehousesUpdatePermissions <- function(client, warehouse_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/warehouses/", warehouse_id, sep = ""),
    body = body)
}

