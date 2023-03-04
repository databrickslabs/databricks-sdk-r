# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Instance Pools API are used to create, edit, delete and list instance pools
#' by using ready-to-use cloud instances which reduces a cluster start and
#' auto-scaling times.
#' 
#' Databricks pools reduce cluster start and auto-scaling times by maintaining a
#' set of idle, ready-to-use instances. When a cluster is attached to a pool,
#' cluster nodes are created using the pool’s idle instances. If the pool has
#' no idle instances, the pool expands by allocating a new instance from the
#' instance provider in order to accommodate the cluster’s request. When a
#' cluster releases an instance, it returns to the pool and is free for another
#' cluster to use. Only clusters attached to a pool can use that pool’s idle
#' instances.
#' 
#' You can specify a different pool for the driver node and worker nodes, or use
#' the same pool for both.
#' 
#' Databricks does not charge DBUs while instances are idle in the pool.
#' Instance provider billing does apply. See pricing.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=instance_pools_create]{create} \tab Create a new instance pool.\cr
#'  \link[=instance_pools_delete]{delete} \tab Delete an instance pool.\cr
#'  \link[=instance_pools_edit]{edit} \tab Edit an existing instance pool.\cr
#'  \link[=instance_pools_get]{get} \tab Get instance pool information.\cr
#'  \link[=instance_pools_list]{list} \tab List instance pool info.\cr
#' }
#'
#' @rdname instance_pools
#' @export
instance_pools <- list()

#' Create a new instance pool.
#' 
#' Creates a new instance pool using idle and ready-to-use cloud instances.
#'
#' @param aws_attributes Attributes related to pool running on Amazon Web Services.
#' @param azure_attributes Attributes related to pool running on Azure.
#' @param custom_tags Additional tags for pool resources.
#' @param disk_spec Defines the specification of the disks that will be attached to all spark containers.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this instances in this pool will dynamically acquire additional disk space when its Spark workers are running low on disk space.
#' @param idle_instance_autotermination_minutes Automatically terminates the extra instances in the pool cache after they are inactive for this time in minutes if min_idle_instances requirement is already met.
#' @param instance_pool_fleet_attributes The fleet related setting to power the instance pool.
#' @param instance_pool_name Required. Pool name requested by the user.
#' @param max_capacity Maximum number of outstanding instances to keep in the pool, including both instances used by clusters and idle instances.
#' @param min_idle_instances Minimum number of idle instances to keep in the instance pool.
#' @param node_type_id Required. This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param preloaded_docker_images Custom Docker Image BYOC.
#' @param preloaded_spark_versions A list of preloaded Spark image versions for the pool.
#'
#' @keywords internal
#'
#' @rdname instance_pools_create
#'
#' @aliases instance_pools_create
instance_pools_create <- function(instance_pool_name, node_type_id, aws_attributes = NULL,
  azure_attributes = NULL, custom_tags = NULL, disk_spec = NULL, enable_elastic_disk = NULL,
  idle_instance_autotermination_minutes = NULL, instance_pool_fleet_attributes = NULL,
  max_capacity = NULL, min_idle_instances = NULL, preloaded_docker_images = NULL,
  preloaded_spark_versions = NULL) {
  body <- list(aws_attributes = aws_attributes, azure_attributes = azure_attributes,
    custom_tags = custom_tags, disk_spec = disk_spec, enable_elastic_disk = enable_elastic_disk,
    idle_instance_autotermination_minutes = idle_instance_autotermination_minutes,
    instance_pool_fleet_attributes = instance_pool_fleet_attributes, instance_pool_name = instance_pool_name,
    max_capacity = max_capacity, min_idle_instances = min_idle_instances, node_type_id = node_type_id,
    preloaded_docker_images = preloaded_docker_images, preloaded_spark_versions = preloaded_spark_versions)
  .api$do("POST", "/api/2.0/instance-pools/create", body = body)
}
instance_pools$create <- instance_pools_create

#' Delete an instance pool.
#' 
#' Deletes the instance pool permanently. The idle instances in the pool are
#' terminated asynchronously.
#'
#' @param instance_pool_id Required. The instance pool to be terminated.
#'
#' @keywords internal
#'
#' @rdname instance_pools_delete
#'
#' @aliases instance_pools_delete
instance_pools_delete <- function(instance_pool_id) {
  body <- list(instance_pool_id = instance_pool_id)
  .api$do("POST", "/api/2.0/instance-pools/delete", body = body)
}
instance_pools$delete <- instance_pools_delete

#' Edit an existing instance pool.
#' 
#' Modifies the configuration of an existing instance pool.
#'
#' @param aws_attributes Attributes related to pool running on Amazon Web Services.
#' @param azure_attributes Attributes related to pool running on Azure.
#' @param custom_tags Additional tags for pool resources.
#' @param disk_spec Defines the specification of the disks that will be attached to all spark containers.
#' @param enable_elastic_disk Autoscaling Local Storage: when enabled, this instances in this pool will dynamically acquire additional disk space when its Spark workers are running low on disk space.
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
#' @keywords internal
#'
#' @rdname instance_pools_edit
#'
#' @aliases instance_pools_edit
instance_pools_edit <- function(instance_pool_id, instance_pool_name, node_type_id,
  aws_attributes = NULL, azure_attributes = NULL, custom_tags = NULL, disk_spec = NULL,
  enable_elastic_disk = NULL, idle_instance_autotermination_minutes = NULL, instance_pool_fleet_attributes = NULL,
  max_capacity = NULL, min_idle_instances = NULL, preloaded_docker_images = NULL,
  preloaded_spark_versions = NULL) {
  body <- list(aws_attributes = aws_attributes, azure_attributes = azure_attributes,
    custom_tags = custom_tags, disk_spec = disk_spec, enable_elastic_disk = enable_elastic_disk,
    idle_instance_autotermination_minutes = idle_instance_autotermination_minutes,
    instance_pool_fleet_attributes = instance_pool_fleet_attributes, instance_pool_id = instance_pool_id,
    instance_pool_name = instance_pool_name, max_capacity = max_capacity, min_idle_instances = min_idle_instances,
    node_type_id = node_type_id, preloaded_docker_images = preloaded_docker_images,
    preloaded_spark_versions = preloaded_spark_versions)
  .api$do("POST", "/api/2.0/instance-pools/edit", body = body)
}
instance_pools$edit <- instance_pools_edit

#' Get instance pool information.
#' 
#' Retrieve the information for an instance pool based on its identifier.
#'
#' @param instance_pool_id Required. The canonical unique identifier for the instance pool.
#'
#' @keywords internal
#'
#' @rdname instance_pools_get
#'
#' @aliases instance_pools_get
instance_pools_get <- function(instance_pool_id) {
  query <- list(instance_pool_id = instance_pool_id)
  .api$do("GET", "/api/2.0/instance-pools/get", query = query)
}
instance_pools$get <- instance_pools_get

#' List instance pool info.
#' 
#' Gets a list of instance pools with their statistics.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname instance_pools_list
#'
#' @aliases instance_pools_list
instance_pools_list <- function() {

  json <- .api$do("GET", "/api/2.0/instance-pools/list")
  return(json$instance_pools)

}
instance_pools$list <- instance_pools_list

