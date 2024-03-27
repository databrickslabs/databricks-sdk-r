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
#' @param instance_pool_name Required. Pool name requested by the user.
#' @param max_capacity Maximum number of outstanding instances to keep in the pool, including both instances used by clusters and idle instances.
#' @param min_idle_instances Minimum number of idle instances to keep in the instance pool.
#' @param node_type_id Required. This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#' @param preloaded_docker_images Custom Docker Image BYOC.
#' @param preloaded_spark_versions A list containing at most one preloaded Spark image version for the pool.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_instance_pool
#' @alias instancePoolsCreate
#' @export
create_instance_pool <- function(client, instance_pool_name, node_type_id, aws_attributes = NULL,
  azure_attributes = NULL, custom_tags = NULL, disk_spec = NULL, enable_elastic_disk = NULL,
  gcp_attributes = NULL, idle_instance_autotermination_minutes = NULL, max_capacity = NULL,
  min_idle_instances = NULL, preloaded_docker_images = NULL, preloaded_spark_versions = NULL) {
  body <- list(aws_attributes = aws_attributes, azure_attributes = azure_attributes,
    custom_tags = custom_tags, disk_spec = disk_spec, enable_elastic_disk = enable_elastic_disk,
    gcp_attributes = gcp_attributes, idle_instance_autotermination_minutes = idle_instance_autotermination_minutes,
    instance_pool_name = instance_pool_name, max_capacity = max_capacity, min_idle_instances = min_idle_instances,
    node_type_id = node_type_id, preloaded_docker_images = preloaded_docker_images,
    preloaded_spark_versions = preloaded_spark_versions)
  client$do("POST", "/api/2.0/instance-pools/create", body = body)
}

#' @rdname create_instance_pool
#' @export 
instancePoolsCreate <- create_instance_pool
#' Delete an instance pool.
#' 
#' Deletes the instance pool permanently. The idle instances in the pool are
#' terminated asynchronously.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The instance pool to be terminated.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_instance_pool
#' @alias instancePoolsDelete
#' @export
delete_instance_pool <- function(client, instance_pool_id) {
  body <- list(instance_pool_id = instance_pool_id)
  client$do("POST", "/api/2.0/instance-pools/delete", body = body)
}

#' @rdname delete_instance_pool
#' @export 
instancePoolsDelete <- delete_instance_pool
#' Edit an existing instance pool.
#' 
#' Modifies the configuration of an existing instance pool.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param custom_tags Additional tags for pool resources.
#' @param idle_instance_autotermination_minutes Automatically terminates the extra instances in the pool cache after they are inactive for this time in minutes if min_idle_instances requirement is already met.
#' @param instance_pool_id Required. Instance pool ID.
#' @param instance_pool_name Required. Pool name requested by the user.
#' @param max_capacity Maximum number of outstanding instances to keep in the pool, including both instances used by clusters and idle instances.
#' @param min_idle_instances Minimum number of idle instances to keep in the instance pool.
#' @param node_type_id Required. This field encodes, through a single value, the resources available to each of the Spark nodes in this cluster.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/edit) for more 
#' information on the request and response field structure.
#'
#' @rdname edit_instance_pool
#' @alias instancePoolsEdit
#' @export
edit_instance_pool <- function(client, instance_pool_id, instance_pool_name, node_type_id,
  custom_tags = NULL, idle_instance_autotermination_minutes = NULL, max_capacity = NULL,
  min_idle_instances = NULL) {
  body <- list(custom_tags = custom_tags, idle_instance_autotermination_minutes = idle_instance_autotermination_minutes,
    instance_pool_id = instance_pool_id, instance_pool_name = instance_pool_name,
    max_capacity = max_capacity, min_idle_instances = min_idle_instances, node_type_id = node_type_id)
  client$do("POST", "/api/2.0/instance-pools/edit", body = body)
}

#' @rdname edit_instance_pool
#' @export 
instancePoolsEdit <- edit_instance_pool
#' Get instance pool information.
#' 
#' Retrieve the information for an instance pool based on its identifier.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The canonical unique identifier for the instance pool.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_instance_pool
#' @alias instancePoolsGet
#' @export
get_instance_pool <- function(client, instance_pool_id) {
  query <- list(instance_pool_id = instance_pool_id)
  client$do("GET", "/api/2.0/instance-pools/get", query = query)
}

#' @rdname get_instance_pool
#' @export 
instancePoolsGet <- get_instance_pool
#' Get instance pool permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/getpermissionlevels) for more 
#' information on the request and response field structure.
#'
#' @rdname get_instance_pool_permission_levels
#' @alias instancePoolsGetPermissionLevels
#' @export
get_instance_pool_permission_levels <- function(client, instance_pool_id) {

  client$do("GET", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    "/permissionLevels", , sep = ""))
}

#' @rdname get_instance_pool_permission_levels
#' @export 
instancePoolsGetPermissionLevels <- get_instance_pool_permission_levels
#' Get instance pool permissions.
#' 
#' Gets the permissions of an instance pool. Instance pools can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/getpermissions) for more 
#' information on the request and response field structure.
#'
#' @rdname get_instance_pool_permissions
#' @alias instancePoolsGetPermissions
#' @export
get_instance_pool_permissions <- function(client, instance_pool_id) {

  client$do("GET", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    sep = ""))
}

#' @rdname get_instance_pool_permissions
#' @export 
instancePoolsGetPermissions <- get_instance_pool_permissions
#' List instance pool info.
#' 
#' Gets a list of instance pools with their statistics.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_instance_pools
#' @alias instancePoolsList
#' @export
list_instance_pools <- function(client) {

  json <- client$do("GET", "/api/2.0/instance-pools/list")
  return(json$instance_pools)

}

#' @rdname list_instance_pools
#' @export 
instancePoolsList <- list_instance_pools
#' Set instance pool permissions.
#' 
#' Sets permissions on an instance pool. Instance pools can inherit permissions
#' from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/setpermissions) for more 
#' information on the request and response field structure.
#'
#' @rdname set_instance_pool_permissions
#' @alias instancePoolsSetPermissions
#' @export
set_instance_pool_permissions <- function(client, instance_pool_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    sep = ""), body = body)
}

#' @rdname set_instance_pool_permissions
#' @export 
instancePoolsSetPermissions <- set_instance_pool_permissions
#' Update instance pool permissions.
#' 
#' Updates the permissions on an instance pool. Instance pools can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param instance_pool_id Required. The instance pool for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/instancepools/updatepermissions) for more 
#' information on the request and response field structure.
#'
#' @rdname update_instance_pool_permissions
#' @alias instancePoolsUpdatePermissions
#' @export
update_instance_pool_permissions <- function(client, instance_pool_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/instance-pools/", instance_pool_id,
    sep = ""), body = body)
}

#' @rdname update_instance_pool_permissions
#' @export 
instancePoolsUpdatePermissions <- update_instance_pool_permissions









