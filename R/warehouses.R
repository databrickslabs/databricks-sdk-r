# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' A SQL warehouse is a compute resource that lets you run SQL commands on data
#' objects within Databricks SQL. Compute resources are infrastructure resources
#' that provide processing capabilities in the cloud.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=warehouses_create]{create} \tab Create a warehouse.\cr
#'  \link[=warehouses_delete]{delete} \tab Delete a warehouse.\cr
#'  \link[=warehouses_edit]{edit} \tab Update a warehouse.\cr
#'  \link[=warehouses_get]{get} \tab Get warehouse info.\cr
#'  \link[=warehouses_get_workspace_warehouse_config]{get_workspace_warehouse_config} \tab Get the workspace configuration.\cr
#'  \link[=warehouses_list]{list} \tab List warehouses.\cr
#'  \link[=warehouses_set_workspace_warehouse_config]{set_workspace_warehouse_config} \tab Set the workspace configuration.\cr
#'  \link[=warehouses_start]{start} \tab Start a warehouse.\cr
#'  \link[=warehouses_stop]{stop} \tab Stop a warehouse.\cr
#' }
#'
#' @rdname warehouses
#' @export
warehouses <- list()

#' Create a warehouse.
#' 
#' Creates a new SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach  
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter. 
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior 
#' by changing the `callback` parameter.
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
#' @keywords internal
#'
#' @rdname warehouses_create
#'
#' @aliases warehouses_create
warehouses_create <- function(auto_stop_mins = NULL, channel = NULL, cluster_size = NULL,
  creator_name = NULL, enable_photon = NULL, enable_serverless_compute = NULL,
  instance_profile_arn = NULL, max_num_clusters = NULL, min_num_clusters = NULL,
  name = NULL, spot_instance_policy = NULL, tags = NULL, warehouse_type = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(auto_stop_mins = auto_stop_mins, channel = channel, cluster_size = cluster_size,
    creator_name = creator_name, enable_photon = enable_photon, enable_serverless_compute = enable_serverless_compute,
    instance_profile_arn = instance_profile_arn, max_num_clusters = max_num_clusters,
    min_num_clusters = min_num_clusters, name = name, spot_instance_policy = spot_instance_policy,
    tags = tags, warehouse_type = warehouse_type)
  op_response <- .state$api$do("POST", "/api/2.0/sql/warehouses", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("STOPPED", "DELETED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehouses_get(id = op_response$id)
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
    prefix <- paste0("databricks::warehouses_get(id=", op_response$id, ")")
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
warehouses$create <- warehouses_create

#' Delete a warehouse.
#' 
#' Deletes a SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach  
#' DELETED state with the timeout of 20 minutes, that you can change via `timeout` parameter. 
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior 
#' by changing the `callback` parameter.
#'
#' @param id Required. Required.
#'
#' @keywords internal
#'
#' @rdname warehouses_delete
#'
#' @aliases warehouses_delete
warehouses_delete <- function(id, timeout = 20, callback = cli_reporter) {

  .state$api$do("DELETE", paste("/api/2.0/sql/warehouses/", id, sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("DELETED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehouses_get(id = id)
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
    prefix <- paste0("databricks::warehouses_get(id=", id, ")")
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
warehouses$delete <- warehouses_delete

#' Update a warehouse.
#' 
#' Updates the configuration for a SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach  
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter. 
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior 
#' by changing the `callback` parameter.
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
#' @keywords internal
#'
#' @rdname warehouses_edit
#'
#' @aliases warehouses_edit
warehouses_edit <- function(id, auto_stop_mins = NULL, channel = NULL, cluster_size = NULL,
  creator_name = NULL, enable_photon = NULL, enable_serverless_compute = NULL,
  instance_profile_arn = NULL, max_num_clusters = NULL, min_num_clusters = NULL,
  name = NULL, spot_instance_policy = NULL, tags = NULL, warehouse_type = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(auto_stop_mins = auto_stop_mins, channel = channel, cluster_size = cluster_size,
    creator_name = creator_name, enable_photon = enable_photon, enable_serverless_compute = enable_serverless_compute,
    instance_profile_arn = instance_profile_arn, max_num_clusters = max_num_clusters,
    min_num_clusters = min_num_clusters, name = name, spot_instance_policy = spot_instance_policy,
    tags = tags, warehouse_type = warehouse_type)
  .state$api$do("POST", paste("/api/2.0/sql/warehouses/", id, "/edit", , sep = ""),
    body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("STOPPED", "DELETED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehouses_get(id = id)
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
    prefix <- paste0("databricks::warehouses_get(id=", id, ")")
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
warehouses$edit <- warehouses_edit

#' Get warehouse info.
#' 
#' Gets the information for a single SQL warehouse.
#'
#' @param id Required. Required.
#'
#' @keywords internal
#'
#' @rdname warehouses_get
#'
#' @aliases warehouses_get
warehouses_get <- function(id) {

  .state$api$do("GET", paste("/api/2.0/sql/warehouses/", id, sep = ""))
}
warehouses$get <- warehouses_get

#' Get the workspace configuration.
#' 
#' Gets the workspace level configuration that is shared by all SQL warehouses
#' in a workspace.#'
#' @keywords internal
#'
#' @rdname warehouses_get_workspace_warehouse_config
#'
#' @aliases warehouses_get_workspace_warehouse_config
warehouses_get_workspace_warehouse_config <- function() {
  .state$api$do("GET", "/api/2.0/sql/config/warehouses")
}
warehouses$get_workspace_warehouse_config <- warehouses_get_workspace_warehouse_config

#' List warehouses.
#' 
#' Lists all SQL warehouses that a user has manager permissions on.
#'
#' @param run_as_user_id Service Principal which will be used to fetch the list of warehouses.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname warehouses_list
#'
#' @aliases warehouses_list
warehouses_list <- function(run_as_user_id = NULL) {
  query <- list(run_as_user_id = run_as_user_id)

  json <- .state$api$do("GET", "/api/2.0/sql/warehouses", query = query)
  return(json$warehouses)

}
warehouses$list <- warehouses_list

#' Set the workspace configuration.
#' 
#' Sets the workspace level configuration that is shared by all SQL warehouses
#' in a workspace.
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
#' @keywords internal
#'
#' @rdname warehouses_set_workspace_warehouse_config
#'
#' @aliases warehouses_set_workspace_warehouse_config
warehouses_set_workspace_warehouse_config <- function(channel = NULL, config_param = NULL,
  data_access_config = NULL, enabled_warehouse_types = NULL, global_param = NULL,
  google_service_account = NULL, instance_profile_arn = NULL, security_policy = NULL,
  sql_configuration_parameters = NULL) {
  body <- list(channel = channel, config_param = config_param, data_access_config = data_access_config,
    enabled_warehouse_types = enabled_warehouse_types, global_param = global_param,
    google_service_account = google_service_account, instance_profile_arn = instance_profile_arn,
    security_policy = security_policy, sql_configuration_parameters = sql_configuration_parameters)
  .state$api$do("PUT", "/api/2.0/sql/config/warehouses", body = body)
}
warehouses$set_workspace_warehouse_config <- warehouses_set_workspace_warehouse_config

#' Start a warehouse.
#' 
#' Starts a SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach  
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter. 
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior 
#' by changing the `callback` parameter.
#'
#' @param id Required. Required.
#'
#' @keywords internal
#'
#' @rdname warehouses_start
#'
#' @aliases warehouses_start
warehouses_start <- function(id, timeout = 20, callback = cli_reporter) {

  .state$api$do("POST", paste("/api/2.0/sql/warehouses/", id, "/start", , sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("STOPPED", "DELETED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehouses_get(id = id)
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
    prefix <- paste0("databricks::warehouses_get(id=", id, ")")
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
warehouses$start <- warehouses_start

#' Stop a warehouse.
#' 
#' Stops a SQL warehouse.
#'
#' @description
#' This is a long-running operation, which blocks until Warehouses on Databricks reach  
#' STOPPED state with the timeout of 20 minutes, that you can change via `timeout` parameter. 
#' By default, the state of Databricks Warehouses is reported to console. You can change this behavior 
#' by changing the `callback` parameter.
#'
#' @param id Required. Required.
#'
#' @keywords internal
#'
#' @rdname warehouses_stop
#'
#' @aliases warehouses_stop
warehouses_stop <- function(id, timeout = 20, callback = cli_reporter) {

  .state$api$do("POST", paste("/api/2.0/sql/warehouses/", id, "/stop", , sep = ""))
  started <- as.numeric(Sys.time())
  target_states <- c("STOPPED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- warehouses_get(id = id)
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
    prefix <- paste0("databricks::warehouses_get(id=", id, ")")
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
warehouses$stop <- warehouses_stop

