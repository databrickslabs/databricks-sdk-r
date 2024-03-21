# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a new instance pool.
#' 
#' Creates a new instance pool using idle and ready-to-use cloud instances.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param aws_attributes Attributes related to instance pools running on Amazon Web Services.
#' @param azure_attributes Attributes related to instance pools running on Azure.
#' @param custom_tags Additional tags for pool resources.
#' @param disk_spec Defines the specification of the disks that will be attached to all spark containers.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this instances in this pool will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param gcp_attributes Attributes related to instance pools running on Google Cloud Platform.
#' @param idle_instance_autotermination_minutes Automatically terminates the extra instances in the pool cache after they are inactive for this time in minutes if min_idle_instances requirement is already met.
#' @param instance_pool_fleet_attributes The fleet related setting to power the instance pool.
#' @param instance_pool_name Required. Pool name requested by the user.
#' @param max_capacity Maximum number of outstanding instances to keep in the pool, including both instances used by clusters and idle instances.
#' @param min_idle_instances Minimum number of idle instances to keep in the instance pool.
#' @param node_type_id Required. This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param preloaded_docker_images Custom Docker Image BYOC.
#' @param preloaded_spark_versions A list of preloaded Spark image versions for the pool.
#'
#' @rdname instancePoolsCreate
#' @export
instancePoolsCreate <- function(client, instance_pool_name, node_type_id, aws_attributes = NULL,
  azure_attributes = NULL, custom_tags = NULL, disk_spec = NULL, enable_elastic_disk = NULL,
  gcp_attributes = NULL, idle_instance_autotermination_minutes = NULL, instance_pool_fleet_attributes = NULL,
  max_capacity = NULL, min_idle_instances = NULL, preloaded_docker_images = NULL,
  preloaded_spark_versions = NULL) {
  body <- list(aws_attributes = aws_attributes, azure_attributes = azure_attributes,
    custom_tags = custom_tags, disk_spec = disk_spec, enable_elastic_disk = enable_elastic_disk,
    gcp_attributes = gcp_attributes, idle_instance_autotermination_minutes = idle_instance_autotermination_minutes,
    instance_pool_fleet_attributes = instance_pool_fleet_attributes, instance_pool_name = instance_pool_name,
    max_capacity = max_capacity, min_idle_instances = min_idle_instances, node_type_id = node_type_id,
    preloaded_docker_images = preloaded_docker_images, preloaded_spark_versions = preloaded_spark_versions)
  client$do("POST", "/api/2.0/instance-pools/create", body = body)
}

#' Delete an instance pool.
#' 
#' Deletes the instance pool permanently. The idle instances in the pool are
#' terminated asynchronously.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The instance pool to be terminated.
#'
#' @rdname instancePoolsDelete
#' @export
instancePoolsDelete <- function(client, instance_pool_id) {
  body <- list(instance_pool_id = instance_pool_id)
  client$do("POST", "/api/2.0/instance-pools/delete", body = body)
}

#' Edit an existing instance pool.
#' 
#' Modifies the configuration of an existing instance pool.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param aws_attributes Attributes related to instance pools running on Amazon Web Services.
#' @param azure_attributes Attributes related to instance pools running on Azure.
#' @param custom_tags Additional tags for pool resources.
#' @param disk_spec Defines the specification of the disks that will be attached to all spark containers.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this instances in this pool will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param gcp_attributes Attributes related to instance pools running on Google Cloud Platform.
#' @param idle_instance_autotermination_minutes Automatically terminates the extra instances in the pool cache after they are inactive for this time in minutes if min_idle_instances requirement is already met.
#' @param instance_pool_fleet_attributes The fleet related setting to power the instance pool.
#' @param instance_pool_id Required. Instance pool ID.
#' @param instance_pool_name Required. Pool name requested by the user.
#' @param max_capacity Maximum number of outstanding instances to keep in the pool, including both instances used by clusters and idle instances.
#' @param min_idle_instances Minimum number of idle instances to keep in the instance pool.
#' @param node_type_id Required. This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param preloaded_docker_images Custom Docker Image BYOC.
#' @param preloaded_spark_versions A list of preloaded Spark image versions for the pool.
#'
#' @rdname instancePoolsEdit
#' @export
instancePoolsEdit <- function(client, instance_pool_id, instance_pool_name, node_type_id,
  aws_attributes = NULL, azure_attributes = NULL, custom_tags = NULL, disk_spec = NULL,
  enable_elastic_disk = NULL, gcp_attributes = NULL, idle_instance_autotermination_minutes = NULL,
  instance_pool_fleet_attributes = NULL, max_capacity = NULL, min_idle_instances = NULL,
  preloaded_docker_images = NULL, preloaded_spark_versions = NULL) {
  body <- list(aws_attributes = aws_attributes, azure_attributes = azure_attributes,
    custom_tags = custom_tags, disk_spec = disk_spec, enable_elastic_disk = enable_elastic_disk,
    gcp_attributes = gcp_attributes, idle_instance_autotermination_minutes = idle_instance_autotermination_minutes,
    instance_pool_fleet_attributes = instance_pool_fleet_attributes, instance_pool_id = instance_pool_id,
    instance_pool_name = instance_pool_name, max_capacity = max_capacity, min_idle_instances = min_idle_instances,
    node_type_id = node_type_id, preloaded_docker_images = preloaded_docker_images,
    preloaded_spark_versions = preloaded_spark_versions)
  client$do("POST", "/api/2.0/instance-pools/edit", body = body)
}

#' Get instance pool information.
#' 
#' Retrieve the information for an instance pool based on its identifier.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The canonical unique identifier for the instance pool.
#'
#' @rdname instancePoolsGet
#' @export
instancePoolsGet <- function(client, instance_pool_id) {
  query <- list(instance_pool_id = instance_pool_id)
  client$do("GET", "/api/2.0/instance-pools/get", query = query)
}

#' Get instance pool permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' @rdname instancePoolsGetInstancePoolPermissionLevels
#' @export
instancePoolsGetInstancePoolPermissionLevels <- function(client, instance_pool_id) {

  client$do("GET", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    "/permissionLevels", , sep = ""))
}

#' Get instance pool permissions.
#' 
#' Gets the permissions of an instance pool. Instance pools can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' @rdname instancePoolsGetInstancePoolPermissions
#' @export
instancePoolsGetInstancePoolPermissions <- function(client, instance_pool_id) {

  client$do("GET", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    sep = ""))
}

#' List instance pool info.
#' 
#' Gets a list of instance pools with their statistics.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname instancePoolsList
#' @export
instancePoolsList <- function(client) {

  json <- client$do("GET", "/api/2.0/instance-pools/list")
  return(json$instance_pools)

}

#' Set instance pool permissions.
#' 
#' Sets permissions on an instance pool. Instance pools can inherit permissions
#' from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' @rdname instancePoolsSetInstancePoolPermissions
#' @export
instancePoolsSetInstancePoolPermissions <- function(client, instance_pool_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    sep = ""), body = body)
}

#' Update instance pool permissions.
#' 
#' Updates the permissions on an instance pool. Instance pools can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' @rdname instancePoolsUpdateInstancePoolPermissions
#' @export
instancePoolsUpdateInstancePoolPermissions <- function(client, instance_pool_id,
  access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    sep = ""), body = body)
}

