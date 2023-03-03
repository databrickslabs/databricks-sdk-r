# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Change cluster owner.
#' 
#' Change the owner of the cluster. You must be an admin to perform this
#' operation.
#'
#' @param cluster_id <needs content added>.
#' @param owner_username New owner of the cluster_id after this RPC.
databricks_clusters_change_owner <- function(cluster_id, owner_username, ...) {
    body <- list(
        cluster_id = cluster_id, 
        owner_username = owner_username, ...)
    
    .api$do("POST", "/api/2.0/clusters/change-owner", body = body)
}

#' Create new cluster.
#' 
#' Creates a new Spark cluster. This method will acquire new instances from the
#' cloud provider if necessary. This method is asynchronous; the returned
#' `cluster_id` can be used to poll the cluster status. When this method
#' returns, the cluster will be in\na `PENDING` state. The cluster will be
#' usable once it enters a `RUNNING` state.
#' 
#' Note: Databricks may not be able to acquire some of the requested nodes, due
#' to cloud provider limitations (account limits, spot price, etc.) or transient
#' network issues.
#' 
#' If Databricks acquires at least 85% of the requested on-demand nodes, cluster
#' creation will succeed. Otherwise the cluster will terminate with an
#' informative error message.
#'
#' @param apply_policy_default_values Note: This field won't be true for webapp requests.
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param autotermination_minutes Automatically terminates the cluster after it is inactive for this time in minutes.
#' @param aws_attributes Attributes related to clusters running on Amazon Web Services.
#' @param azure_attributes Attributes related to clusters running on Microsoft Azure.
#' @param cluster_log_conf The configuration for delivering spark logs to a long-term storage destination.
#' @param cluster_name Cluster name requested by the user.
#' @param cluster_source Determines whether the cluster was created by a user through the UI, created by the Databricks Jobs Scheduler, or through an API request.
#' @param custom_tags Additional tags for cluster resources.
#' @param driver_instance_pool_id The optional ID of the instance pool for the driver of the cluster belongs.
#' @param driver_node_type_id The node type of the Spark driver.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this cluster will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param enable_local_disk_encryption Whether to enable LUKS on cluster VMs' local disks.
#' @param gcp_attributes Attributes related to clusters running on Google Cloud Platform.
#' @param instance_pool_id The optional ID of the instance pool to which the cluster belongs.
#' @param node_type_id This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param num_workers Number of worker nodes that this cluster should have.
#' @param policy_id The ID of the cluster policy used to create the cluster if applicable.
#' @param runtime_engine Decides which runtime engine to be use, e.g.
#' @param spark_conf An object containing a set of optional, user-specified Spark configuration key-value pairs.
#' @param spark_env_vars An object containing a set of optional, user-specified environment variable key-value pairs.
#' @param spark_version The Spark version of the cluster, e.g.
#' @param ssh_public_keys SSH public key contents that will be added to each Spark node in this cluster.
#' @param workload_type 
databricks_clusters_create <- function(spark_version, apply_policy_default_values = NULL, 
    autoscale = NULL, 
    autotermination_minutes = NULL, 
    aws_attributes = NULL, 
    azure_attributes = NULL, 
    cluster_log_conf = NULL, 
    cluster_name = NULL, 
    cluster_source = NULL, 
    custom_tags = NULL, 
    driver_instance_pool_id = NULL, 
    driver_node_type_id = NULL, 
    enable_elastic_disk = NULL, 
    enable_local_disk_encryption = NULL, 
    gcp_attributes = NULL, 
    instance_pool_id = NULL, 
    node_type_id = NULL, 
    num_workers = NULL, 
    policy_id = NULL, 
    runtime_engine = NULL, 
    spark_conf = NULL, 
    spark_env_vars = NULL, 
    ssh_public_keys = NULL, 
    workload_type = NULL, 
    timeout=20, ...) {
    body <- list(
        apply_policy_default_values = apply_policy_default_values, 
        autoscale = autoscale, 
        autotermination_minutes = autotermination_minutes, 
        aws_attributes = aws_attributes, 
        azure_attributes = azure_attributes, 
        cluster_log_conf = cluster_log_conf, 
        cluster_name = cluster_name, 
        cluster_source = cluster_source, 
        custom_tags = custom_tags, 
        driver_instance_pool_id = driver_instance_pool_id, 
        driver_node_type_id = driver_node_type_id, 
        enable_elastic_disk = enable_elastic_disk, 
        enable_local_disk_encryption = enable_local_disk_encryption, 
        gcp_attributes = gcp_attributes, 
        instance_pool_id = instance_pool_id, 
        node_type_id = node_type_id, 
        num_workers = num_workers, 
        policy_id = policy_id, 
        runtime_engine = runtime_engine, 
        spark_conf = spark_conf, 
        spark_env_vars = spark_env_vars, 
        spark_version = spark_version, 
        ssh_public_keys = ssh_public_keys, 
        workload_type = workload_type, ...)
    
    op_response <- .api$do("POST", "/api/2.0/clusters/create", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("ERROR", "TERMINATED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_clusters_get(cluster_id = op_response$cluster_id)
        status <- poll$state
        status_message <- poll$state_message
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks_clusters_get(cluster_id=", op_response$cluster_id, ")")
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

#' Terminate cluster.
#' 
#' Terminates the Spark cluster with the specified ID. The cluster is removed
#' asynchronously. Once the termination has completed, the cluster will be in a
#' `TERMINATED` state. If the cluster is already in a `TERMINATING` or
#' `TERMINATED` state, nothing will happen.
#'
#' @param cluster_id The cluster to be terminated.
databricks_clusters_delete <- function(cluster_id, timeout=20, ...) {
    body <- list(
        cluster_id = cluster_id, ...)
    
    .api$do("POST", "/api/2.0/clusters/delete", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("TERMINATED", c())
    failure_states <- c("ERROR", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_clusters_get(cluster_id = cluster_id)
        status <- poll$state
        status_message <- poll$state_message
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach TERMINATED, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks_clusters_get(cluster_id=", cluster_id, ")")
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

#' Update cluster configuration.
#' 
#' Updates the configuration of a cluster to match the provided attributes and
#' size. A cluster can be updated if it is in a `RUNNING` or `TERMINATED` state.
#' 
#' If a cluster is updated while in a `RUNNING` state, it will be restarted so
#' that the new attributes can take effect.
#' 
#' If a cluster is updated while in a `TERMINATED` state, it will remain
#' `TERMINATED`. The next time it is started using the `clusters/start` API, the
#' new attributes will take effect. Any attempt to update a cluster in any other
#' state will be rejected with an `INVALID_STATE` error code.
#' 
#' Clusters created by the Databricks Jobs service cannot be edited.
#'
#' @param apply_policy_default_values Note: This field won't be true for webapp requests.
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param autotermination_minutes Automatically terminates the cluster after it is inactive for this time in minutes.
#' @param aws_attributes Attributes related to clusters running on Amazon Web Services.
#' @param azure_attributes Attributes related to clusters running on Microsoft Azure.
#' @param cluster_id ID of the cluser.
#' @param cluster_log_conf The configuration for delivering spark logs to a long-term storage destination.
#' @param cluster_name Cluster name requested by the user.
#' @param cluster_source Determines whether the cluster was created by a user through the UI, created by the Databricks Jobs Scheduler, or through an API request.
#' @param custom_tags Additional tags for cluster resources.
#' @param driver_instance_pool_id The optional ID of the instance pool for the driver of the cluster belongs.
#' @param driver_node_type_id The node type of the Spark driver.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this cluster will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param enable_local_disk_encryption Whether to enable LUKS on cluster VMs' local disks.
#' @param gcp_attributes Attributes related to clusters running on Google Cloud Platform.
#' @param instance_pool_id The optional ID of the instance pool to which the cluster belongs.
#' @param node_type_id This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param num_workers Number of worker nodes that this cluster should have.
#' @param policy_id The ID of the cluster policy used to create the cluster if applicable.
#' @param runtime_engine Decides which runtime engine to be use, e.g.
#' @param spark_conf An object containing a set of optional, user-specified Spark configuration key-value pairs.
#' @param spark_env_vars An object containing a set of optional, user-specified environment variable key-value pairs.
#' @param spark_version The Spark version of the cluster, e.g.
#' @param ssh_public_keys SSH public key contents that will be added to each Spark node in this cluster.
#' @param workload_type 
databricks_clusters_edit <- function(cluster_id, spark_version, apply_policy_default_values = NULL, 
    autoscale = NULL, 
    autotermination_minutes = NULL, 
    aws_attributes = NULL, 
    azure_attributes = NULL, 
    cluster_log_conf = NULL, 
    cluster_name = NULL, 
    cluster_source = NULL, 
    custom_tags = NULL, 
    driver_instance_pool_id = NULL, 
    driver_node_type_id = NULL, 
    enable_elastic_disk = NULL, 
    enable_local_disk_encryption = NULL, 
    gcp_attributes = NULL, 
    instance_pool_id = NULL, 
    node_type_id = NULL, 
    num_workers = NULL, 
    policy_id = NULL, 
    runtime_engine = NULL, 
    spark_conf = NULL, 
    spark_env_vars = NULL, 
    ssh_public_keys = NULL, 
    workload_type = NULL, 
    timeout=20, ...) {
    body <- list(
        apply_policy_default_values = apply_policy_default_values, 
        autoscale = autoscale, 
        autotermination_minutes = autotermination_minutes, 
        aws_attributes = aws_attributes, 
        azure_attributes = azure_attributes, 
        cluster_id = cluster_id, 
        cluster_log_conf = cluster_log_conf, 
        cluster_name = cluster_name, 
        cluster_source = cluster_source, 
        custom_tags = custom_tags, 
        driver_instance_pool_id = driver_instance_pool_id, 
        driver_node_type_id = driver_node_type_id, 
        enable_elastic_disk = enable_elastic_disk, 
        enable_local_disk_encryption = enable_local_disk_encryption, 
        gcp_attributes = gcp_attributes, 
        instance_pool_id = instance_pool_id, 
        node_type_id = node_type_id, 
        num_workers = num_workers, 
        policy_id = policy_id, 
        runtime_engine = runtime_engine, 
        spark_conf = spark_conf, 
        spark_env_vars = spark_env_vars, 
        spark_version = spark_version, 
        ssh_public_keys = ssh_public_keys, 
        workload_type = workload_type, ...)
    
    .api$do("POST", "/api/2.0/clusters/edit", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("ERROR", "TERMINATED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_clusters_get(cluster_id = cluster_id)
        status <- poll$state
        status_message <- poll$state_message
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks_clusters_get(cluster_id=", cluster_id, ")")
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

#' List cluster activity events.
#' 
#' Retrieves a list of events about the activity of a cluster. This API is
#' paginated. If there are more events to read, the response includes all the
#' nparameters necessary to request the next page of events.
#'
#' @param cluster_id The ID of the cluster to retrieve events about.
#' @param end_time The end time in epoch milliseconds.
#' @param event_types An optional set of event types to filter on.
#' @param limit The maximum number of events to include in a page of events.
#' @param offset The offset in the result set.
#' @param order The order to list events in; either "ASC" or "DESC".
#' @param start_time The start time in epoch milliseconds.
databricks_clusters_events <- function(cluster_id, end_time = NULL, 
    event_types = NULL, 
    limit = NULL, 
    offset = NULL, 
    order = NULL, 
    start_time = NULL, 
    ...) {
    body <- list(
        cluster_id = cluster_id, 
        end_time = end_time, 
        event_types = event_types, 
        limit = limit, 
        offset = offset, 
        order = order, 
        start_time = start_time, ...)
    
    
    
    results <- data.frame()
    while (TRUE) {
        json <- .api$do("POST", "/api/2.0/clusters/events", body = body)
        if (is.null(nrow(json$events))) {
            break
        }
        # append this page of results to one results data.frame
        results <- dplyr::bind_rows(results, json$events)
        if (is.null(json$next_page)) {
            break
        }
        body <- json$next_page
    }
    return (results)
    
}

#' Get cluster info.
#' 
#' "Retrieves the information for a cluster given its identifier. Clusters can
#' be described while they are running, or up to 60 days after they are
#' terminated.
#'
#' @param cluster_id The cluster about which to retrieve information.
databricks_clusters_get <- function(cluster_id, ...) {
    query <- list(
        cluster_id = cluster_id, ...)
    
    .api$do("GET", "/api/2.0/clusters/get", query = query)
}

#' List all clusters.
#' 
#' Returns information about all pinned clusters, currently active clusters, up
#' to 70 of the most recently terminated interactive clusters in the past 7
#' days, and up to 30 of the most recently terminated job clusters in the past 7
#' days.
#' 
#' For example, if there is 1 pinned cluster, 4 active clusters, 45 terminated
#' interactive clusters in the past 7 days, and 50 terminated job clusters\nin
#' the past 7 days, then this API returns the 1 pinned cluster, 4 active
#' clusters, all 45 terminated interactive clusters, and the 30 most recently
#' terminated job clusters.
#'
#' @param can_use_client Filter clusters based on what type of client it can be used for.
databricks_clusters_list <- function(can_use_client = NULL, 
    ...) {
    query <- list(
        can_use_client = can_use_client, ...)
    
    
    json <- .api$do("GET", "/api/2.0/clusters/list", query = query)
    return (json$clusters)
    
}

#' List node types.
#' 
#' Returns a list of supported Spark node types. These node types can be used to
#' launch a cluster.
databricks_clusters_list_node_types <- function(...) {
    
    .api$do("GET", "/api/2.0/clusters/list-node-types")
}

#' List availability zones.
#' 
#' Returns a list of availability zones where clusters can be created in (For
#' example, us-west-2a). These zones can be used to launch a cluster.
databricks_clusters_list_zones <- function(...) {
    
    .api$do("GET", "/api/2.0/clusters/list-zones")
}

#' Permanently delete cluster.
#' 
#' Permanently deletes a Spark cluster. This cluster is terminated and resources
#' are asynchronously removed.
#' 
#' In addition, users will no longer see permanently deleted clusters in the
#' cluster list, and API users can no longer perform any action on permanently
#' deleted clusters.
#'
#' @param cluster_id The cluster to be deleted.
databricks_clusters_permanent_delete <- function(cluster_id, ...) {
    body <- list(
        cluster_id = cluster_id, ...)
    
    .api$do("POST", "/api/2.0/clusters/permanent-delete", body = body)
}

#' Pin cluster.
#' 
#' Pinning a cluster ensures that the cluster will always be returned by the
#' ListClusters API. Pinning a cluster that is already pinned will have no
#' effect. This API can only be called by workspace admins.
#'
#' @param cluster_id <needs content added>.
databricks_clusters_pin <- function(cluster_id, ...) {
    body <- list(
        cluster_id = cluster_id, ...)
    
    .api$do("POST", "/api/2.0/clusters/pin", body = body)
}

#' Resize cluster.
#' 
#' Resizes a cluster to have a desired number of workers. This will fail unless
#' the cluster is in a `RUNNING` state.
#'
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param cluster_id The cluster to be resized.
#' @param num_workers Number of worker nodes that this cluster should have.
databricks_clusters_resize <- function(cluster_id, autoscale = NULL, 
    num_workers = NULL, 
    timeout=20, ...) {
    body <- list(
        autoscale = autoscale, 
        cluster_id = cluster_id, 
        num_workers = num_workers, ...)
    
    .api$do("POST", "/api/2.0/clusters/resize", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("ERROR", "TERMINATED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_clusters_get(cluster_id = cluster_id)
        status <- poll$state
        status_message <- poll$state_message
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks_clusters_get(cluster_id=", cluster_id, ")")
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

#' Restart cluster.
#' 
#' Restarts a Spark cluster with the supplied ID. If the cluster is not
#' currently in a `RUNNING` state, nothing will happen.
#'
#' @param cluster_id The cluster to be started.
#' @param restart_user <needs content added>.
databricks_clusters_restart <- function(cluster_id, restart_user = NULL, 
    timeout=20, ...) {
    body <- list(
        cluster_id = cluster_id, 
        restart_user = restart_user, ...)
    
    .api$do("POST", "/api/2.0/clusters/restart", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("ERROR", "TERMINATED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_clusters_get(cluster_id = cluster_id)
        status <- poll$state
        status_message <- poll$state_message
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks_clusters_get(cluster_id=", cluster_id, ")")
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

#' List available Spark versions.
#' 
#' Returns the list of available Spark versions. These versions can be used to
#' launch a cluster.
databricks_clusters_spark_versions <- function(...) {
    
    .api$do("GET", "/api/2.0/clusters/spark-versions")
}

#' Start terminated cluster.
#' 
#' Starts a terminated Spark cluster with the supplied ID. This works similar to
#' `createCluster` except:
#' 
#' * The previous cluster id and attributes are preserved. * The cluster starts
#' with the last specified cluster size. * If the previous cluster was an
#' autoscaling cluster, the current cluster starts with the minimum number of
#' nodes. * If the cluster is not currently in a `TERMINATED` state, nothing
#' will happen. * Clusters launched to run a job cannot be started.
#'
#' @param cluster_id The cluster to be started.
databricks_clusters_start <- function(cluster_id, timeout=20, ...) {
    body <- list(
        cluster_id = cluster_id, ...)
    
    .api$do("POST", "/api/2.0/clusters/start", body = body)
    started <- as.numeric(Sys.time())
    target_states <- c("RUNNING", c())
    failure_states <- c("ERROR", "TERMINATED", c())
    status_message <- 'polling...'
    attempt <- 1
    while ((started + (timeout*60)) > as.numeric(Sys.time())) {
        poll <- databricks_clusters_get(cluster_id = cluster_id)
        status <- poll$state
        status_message <- poll$state_message
        if (status %in% target_states) {
            return (poll)
        }
        if (status %in% failure_states) {
            msg <- paste("failed to reach RUNNING, got ", status, "-", status_message)
            rlang::abort(msg, call = rlang::caller_env())
        }
        prefix <- paste0("databricks_clusters_get(cluster_id=", cluster_id, ")")
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

#' Unpin cluster.
#' 
#' Unpinning a cluster will allow the cluster to eventually be removed from the
#' ListClusters API. Unpinning a cluster that is not pinned will have no effect.
#' This API can only be called by workspace admins.
#'
#' @param cluster_id <needs content added>.
databricks_clusters_unpin <- function(cluster_id, ...) {
    body <- list(
        cluster_id = cluster_id, ...)
    
    .api$do("POST", "/api/2.0/clusters/unpin", body = body)
}













