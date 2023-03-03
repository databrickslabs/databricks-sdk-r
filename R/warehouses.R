# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a warehouse.
#' 
#' Creates a new SQL warehouse.
#'
#' @param auto_stop_mins The amount of time in minutes that a SQL Endpoint must be idle (i.e., no RUNNING queries) before it is automatically stopped.
#' @param channel Channel Details.
#' @param cluster_size Size of the clusters allocated for this endpoint.
#' @param creator_name endpoint creator name.
#' @param enable_photon Configures whether the endpoint should use Photon optimized clusters.
#' @param enable_serverless_compute Configures whether the endpoint should use Serverless Compute (aka Nephos) Defaults to value in global endpoint settings.
#' @param instance_profile_arn Deprecated.
#' @param max_num_clusters Maximum number of clusters that the autoscaler will create to handle concurrent queries.
#' @param min_num_clusters Minimum number of available clusters that will be maintained for this SQL Endpoint.
#' @param name Logical name for the cluster.
#' @param spot_instance_policy Configurations whether the warehouse should use spot instances.
#' @param tags A set of key-value pairs that will be tagged on all resources (e.g., AWS instances and EBS volumes) associated with this SQL Endpoints.
#' @param warehouse_type 
databricks_warehouses_create <- function(auto_stop_mins = NULL, 
    channel = NULL, 
    cluster_size = NULL, 
    creator_name = NULL, 
    enable_photon = NULL, 
    enable_serverless_compute = NULL, 
    instance_profile_arn = NULL, 
    max_num_clusters = NULL, 
    min_num_clusters = NULL, 
    name = NULL, 
    spot_instance_policy = NULL, 
    tags = NULL, 
    warehouse_type = NULL, 
    timeout=20, ...) {
    body <- list(
        auto_stop_mins = auto_stop_mins, 
        channel = channel, 
        cluster_size = cluster_size, 
        creator_name = creator_name, 
        enable_photon = enable_photon, 
        enable_serverless_compute = enable_serverless_compute, 
        instance_profile_arn = instance_profile_arn, 
        max_num_clusters = max_num_clusters, 
        min_num_clusters = min_num_clusters, 
        name = name, 
        spot_instance_policy = spot_instance_policy, 
        tags = tags, 
        warehouse_type = warehouse_type, ...)
    
    op_response <- .api$do("POST", "/api/2.0/sql/warehouses", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("STOPPED", "DELETED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_warehouses_get(id = op_response$id)
        status <- poll$state
        status_message <- paste("current status:", status)
        if (!is.null(poll$health)) {
            status_message <- poll$health$summary
        }
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_warehouses_get(id=", op_response$id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
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
#'
#' @param id Required.
databricks_warehouses_delete <- function(id, timeout=20, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/sql/warehouses/", id, sep = ""))
    started <- as.numeric(Sys.time())
    target_states <- c("DELETED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_warehouses_get(id = id)
        status <- poll$state
        status_message <- paste("current status:", status)
        if (!is.null(poll$health)) {
            status_message <- poll$health$summary
        }
        if (status %in% target_states) {
            return (poll)
        }
        prefix <- paste("databricks_warehouses_get(id=", id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
        random_pause <- runif(1, min = 0.1, max = 0.5)
        Sys.sleep(sleep + random_pause)
        attempt <- attempt + 1
    }
    msg <- paste("timed out after", timeout, "minutes:", status_message)
    rlang::abort(msg, call = rlang::caller_env())
}

#' Update a warehouse.
#' 
#' Updates the configuration for a SQL warehouse.
#'
#' @param auto_stop_mins The amount of time in minutes that a SQL Endpoint must be idle (i.e., no RUNNING queries) before it is automatically stopped.
#' @param channel Channel Details.
#' @param cluster_size Size of the clusters allocated for this endpoint.
#' @param creator_name endpoint creator name.
#' @param enable_databricks_compute Configures whether the endpoint should use Databricks Compute (aka Nephos) Deprecated: Use enable_serverless_compute.
#' @param enable_photon Configures whether the endpoint should use Photon optimized clusters.
#' @param enable_serverless_compute Configures whether the endpoint should use Serverless Compute (aka Nephos) Defaults to value in global endpoint settings.
#' @param id Required.
#' @param instance_profile_arn Deprecated.
#' @param max_num_clusters Maximum number of clusters that the autoscaler will create to handle concurrent queries.
#' @param min_num_clusters Minimum number of available clusters that will be maintained for this SQL Endpoint.
#' @param name Logical name for the cluster.
#' @param spot_instance_policy Configurations whether the warehouse should use spot instances.
#' @param tags A set of key-value pairs that will be tagged on all resources (e.g., AWS instances and EBS volumes) associated with this SQL Endpoints.
#' @param warehouse_type 
databricks_warehouses_edit <- function(id, auto_stop_mins = NULL, 
    channel = NULL, 
    cluster_size = NULL, 
    creator_name = NULL, 
    enable_databricks_compute = NULL, 
    enable_photon = NULL, 
    enable_serverless_compute = NULL, 
    instance_profile_arn = NULL, 
    max_num_clusters = NULL, 
    min_num_clusters = NULL, 
    name = NULL, 
    spot_instance_policy = NULL, 
    tags = NULL, 
    warehouse_type = NULL, 
    timeout=20, ...) {
    body <- list(
        auto_stop_mins = auto_stop_mins, 
        channel = channel, 
        cluster_size = cluster_size, 
        creator_name = creator_name, 
        enable_databricks_compute = enable_databricks_compute, 
        enable_photon = enable_photon, 
        enable_serverless_compute = enable_serverless_compute, 
        instance_profile_arn = instance_profile_arn, 
        max_num_clusters = max_num_clusters, 
        min_num_clusters = min_num_clusters, 
        name = name, 
        spot_instance_policy = spot_instance_policy, 
        tags = tags, 
        warehouse_type = warehouse_type, ...)
    
    .api$do("POST", paste("/api/2.0/sql/warehouses/", id, "/edit", , sep = ""), body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("STOPPED", "DELETED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_warehouses_get(id = id)
        status <- poll$state
        status_message <- paste("current status:", status)
        if (!is.null(poll$health)) {
            status_message <- poll$health$summary
        }
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_warehouses_get(id=", id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
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
#'
#' @param id Required.
databricks_warehouses_get <- function(id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/sql/warehouses/", id, sep = ""))
}

#' Get the workspace configuration.
#' 
#' Gets the workspace level configuration that is shared by all SQL warehouses
#' in a workspace.
databricks_warehouses_get_workspace_warehouse_config <- function(...) {
    
    .api$do("GET", "/api/2.0/sql/config/warehouses")
}

#' List warehouses.
#' 
#' Lists all SQL warehouses that a user has manager permissions on.
#'
#' @param run_as_user_id Service Principal which will be used to fetch the list of endpoints.
databricks_warehouses_list <- function(run_as_user_id = NULL, 
    ...) {
    query <- list(
        run_as_user_id = run_as_user_id, ...)
    
    
    json <- .api$do("GET", "/api/2.0/sql/warehouses", query = query)
    return (json$warehouses)
    
}

#' Set the workspace configuration.
#' 
#' Sets the workspace level configuration that is shared by all SQL warehouses
#' in a workspace.
#'
#' @param channel Optional: Channel selection details.
#' @param config_param Deprecated: Use sql_configuration_parameters.
#' @param data_access_config Spark confs for external hive metastore configuration JSON serialized size must be less than <= 512K.
#' @param enable_databricks_compute Enable Serverless compute for SQL Endpoints Deprecated: Use enable_serverless_compute.
#' @param enable_serverless_compute Enable Serverless compute for SQL Endpoints.
#' @param enabled_warehouse_types List of Warehouse Types allowed in this workspace (limits allowed value of the type field in CreateWarehouse and EditWarehouse).
#' @param global_param Deprecated: Use sql_configuration_parameters.
#' @param google_service_account GCP only: Google Service Account used to pass to cluster to access Google Cloud Storage.
#' @param instance_profile_arn AWS Only: Instance profile used to pass IAM role to the cluster.
#' @param security_policy Security policy for endpoints.
#' @param serverless_agreement Internal.
#' @param sql_configuration_parameters SQL configuration parameters.
databricks_warehouses_set_workspace_warehouse_config <- function(channel = NULL, 
    config_param = NULL, 
    data_access_config = NULL, 
    enable_databricks_compute = NULL, 
    enable_serverless_compute = NULL, 
    enabled_warehouse_types = NULL, 
    global_param = NULL, 
    google_service_account = NULL, 
    instance_profile_arn = NULL, 
    security_policy = NULL, 
    serverless_agreement = NULL, 
    sql_configuration_parameters = NULL, 
    ...) {
    body <- list(
        channel = channel, 
        config_param = config_param, 
        data_access_config = data_access_config, 
        enable_databricks_compute = enable_databricks_compute, 
        enable_serverless_compute = enable_serverless_compute, 
        enabled_warehouse_types = enabled_warehouse_types, 
        global_param = global_param, 
        google_service_account = google_service_account, 
        instance_profile_arn = instance_profile_arn, 
        security_policy = security_policy, 
        serverless_agreement = serverless_agreement, 
        sql_configuration_parameters = sql_configuration_parameters, ...)
    
    .api$do("PUT", "/api/2.0/sql/config/warehouses", body = body)
}

#' Start a warehouse.
#' 
#' Starts a SQL warehouse.
#'
#' @param id Required.
databricks_warehouses_start <- function(id, timeout=20, ...) {
    
    
    .api$do("POST", paste("/api/2.0/sql/warehouses/", id, "/start", , sep = ""))
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("STOPPED", "DELETED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_warehouses_get(id = id)
        status <- poll$state
        status_message <- paste("current status:", status)
        if (!is.null(poll$health)) {
            status_message <- poll$health$summary
        }
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste("databricks_warehouses_get(id=", id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
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
#' @param id Required.
databricks_warehouses_stop <- function(id, timeout=20, ...) {
    
    
    .api$do("POST", paste("/api/2.0/sql/warehouses/", id, "/stop", , sep = ""))
    started <- as.numeric(Sys.time())
    target_states <- c("STOPPED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_warehouses_get(id = id)
        status <- poll$state
        status_message <- paste("current status:", status)
        if (!is.null(poll$health)) {
            status_message <- poll$health$summary
        }
        if (status %in% target_states) {
            return (poll)
        }
        prefix <- paste("databricks_warehouses_get(id=", id)
        sleep <- attempt
        if (sleep > 10) {
            # sleep 10s max per attempt
            sleep <- 10
        }
        msg <- paste(prefix, status, status_message, paste0(". Sleeping ~", sleep, "s"))
        message(msg)
        random_pause <- runif(1, min = 0.1, max = 0.5)
        Sys.sleep(sleep + random_pause)
        attempt <- attempt + 1
    }
    msg <- paste("timed out after", timeout, "minutes:", status_message)
    rlang::abort(msg, call = rlang::caller_env())
}













