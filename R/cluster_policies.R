# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a new policy.
#' 
#' Creates a new policy with prescribed settings.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param definition Policy definition document expressed in [Databricks Cluster Policy Definition Language](https://docs.databricks.com/administration-guide/clusters/policy-definition.html).
#' @param description Additional human-readable description of the cluster policy.
#' @param libraries A list of libraries to be installed on the next cluster restart that uses this policy.
#' @param max_clusters_per_user Max number of clusters per user that can be active using this policy.
#' @param name Required. Cluster Policy name requested by the user.
#' @param policy_family_definition_overrides Policy definition JSON document expressed in [Databricks Policy Definition Language](https://docs.databricks.com/administration-guide/clusters/policy-definition.html).
#' @param policy_family_id ID of the policy family.
#'
#' @rdname clusterPoliciesCreate
#' @export
clusterPoliciesCreate <- function(client, name, definition = NULL, description = NULL,
  libraries = NULL, max_clusters_per_user = NULL, policy_family_definition_overrides = NULL,
  policy_family_id = NULL) {
  body <- list(definition = definition, description = description, libraries = libraries,
    max_clusters_per_user = max_clusters_per_user, name = name, policy_family_definition_overrides = policy_family_definition_overrides,
    policy_family_id = policy_family_id)
  client$do("POST", "/api/2.0/policies/clusters/create", body = body)
}

#' Delete a cluster policy.
#' 
#' Delete a policy for a cluster. Clusters governed by this policy can still
#' run, but cannot be edited.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param policy_id Required. The ID of the policy to delete.
#'
#' @rdname clusterPoliciesDelete
#' @export
clusterPoliciesDelete <- function(client, policy_id) {
  body <- list(policy_id = policy_id)
  client$do("POST", "/api/2.0/policies/clusters/delete", body = body)
}

#' Update a cluster policy.
#' 
#' Update an existing policy for cluster. This operation may make some clusters
#' governed by the previous policy invalid.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param definition Policy definition document expressed in [Databricks Cluster Policy Definition Language](https://docs.databricks.com/administration-guide/clusters/policy-definition.html).
#' @param description Additional human-readable description of the cluster policy.
#' @param libraries A list of libraries to be installed on the next cluster restart that uses this policy.
#' @param max_clusters_per_user Max number of clusters per user that can be active using this policy.
#' @param name Required. Cluster Policy name requested by the user.
#' @param policy_family_definition_overrides Policy definition JSON document expressed in [Databricks Policy Definition Language](https://docs.databricks.com/administration-guide/clusters/policy-definition.html).
#' @param policy_family_id ID of the policy family.
#' @param policy_id Required. The ID of the policy to update.
#'
#' @rdname clusterPoliciesEdit
#' @export
clusterPoliciesEdit <- function(client, policy_id, name, definition = NULL, description = NULL,
  libraries = NULL, max_clusters_per_user = NULL, policy_family_definition_overrides = NULL,
  policy_family_id = NULL) {
  body <- list(definition = definition, description = description, libraries = libraries,
    max_clusters_per_user = max_clusters_per_user, name = name, policy_family_definition_overrides = policy_family_definition_overrides,
    policy_family_id = policy_family_id, policy_id = policy_id)
  client$do("POST", "/api/2.0/policies/clusters/edit", body = body)
}

#' Get a cluster policy.
#' 
#' Get a cluster policy entity. Creation and editing is available to admins
#' only.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param policy_id Required. Canonical unique identifier for the cluster policy.
#'
#' @rdname clusterPoliciesGet
#' @export
clusterPoliciesGet <- function(client, policy_id) {
  query <- list(policy_id = policy_id)
  client$do("GET", "/api/2.0/policies/clusters/get", query = query)
}

#' Get cluster policy permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_policy_id Required. The cluster policy for which to get or manage permissions.
#'
#' @rdname clusterPoliciesGetPermissionLevels
#' @export
clusterPoliciesGetPermissionLevels <- function(client, cluster_policy_id) {

  client$do("GET", paste("/api/2.0/permissions/cluster-policies/", cluster_policy_id,
    "/permissionLevels", , sep = ""))
}

#' Get cluster policy permissions.
#' 
#' Gets the permissions of a cluster policy. Cluster policies can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param cluster_policy_id Required. The cluster policy for which to get or manage permissions.
#'
#' @rdname clusterPoliciesGetPermissions
#' @export
clusterPoliciesGetPermissions <- function(client, cluster_policy_id) {

  client$do("GET", paste("/api/2.0/permissions/cluster-policies/", cluster_policy_id,
    sep = ""))
}

#' List cluster policies.
#' 
#' Returns a list of policies accessible by the requesting user.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param sort_column The cluster policy attribute to sort by.
#' @param sort_order The order in which the policies get listed.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname clusterPoliciesList
#' @export
clusterPoliciesList <- function(client, sort_column = NULL, sort_order = NULL) {
  query <- list(sort_column = sort_column, sort_order = sort_order)

  json <- client$do("GET", "/api/2.0/policies/clusters/list", query = query)
  return(json$policies)

}

#' Set cluster policy permissions.
#' 
#' Sets permissions on a cluster policy. Cluster policies can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param cluster_policy_id Required. The cluster policy for which to get or manage permissions.
#'
#' @rdname clusterPoliciesSetPermissions
#' @export
clusterPoliciesSetPermissions <- function(client, cluster_policy_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/cluster-policies/", cluster_policy_id,
    sep = ""), body = body)
}

#' Update cluster policy permissions.
#' 
#' Updates the permissions on a cluster policy. Cluster policies can inherit
#' permissions from their root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list 
#' @param cluster_policy_id Required. The cluster policy for which to get or manage permissions.
#'
#' @rdname clusterPoliciesUpdatePermissions
#' @export
clusterPoliciesUpdatePermissions <- function(client, cluster_policy_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/cluster-policies/", cluster_policy_id,
    sep = ""), body = body)
}

