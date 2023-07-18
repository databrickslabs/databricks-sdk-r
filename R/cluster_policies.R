# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a new policy.
#' 
#' Creates a new policy with prescribed settings.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param definition Policy definition document expressed in Databricks Cluster Policy Definition Language.
#' @param description Additional human-readable description of the cluster policy.
#' @param max_clusters_per_user Max number of clusters per user that can be active using this policy.
#' @param name Required. Cluster Policy name requested by the user.
#' @param policy_family_definition_overrides Policy definition JSON document expressed in Databricks Policy Definition Language.
#' @param policy_family_id ID of the policy family.
#'
#' @rdname clusterPoliciesCreate
clusterPoliciesCreate <- function(client, name, definition = NULL, description = NULL,
  max_clusters_per_user = NULL, policy_family_definition_overrides = NULL, policy_family_id = NULL) {
  body <- list(definition = definition, description = description, max_clusters_per_user = max_clusters_per_user,
    name = name, policy_family_definition_overrides = policy_family_definition_overrides,
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
#' @param definition Policy definition document expressed in Databricks Cluster Policy Definition Language.
#' @param description Additional human-readable description of the cluster policy.
#' @param max_clusters_per_user Max number of clusters per user that can be active using this policy.
#' @param name Required. Cluster Policy name requested by the user.
#' @param policy_family_definition_overrides Policy definition JSON document expressed in Databricks Policy Definition Language.
#' @param policy_family_id ID of the policy family.
#' @param policy_id Required. The ID of the policy to update.
#'
#' @rdname clusterPoliciesEdit
clusterPoliciesEdit <- function(client, policy_id, name, definition = NULL, description = NULL,
  max_clusters_per_user = NULL, policy_family_definition_overrides = NULL, policy_family_id = NULL) {
  body <- list(definition = definition, description = description, max_clusters_per_user = max_clusters_per_user,
    name = name, policy_family_definition_overrides = policy_family_definition_overrides,
    policy_family_id = policy_family_id, policy_id = policy_id)
  client$do("POST", "/api/2.0/policies/clusters/edit", body = body)
}

#' Get entity.
#' 
#' Get a cluster policy entity. Creation and editing is available to admins
#' only.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param policy_id Required. Canonical unique identifier for the cluster policy.
#'
#' @rdname clusterPoliciesGet
clusterPoliciesGet <- function(client, policy_id) {
  query <- list(policy_id = policy_id)
  client$do("GET", "/api/2.0/policies/clusters/get", query = query)
}

#' Get a cluster policy.
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
clusterPoliciesList <- function(client, sort_column = NULL, sort_order = NULL) {
  query <- list(sort_column = sort_column, sort_order = sort_order)

  json <- client$do("GET", "/api/2.0/policies/clusters/list", query = query)
  return(json$policies)

}

