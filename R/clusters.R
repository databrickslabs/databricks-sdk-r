# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Change cluster owner.
#' 
#' Change the owner of the cluster. You must be an admin and the cluster must be
#' terminated to perform this operation. The service principal application ID
#' can be supplied as an argument to `owner_username`.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. needs content added.
#' @param owner_username Required. New owner of the cluster_id after this RPC.
#'
#'
#' @rdname change_cluster_owner
#' @alias clustersChangeOwner
#' @export
change_cluster_owner <- function(client, cluster_id, owner_username) {
  body <- list(cluster_id = cluster_id, owner_username = owner_username)
  client$do("POST", "/api/2.0/clusters/change-owner", body = body)
}

#' @rdname change_cluster_owner
#' @export 
clustersChangeOwner <- change_cluster_owner
#' Create new cluster.
#' 
#' Creates a new Spark cluster. This method will acquire new instances from the
#' cloud provider if necessary. Note: Databricks may not be able to acquire some
#' of the requested nodes, due to cloud provider limitations (account limits,
#' spot price, etc.) or transient network issues.
#' 
#' If Databricks acquires at least 85% of the requested on-demand nodes, cluster
#' creation will succeed. Otherwise the cluster will terminate with an
#' informative error message.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param apply_policy_default_values This field has no description yet.
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param autotermination_minutes Automatically terminates the cluster after it is inactive for this time in minutes.
#' @param aws_attributes Attributes related to clusters running on Amazon Web Services.
#' @param azure_attributes Attributes related to clusters running on Microsoft Azure.
#' @param cluster_log_conf The configuration for delivering spark logs to a long-term storage destination.
#' @param cluster_name Cluster name requested by the user.
#' @param cluster_source Determines whether the cluster was created by a user through the UI, created by the Databricks Jobs Scheduler, or through an API request.
#' @param custom_tags Additional tags for cluster resources.
#' @param data_security_mode Data security mode decides what data governance model to use when accessing data from a cluster.
#' @param docker_image This field has no description yet.
#' @param driver_instance_pool_id The optional ID of the instance pool for the driver of the cluster belongs.
#' @param driver_node_type_id The node type of the Spark driver.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this cluster will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param enable_local_disk_encryption Whether to enable LUKS on cluster VMs' local disks.
#' @param gcp_attributes Attributes related to clusters running on Google Cloud Platform.
#' @param init_scripts The configuration for storing init scripts.
#' @param instance_pool_id The optional ID of the instance pool to which the cluster belongs.
#' @param node_type_id This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param num_workers Number of worker nodes that this cluster should have.
#' @param policy_id The ID of the cluster policy used to create the cluster if applicable.
#' @param runtime_engine Decides which runtime engine to be use, e.g.
#' @param single_user_name Single user name if data_security_mode is `SINGLE_USER`.
#' @param spark_conf An object containing a set of optional, user-specified Spark configuration key-value pairs.
#' @param spark_env_vars An object containing a set of optional, user-specified environment variable key-value pairs.
#' @param spark_version Required. The Spark version of the cluster, e.g.
#' @param ssh_public_keys SSH public key contents that will be added to each Spark node in this cluster.
#' @param workload_type This field has no description yet.
#'
#'
#' @rdname create_cluster
#' @alias clustersCreate
#' @export
create_cluster <- function(client, spark_version, apply_policy_default_values = NULL,
  autoscale = NULL, autotermination_minutes = NULL, aws_attributes = NULL, azure_attributes = NULL,
  cluster_log_conf = NULL, cluster_name = NULL, cluster_source = NULL, custom_tags = NULL,
  data_security_mode = NULL, docker_image = NULL, driver_instance_pool_id = NULL,
  driver_node_type_id = NULL, enable_elastic_disk = NULL, enable_local_disk_encryption = NULL,
  gcp_attributes = NULL, init_scripts = NULL, instance_pool_id = NULL, node_type_id = NULL,
  num_workers = NULL, policy_id = NULL, runtime_engine = NULL, single_user_name = NULL,
  spark_conf = NULL, spark_env_vars = NULL, ssh_public_keys = NULL, workload_type = NULL) {
  body <- list(apply_policy_default_values = apply_policy_default_values, autoscale = autoscale,
    autotermination_minutes = autotermination_minutes, aws_attributes = aws_attributes,
    azure_attributes = azure_attributes, cluster_log_conf = cluster_log_conf,
    cluster_name = cluster_name, cluster_source = cluster_source, custom_tags = custom_tags,
    data_security_mode = data_security_mode, docker_image = docker_image, driver_instance_pool_id = driver_instance_pool_id,
    driver_node_type_id = driver_node_type_id, enable_elastic_disk = enable_elastic_disk,
    enable_local_disk_encryption = enable_local_disk_encryption, gcp_attributes = gcp_attributes,
    init_scripts = init_scripts, instance_pool_id = instance_pool_id, node_type_id = node_type_id,
    num_workers = num_workers, policy_id = policy_id, runtime_engine = runtime_engine,
    single_user_name = single_user_name, spark_conf = spark_conf, spark_env_vars = spark_env_vars,
    spark_version = spark_version, ssh_public_keys = ssh_public_keys, workload_type = workload_type)
  client$do("POST", "/api/2.0/clusters/create", body = body)
}

#' @rdname create_cluster
#' @export 
clustersCreate <- create_cluster
#' Terminate cluster.
#' 
#' Terminates the Spark cluster with the specified ID. The cluster is removed
#' asynchronously. Once the termination has completed, the cluster will be in a
#' `TERMINATED` state. If the cluster is already in a `TERMINATING` or
#' `TERMINATED` state, nothing will happen.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The cluster to be terminated.
#'
#'
#' @rdname delete_cluster
#' @alias clustersDelete
#' @export
delete_cluster <- function(client, cluster_id) {
  body <- list(cluster_id = cluster_id)
  client$do("POST", "/api/2.0/clusters/delete", body = body)
}

#' @rdname delete_cluster
#' @export 
clustersDelete <- delete_cluster
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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param apply_policy_default_values This field has no description yet.
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param autotermination_minutes Automatically terminates the cluster after it is inactive for this time in minutes.
#' @param aws_attributes Attributes related to clusters running on Amazon Web Services.
#' @param azure_attributes Attributes related to clusters running on Microsoft Azure.
#' @param cluster_id Required. ID of the cluser.
#' @param cluster_log_conf The configuration for delivering spark logs to a long-term storage destination.
#' @param cluster_name Cluster name requested by the user.
#' @param cluster_source Determines whether the cluster was created by a user through the UI, created by the Databricks Jobs Scheduler, or through an API request.
#' @param custom_tags Additional tags for cluster resources.
#' @param data_security_mode Data security mode decides what data governance model to use when accessing data from a cluster.
#' @param docker_image This field has no description yet.
#' @param driver_instance_pool_id The optional ID of the instance pool for the driver of the cluster belongs.
#' @param driver_node_type_id The node type of the Spark driver.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this cluster will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param enable_local_disk_encryption Whether to enable LUKS on cluster VMs' local disks.
#' @param gcp_attributes Attributes related to clusters running on Google Cloud Platform.
#' @param init_scripts The configuration for storing init scripts.
#' @param instance_pool_id The optional ID of the instance pool to which the cluster belongs.
#' @param node_type_id This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param num_workers Number of worker nodes that this cluster should have.
#' @param policy_id The ID of the cluster policy used to create the cluster if applicable.
#' @param runtime_engine Decides which runtime engine to be use, e.g.
#' @param single_user_name Single user name if data_security_mode is `SINGLE_USER`.
#' @param spark_conf An object containing a set of optional, user-specified Spark configuration key-value pairs.
#' @param spark_env_vars An object containing a set of optional, user-specified environment variable key-value pairs.
#' @param spark_version Required. The Spark version of the cluster, e.g.
#' @param ssh_public_keys SSH public key contents that will be added to each Spark node in this cluster.
#' @param workload_type This field has no description yet.
#'
#'
#' @rdname edit_cluster
#' @alias clustersEdit
#' @export
edit_cluster <- function(client, cluster_id, spark_version, apply_policy_default_values = NULL,
  autoscale = NULL, autotermination_minutes = NULL, aws_attributes = NULL, azure_attributes = NULL,
  cluster_log_conf = NULL, cluster_name = NULL, cluster_source = NULL, custom_tags = NULL,
  data_security_mode = NULL, docker_image = NULL, driver_instance_pool_id = NULL,
  driver_node_type_id = NULL, enable_elastic_disk = NULL, enable_local_disk_encryption = NULL,
  gcp_attributes = NULL, init_scripts = NULL, instance_pool_id = NULL, node_type_id = NULL,
  num_workers = NULL, policy_id = NULL, runtime_engine = NULL, single_user_name = NULL,
  spark_conf = NULL, spark_env_vars = NULL, ssh_public_keys = NULL, workload_type = NULL) {
  body <- list(apply_policy_default_values = apply_policy_default_values, autoscale = autoscale,
    autotermination_minutes = autotermination_minutes, aws_attributes = aws_attributes,
    azure_attributes = azure_attributes, cluster_id = cluster_id, cluster_log_conf = cluster_log_conf,
    cluster_name = cluster_name, cluster_source = cluster_source, custom_tags = custom_tags,
    data_security_mode = data_security_mode, docker_image = docker_image, driver_instance_pool_id = driver_instance_pool_id,
    driver_node_type_id = driver_node_type_id, enable_elastic_disk = enable_elastic_disk,
    enable_local_disk_encryption = enable_local_disk_encryption, gcp_attributes = gcp_attributes,
    init_scripts = init_scripts, instance_pool_id = instance_pool_id, node_type_id = node_type_id,
    num_workers = num_workers, policy_id = policy_id, runtime_engine = runtime_engine,
    single_user_name = single_user_name, spark_conf = spark_conf, spark_env_vars = spark_env_vars,
    spark_version = spark_version, ssh_public_keys = ssh_public_keys, workload_type = workload_type)
  client$do("POST", "/api/2.0/clusters/edit", body = body)
}

#' @rdname edit_cluster
#' @export 
clustersEdit <- edit_cluster
#' List cluster activity events.
#' 
#' Retrieves a list of events about the activity of a cluster. This API is
#' paginated. If there are more events to read, the response includes all the
#' nparameters necessary to request the next page of events.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The ID of the cluster to retrieve events about.
#' @param end_time The end time in epoch milliseconds.
#' @param event_types An optional set of event types to filter on.
#' @param limit The maximum number of events to include in a page of events.
#' @param offset The offset in the result set.
#' @param order The order to list events in; either 'ASC' or 'DESC'.
#' @param start_time The start time in epoch milliseconds.
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname events_cluster
#' @alias clustersEvents
#' @export
events_cluster <- function(client, cluster_id, end_time = NULL, event_types = NULL,
  limit = NULL, offset = NULL, order = NULL, start_time = NULL) {
  body <- list(cluster_id = cluster_id, end_time = end_time, event_types = event_types,
    limit = limit, offset = offset, order = order, start_time = start_time)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("POST", "/api/2.0/clusters/events", body = body)
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
  return(results)

}

#' @rdname events_cluster
#' @export 
clustersEvents <- events_cluster
#' Get cluster info.
#' 
#' Retrieves the information for a cluster given its identifier. Clusters can be
#' described while they are running, or up to 60 days after they are terminated.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The cluster about which to retrieve information.
#'
#'
#' @rdname get_cluster
#' @alias clustersGet
#' @export
get_cluster <- function(client, cluster_id) {
  query <- list(cluster_id = cluster_id)
  client$do("GET", "/api/2.0/clusters/get", query = query)
}

#' @rdname get_cluster
#' @export 
clustersGet <- get_cluster
#' Get cluster permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The cluster for which to get or manage permissions.
#'
#'
#' @rdname get_cluster_permission_levels
#' @alias clustersGetPermissionLevels
#' @export
get_cluster_permission_levels <- function(client, cluster_id) {

  client$do("GET", paste("/api/2.0/permissions/clusters/", cluster_id, "/permissionLevels",
    , sep = ""))
}

#' @rdname get_cluster_permission_levels
#' @export 
clustersGetPermissionLevels <- get_cluster_permission_levels
#' Get cluster permissions.
#' 
#' Gets the permissions of a cluster. Clusters can inherit permissions from
#' their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The cluster for which to get or manage permissions.
#'
#'
#' @rdname get_cluster_permissions
#' @alias clustersGetPermissions
#' @export
get_cluster_permissions <- function(client, cluster_id) {

  client$do("GET", paste("/api/2.0/permissions/clusters/", cluster_id, sep = ""))
}

#' @rdname get_cluster_permissions
#' @export 
clustersGetPermissions <- get_cluster_permissions
#' List all clusters.
#' 
#' Return information about all pinned clusters, active clusters, up to 200 of
#' the most recently terminated all-purpose clusters in the past 30 days, and up
#' to 30 of the most recently terminated job clusters in the past 30 days.
#' 
#' For example, if there is 1 pinned cluster, 4 active clusters, 45 terminated
#' all-purpose clusters in the past 30 days, and 50 terminated job clusters in
#' the past 30 days, then this API returns the 1 pinned cluster, 4 active
#' clusters, all 45 terminated all-purpose clusters, and the 30 most recently
#' terminated job clusters.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param can_use_client Filter clusters based on what type of client it can be used for.
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname list_clusters
#' @alias clustersList
#' @export
list_clusters <- function(client, can_use_client = NULL) {
  query <- list(can_use_client = can_use_client)

  json <- client$do("GET", "/api/2.0/clusters/list", query = query)
  return(json$clusters)

}

#' @rdname list_clusters
#' @export 
clustersList <- list_clusters
#' List node types.
#' 
#' Returns a list of supported Spark node types. These node types can be used to
#' launch a cluster.
#' @param client Required. Instance of DatabricksClient()
#'
#'
#' @rdname list_cluster_node_types
#' @alias clustersListNodeTypes
#' @export
list_cluster_node_types <- function(client) {
  client$do("GET", "/api/2.0/clusters/list-node-types")
}

#' @rdname list_cluster_node_types
#' @export 
clustersListNodeTypes <- list_cluster_node_types
#' List availability zones.
#' 
#' Returns a list of availability zones where clusters can be created in (For
#' example, us-west-2a). These zones can be used to launch a cluster.
#' @param client Required. Instance of DatabricksClient()
#'
#'
#' @rdname list_cluster_zones
#' @alias clustersListZones
#' @export
list_cluster_zones <- function(client) {
  client$do("GET", "/api/2.0/clusters/list-zones")
}

#' @rdname list_cluster_zones
#' @export 
clustersListZones <- list_cluster_zones
#' Permanently delete cluster.
#' 
#' Permanently deletes a Spark cluster. This cluster is terminated and resources
#' are asynchronously removed.
#' 
#' In addition, users will no longer see permanently deleted clusters in the
#' cluster list, and API users can no longer perform any action on permanently
#' deleted clusters.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The cluster to be deleted.
#'
#'
#' @rdname permanent_cluster_delete
#' @alias clustersPermanentDelete
#' @export
permanent_cluster_delete <- function(client, cluster_id) {
  body <- list(cluster_id = cluster_id)
  client$do("POST", "/api/2.0/clusters/permanent-delete", body = body)
}

#' @rdname permanent_cluster_delete
#' @export 
clustersPermanentDelete <- permanent_cluster_delete
#' Pin cluster.
#' 
#' Pinning a cluster ensures that the cluster will always be returned by the
#' ListClusters API. Pinning a cluster that is already pinned will have no
#' effect. This API can only be called by workspace admins.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. needs content added.
#'
#'
#' @rdname pin_cluster
#' @alias clustersPin
#' @export
pin_cluster <- function(client, cluster_id) {
  body <- list(cluster_id = cluster_id)
  client$do("POST", "/api/2.0/clusters/pin", body = body)
}

#' @rdname pin_cluster
#' @export 
clustersPin <- pin_cluster
#' Resize cluster.
#' 
#' Resizes a cluster to have a desired number of workers. This will fail unless
#' the cluster is in a `RUNNING` state.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param cluster_id Required. The cluster to be resized.
#' @param num_workers Number of worker nodes that this cluster should have.
#'
#'
#' @rdname resize_cluster
#' @alias clustersResize
#' @export
resize_cluster <- function(client, cluster_id, autoscale = NULL, num_workers = NULL) {
  body <- list(autoscale = autoscale, cluster_id = cluster_id, num_workers = num_workers)
  client$do("POST", "/api/2.0/clusters/resize", body = body)
}

#' @rdname resize_cluster
#' @export 
clustersResize <- resize_cluster
#' Restart cluster.
#' 
#' Restarts a Spark cluster with the supplied ID. If the cluster is not
#' currently in a `RUNNING` state, nothing will happen.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The cluster to be started.
#' @param restart_user needs content added.
#'
#'
#' @rdname restart_cluster
#' @alias clustersRestart
#' @export
restart_cluster <- function(client, cluster_id, restart_user = NULL) {
  body <- list(cluster_id = cluster_id, restart_user = restart_user)
  client$do("POST", "/api/2.0/clusters/restart", body = body)
}

#' @rdname restart_cluster
#' @export 
clustersRestart <- restart_cluster
#' Set cluster permissions.
#' 
#' Sets permissions on a cluster. Clusters can inherit permissions from their
#' root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param cluster_id Required. The cluster for which to get or manage permissions.
#'
#'
#' @rdname set_cluster_permissions
#' @alias clustersSetPermissions
#' @export
set_cluster_permissions <- function(client, cluster_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/clusters/", cluster_id, sep = ""),
    body = body)
}

#' @rdname set_cluster_permissions
#' @export 
clustersSetPermissions <- set_cluster_permissions
#' List available Spark versions.
#' 
#' Returns the list of available Spark versions. These versions can be used to
#' launch a cluster.
#' @param client Required. Instance of DatabricksClient()
#'
#'
#' @rdname spark_cluster_versions
#' @alias clustersSparkVersions
#' @export
spark_cluster_versions <- function(client) {
  client$do("GET", "/api/2.0/clusters/spark-versions")
}

#' @rdname spark_cluster_versions
#' @export 
clustersSparkVersions <- spark_cluster_versions
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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. The cluster to be started.
#'
#'
#' @rdname start_cluster
#' @alias clustersStart
#' @export
start_cluster <- function(client, cluster_id) {
  body <- list(cluster_id = cluster_id)
  client$do("POST", "/api/2.0/clusters/start", body = body)
}

#' @rdname start_cluster
#' @export 
clustersStart <- start_cluster
#' Unpin cluster.
#' 
#' Unpinning a cluster will allow the cluster to eventually be removed from the
#' ListClusters API. Unpinning a cluster that is not pinned will have no effect.
#' This API can only be called by workspace admins.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_id Required. needs content added.
#'
#'
#' @rdname unpin_cluster
#' @alias clustersUnpin
#' @export
unpin_cluster <- function(client, cluster_id) {
  body <- list(cluster_id = cluster_id)
  client$do("POST", "/api/2.0/clusters/unpin", body = body)
}

#' @rdname unpin_cluster
#' @export 
clustersUnpin <- unpin_cluster
#' Update cluster permissions.
#' 
#' Updates the permissions on a cluster. Clusters can inherit permissions from
#' their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param cluster_id Required. The cluster for which to get or manage permissions.
#'
#'
#' @rdname update_cluster_permissions
#' @alias clustersUpdatePermissions
#' @export
update_cluster_permissions <- function(client, cluster_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/clusters/", cluster_id, sep = ""),
    body = body)
}

#' @rdname update_cluster_permissions
#' @export 
clustersUpdatePermissions <- update_cluster_permissions

#' Create new cluster.
#' 
#' Creates a new Spark cluster. This method will acquire new instances from the
#' cloud provider if necessary. Note: Databricks may not be able to acquire some
#' of the requested nodes, due to cloud provider limitations (account limits,
#' spot price, etc.) or transient network issues.
#' 
#' If Databricks acquires at least 85% of the requested on-demand nodes, cluster
#' creation will succeed. Otherwise the cluster will terminate with an
#' informative error message.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Clusters on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Clusters is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param apply_policy_default_values This field has no description yet.
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param autotermination_minutes Automatically terminates the cluster after it is inactive for this time in minutes.
#' @param aws_attributes Attributes related to clusters running on Amazon Web Services.
#' @param azure_attributes Attributes related to clusters running on Microsoft Azure.
#' @param cluster_log_conf The configuration for delivering spark logs to a long-term storage destination.
#' @param cluster_name Cluster name requested by the user.
#' @param cluster_source Determines whether the cluster was created by a user through the UI, created by the Databricks Jobs Scheduler, or through an API request.
#' @param custom_tags Additional tags for cluster resources.
#' @param data_security_mode Data security mode decides what data governance model to use when accessing data from a cluster.
#' @param docker_image This field has no description yet.
#' @param driver_instance_pool_id The optional ID of the instance pool for the driver of the cluster belongs.
#' @param driver_node_type_id The node type of the Spark driver.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this cluster will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param enable_local_disk_encryption Whether to enable LUKS on cluster VMs' local disks.
#' @param gcp_attributes Attributes related to clusters running on Google Cloud Platform.
#' @param init_scripts The configuration for storing init scripts.
#' @param instance_pool_id The optional ID of the instance pool to which the cluster belongs.
#' @param node_type_id This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param num_workers Number of worker nodes that this cluster should have.
#' @param policy_id The ID of the cluster policy used to create the cluster if applicable.
#' @param runtime_engine Decides which runtime engine to be use, e.g.
#' @param single_user_name Single user name if data_security_mode is `SINGLE_USER`.
#' @param spark_conf An object containing a set of optional, user-specified Spark configuration key-value pairs.
#' @param spark_env_vars An object containing a set of optional, user-specified environment variable key-value pairs.
#' @param spark_version Required. The Spark version of the cluster, e.g.
#' @param ssh_public_keys SSH public key contents that will be added to each Spark node in this cluster.
#' @param workload_type This field has no description yet.
#'
#' @rdname create_cluster_and_wait
#' @export
create_cluster_and_wait <- function(client, spark_version, apply_policy_default_values = NULL,
  autoscale = NULL, autotermination_minutes = NULL, aws_attributes = NULL, azure_attributes = NULL,
  cluster_log_conf = NULL, cluster_name = NULL, cluster_source = NULL, custom_tags = NULL,
  data_security_mode = NULL, docker_image = NULL, driver_instance_pool_id = NULL,
  driver_node_type_id = NULL, enable_elastic_disk = NULL, enable_local_disk_encryption = NULL,
  gcp_attributes = NULL, init_scripts = NULL, instance_pool_id = NULL, node_type_id = NULL,
  num_workers = NULL, policy_id = NULL, runtime_engine = NULL, single_user_name = NULL,
  spark_conf = NULL, spark_env_vars = NULL, ssh_public_keys = NULL, workload_type = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(apply_policy_default_values = apply_policy_default_values, autoscale = autoscale,
    autotermination_minutes = autotermination_minutes, aws_attributes = aws_attributes,
    azure_attributes = azure_attributes, cluster_log_conf = cluster_log_conf,
    cluster_name = cluster_name, cluster_source = cluster_source, custom_tags = custom_tags,
    data_security_mode = data_security_mode, docker_image = docker_image, driver_instance_pool_id = driver_instance_pool_id,
    driver_node_type_id = driver_node_type_id, enable_elastic_disk = enable_elastic_disk,
    enable_local_disk_encryption = enable_local_disk_encryption, gcp_attributes = gcp_attributes,
    init_scripts = init_scripts, instance_pool_id = instance_pool_id, node_type_id = node_type_id,
    num_workers = num_workers, policy_id = policy_id, runtime_engine = runtime_engine,
    single_user_name = single_user_name, spark_conf = spark_conf, spark_env_vars = spark_env_vars,
    spark_version = spark_version, ssh_public_keys = ssh_public_keys, workload_type = workload_type)
  op_response <- client$do("POST", "/api/2.0/clusters/create", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("ERROR", "TERMINATED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- clustersGet(client, cluster_id = op_response$cluster_id)
    status <- poll$state
    status_message <- poll$state_message
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
    prefix <- paste0("databricks::clustersGet(cluster_id=", op_response$cluster_id,
      ")")
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

#' Terminate cluster.
#' 
#' Terminates the Spark cluster with the specified ID. The cluster is removed
#' asynchronously. Once the termination has completed, the cluster will be in a
#' `TERMINATED` state. If the cluster is already in a `TERMINATING` or
#' `TERMINATED` state, nothing will happen.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Clusters on Databricks reach
#' TERMINATED state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Clusters is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param cluster_id Required. The cluster to be terminated.
#'
#' @rdname delete_cluster_and_wait
#' @export
delete_cluster_and_wait <- function(client, cluster_id, timeout = 20, callback = cli_reporter) {
  body <- list(cluster_id = cluster_id)
  op_response <- client$do("POST", "/api/2.0/clusters/delete", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("TERMINATED", c())
  failure_states <- c("ERROR", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- clustersGet(client, cluster_id = cluster_id)
    status <- poll$state
    status_message <- poll$state_message
    if (status %in% target_states) {
      if (!is.null(callback)) {
        callback(paste0(status, ": ", status_message), done = TRUE)
      }
      return(poll)
    }
    if (status %in% failure_states) {
      msg <- paste("failed to reach TERMINATED, got ", status, "-", status_message)
      rlang::abort(msg, call = rlang::caller_env())
    }
    prefix <- paste0("databricks::clustersGet(cluster_id=", cluster_id, ")")
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
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Clusters on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Clusters is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param apply_policy_default_values This field has no description yet.
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param autotermination_minutes Automatically terminates the cluster after it is inactive for this time in minutes.
#' @param aws_attributes Attributes related to clusters running on Amazon Web Services.
#' @param azure_attributes Attributes related to clusters running on Microsoft Azure.
#' @param cluster_id Required. ID of the cluser.
#' @param cluster_log_conf The configuration for delivering spark logs to a long-term storage destination.
#' @param cluster_name Cluster name requested by the user.
#' @param cluster_source Determines whether the cluster was created by a user through the UI, created by the Databricks Jobs Scheduler, or through an API request.
#' @param custom_tags Additional tags for cluster resources.
#' @param data_security_mode Data security mode decides what data governance model to use when accessing data from a cluster.
#' @param docker_image This field has no description yet.
#' @param driver_instance_pool_id The optional ID of the instance pool for the driver of the cluster belongs.
#' @param driver_node_type_id The node type of the Spark driver.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this cluster will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param enable_local_disk_encryption Whether to enable LUKS on cluster VMs' local disks.
#' @param gcp_attributes Attributes related to clusters running on Google Cloud Platform.
#' @param init_scripts The configuration for storing init scripts.
#' @param instance_pool_id The optional ID of the instance pool to which the cluster belongs.
#' @param node_type_id This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param num_workers Number of worker nodes that this cluster should have.
#' @param policy_id The ID of the cluster policy used to create the cluster if applicable.
#' @param runtime_engine Decides which runtime engine to be use, e.g.
#' @param single_user_name Single user name if data_security_mode is `SINGLE_USER`.
#' @param spark_conf An object containing a set of optional, user-specified Spark configuration key-value pairs.
#' @param spark_env_vars An object containing a set of optional, user-specified environment variable key-value pairs.
#' @param spark_version Required. The Spark version of the cluster, e.g.
#' @param ssh_public_keys SSH public key contents that will be added to each Spark node in this cluster.
#' @param workload_type This field has no description yet.
#'
#' @rdname edit_cluster_and_wait
#' @export
edit_cluster_and_wait <- function(client, cluster_id, spark_version, apply_policy_default_values = NULL,
  autoscale = NULL, autotermination_minutes = NULL, aws_attributes = NULL, azure_attributes = NULL,
  cluster_log_conf = NULL, cluster_name = NULL, cluster_source = NULL, custom_tags = NULL,
  data_security_mode = NULL, docker_image = NULL, driver_instance_pool_id = NULL,
  driver_node_type_id = NULL, enable_elastic_disk = NULL, enable_local_disk_encryption = NULL,
  gcp_attributes = NULL, init_scripts = NULL, instance_pool_id = NULL, node_type_id = NULL,
  num_workers = NULL, policy_id = NULL, runtime_engine = NULL, single_user_name = NULL,
  spark_conf = NULL, spark_env_vars = NULL, ssh_public_keys = NULL, workload_type = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(apply_policy_default_values = apply_policy_default_values, autoscale = autoscale,
    autotermination_minutes = autotermination_minutes, aws_attributes = aws_attributes,
    azure_attributes = azure_attributes, cluster_id = cluster_id, cluster_log_conf = cluster_log_conf,
    cluster_name = cluster_name, cluster_source = cluster_source, custom_tags = custom_tags,
    data_security_mode = data_security_mode, docker_image = docker_image, driver_instance_pool_id = driver_instance_pool_id,
    driver_node_type_id = driver_node_type_id, enable_elastic_disk = enable_elastic_disk,
    enable_local_disk_encryption = enable_local_disk_encryption, gcp_attributes = gcp_attributes,
    init_scripts = init_scripts, instance_pool_id = instance_pool_id, node_type_id = node_type_id,
    num_workers = num_workers, policy_id = policy_id, runtime_engine = runtime_engine,
    single_user_name = single_user_name, spark_conf = spark_conf, spark_env_vars = spark_env_vars,
    spark_version = spark_version, ssh_public_keys = ssh_public_keys, workload_type = workload_type)
  op_response <- client$do("POST", "/api/2.0/clusters/edit", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("ERROR", "TERMINATED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- clustersGet(client, cluster_id = cluster_id)
    status <- poll$state
    status_message <- poll$state_message
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
    prefix <- paste0("databricks::clustersGet(cluster_id=", cluster_id, ")")
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










#' Resize cluster.
#' 
#' Resizes a cluster to have a desired number of workers. This will fail unless
#' the cluster is in a `RUNNING` state.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Clusters on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Clusters is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param autoscale Parameters needed in order to automatically scale clusters up and down based on load.
#' @param cluster_id Required. The cluster to be resized.
#' @param num_workers Number of worker nodes that this cluster should have.
#'
#' @rdname resize_cluster_and_wait
#' @export
resize_cluster_and_wait <- function(client, cluster_id, autoscale = NULL, num_workers = NULL,
  timeout = 20, callback = cli_reporter) {
  body <- list(autoscale = autoscale, cluster_id = cluster_id, num_workers = num_workers)
  op_response <- client$do("POST", "/api/2.0/clusters/resize", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("ERROR", "TERMINATED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- clustersGet(client, cluster_id = cluster_id)
    status <- poll$state
    status_message <- poll$state_message
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
    prefix <- paste0("databricks::clustersGet(cluster_id=", cluster_id, ")")
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

#' Restart cluster.
#' 
#' Restarts a Spark cluster with the supplied ID. If the cluster is not
#' currently in a `RUNNING` state, nothing will happen.
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Clusters on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Clusters is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param cluster_id Required. The cluster to be started.
#' @param restart_user needs content added.
#'
#' @rdname restart_cluster_and_wait
#' @export
restart_cluster_and_wait <- function(client, cluster_id, restart_user = NULL, timeout = 20,
  callback = cli_reporter) {
  body <- list(cluster_id = cluster_id, restart_user = restart_user)
  op_response <- client$do("POST", "/api/2.0/clusters/restart", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("ERROR", "TERMINATED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- clustersGet(client, cluster_id = cluster_id)
    status <- poll$state
    status_message <- poll$state_message
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
    prefix <- paste0("databricks::clustersGet(cluster_id=", cluster_id, ")")
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
#' @param client Required. Instance of DatabricksClient()

#'
#' @description
#' This is a long-running operation, which blocks until Clusters on Databricks reach
#' RUNNING state with the timeout of 20 minutes, that you can change via `timeout` parameter.
#' By default, the state of Databricks Clusters is reported to console. You can change this behavior
#' by changing the `callback` parameter.
#' @param timeout Time to wait for the operation to complete in minutes.
#' @param callback Function to report the status of the operation. By default, it reports to console.
#'
#' @param cluster_id Required. The cluster to be started.
#'
#' @rdname start_cluster_and_wait
#' @export
start_cluster_and_wait <- function(client, cluster_id, timeout = 20, callback = cli_reporter) {
  body <- list(cluster_id = cluster_id)
  op_response <- client$do("POST", "/api/2.0/clusters/start", body = body)
  started <- as.numeric(Sys.time())
  target_states <- c("RUNNING", c())
  failure_states <- c("ERROR", "TERMINATED", c())
  status_message <- "polling..."
  attempt <- 1
  while ((started + (timeout * 60)) > as.numeric(Sys.time())) {
    poll <- clustersGet(client, cluster_id = cluster_id)
    status <- poll$state
    status_message <- poll$state_message
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
    prefix <- paste0("databricks::clustersGet(cluster_id=", cluster_id, ")")
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



