# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Cluster policy limits the ability to configure clusters based on a set of
#' rules. The policy rules limit the attributes or attribute values available
#' for cluster creation. Cluster policies have ACLs that limit their use to
#' specific users and groups.
#' 
#' Cluster policies let you limit users to create clusters with prescribed
#' settings, simplify the user interface and enable more users to create their
#' own clusters (by fixing and hiding some values), control cost by limiting per
#' cluster maximum cost (by setting limits on attributes whose values contribute
#' to hourly price).
#' 
#' Cluster policy permissions limit which policies a user can select in the
#' Policy drop-down when the user creates a cluster: - A user who has cluster
#' create permission can select the Unrestricted policy and create
#' fully-configurable clusters. - A user who has both cluster create permission
#' and access to cluster policies can select the Unrestricted policy and
#' policies they have access to. - A user that has access to only cluster
#' policies, can select the policies they have access to.
#' 
#' If no policies have been created in the workspace, the Policy drop-down does
#' not display.
#' 
#' Only admin users can create, edit, and delete policies. Admin users also have
#' access to all policies.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=cluster_policies_create]{create} \tab Create a new policy.\cr
#'  \link[=cluster_policies_delete]{delete} \tab Delete a cluster policy.\cr
#'  \link[=cluster_policies_edit]{edit} \tab Update a cluster policy.\cr
#'  \link[=cluster_policies_get]{get} \tab Get entity.\cr
#'  \link[=cluster_policies_list]{list} \tab Get a cluster policy.\cr
#' }
#'
#' @rdname cluster_policies
#' @export
cluster_policies <- list()

#' Create a new policy.
#' 
#' Creates a new policy with prescribed settings.
#'
#' @param definition Policy definition document expressed in Databricks Cluster Policy Definition Language.
#' @param description Additional human-readable description of the cluster policy.
#' @param max_clusters_per_user Max number of clusters per user that can be active using this policy.
#' @param name [required] Cluster Policy name requested by the user.
#' @param policy_family_definition_overrides Policy definition JSON document expressed in Databricks Policy Definition Language.
#' @param policy_family_id ID of the policy family.
#'
#' @keywords internal
#'
#' @rdname cluster_policies_create
#'
#' @aliases cluster_policies_create
cluster_policies_create <- function(name, definition = NULL, 
    description = NULL, 
    max_clusters_per_user = NULL, 
    policy_family_definition_overrides = NULL, 
    policy_family_id = NULL, 
    ...) {
    body <- list(
        definition = definition, 
        description = description, 
        max_clusters_per_user = max_clusters_per_user, 
        name = name, 
        policy_family_definition_overrides = policy_family_definition_overrides, 
        policy_family_id = policy_family_id, ...)
    
    .api$do("POST", "/api/2.0/policies/clusters/create", body = body)
}
cluster_policies$create <- cluster_policies_create

#' Delete a cluster policy.
#' 
#' Delete a policy for a cluster. Clusters governed by this policy can still
#' run, but cannot be edited.
#'
#' @param policy_id [required] The ID of the policy to delete.
#'
#' @keywords internal
#'
#' @rdname cluster_policies_delete
#'
#' @aliases cluster_policies_delete
cluster_policies_delete <- function(policy_id, ...) {
    body <- list(
        policy_id = policy_id, ...)
    
    .api$do("POST", "/api/2.0/policies/clusters/delete", body = body)
}
cluster_policies$delete <- cluster_policies_delete

#' Update a cluster policy.
#' 
#' Update an existing policy for cluster. This operation may make some clusters
#' governed by the previous policy invalid.
#'
#' @param definition Policy definition document expressed in Databricks Cluster Policy Definition Language.
#' @param description Additional human-readable description of the cluster policy.
#' @param max_clusters_per_user Max number of clusters per user that can be active using this policy.
#' @param name [required] Cluster Policy name requested by the user.
#' @param policy_family_definition_overrides Policy definition JSON document expressed in Databricks Policy Definition Language.
#' @param policy_family_id ID of the policy family.
#' @param policy_id [required] The ID of the policy to update.
#'
#' @keywords internal
#'
#' @rdname cluster_policies_edit
#'
#' @aliases cluster_policies_edit
cluster_policies_edit <- function(policy_id, name, definition = NULL, 
    description = NULL, 
    max_clusters_per_user = NULL, 
    policy_family_definition_overrides = NULL, 
    policy_family_id = NULL, 
    ...) {
    body <- list(
        definition = definition, 
        description = description, 
        max_clusters_per_user = max_clusters_per_user, 
        name = name, 
        policy_family_definition_overrides = policy_family_definition_overrides, 
        policy_family_id = policy_family_id, 
        policy_id = policy_id, ...)
    
    .api$do("POST", "/api/2.0/policies/clusters/edit", body = body)
}
cluster_policies$edit <- cluster_policies_edit

#' Get entity.
#' 
#' Get a cluster policy entity. Creation and editing is available to admins
#' only.
#'
#' @param policy_id [required] Canonical unique identifier for the cluster policy.
#'
#' @keywords internal
#'
#' @rdname cluster_policies_get
#'
#' @aliases cluster_policies_get
cluster_policies_get <- function(policy_id, ...) {
    query <- list(
        policy_id = policy_id, ...)
    
    .api$do("GET", "/api/2.0/policies/clusters/get", query = query)
}
cluster_policies$get <- cluster_policies_get

#' Get a cluster policy.
#' 
#' Returns a list of policies accessible by the requesting user.
#'
#' @param sort_column The cluster policy attribute to sort by.
#' @param sort_order The order in which the policies get listed.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname cluster_policies_list
#'
#' @aliases cluster_policies_list
cluster_policies_list <- function(sort_column = NULL, 
    sort_order = NULL, 
    ...) {
    query <- list(
        sort_column = sort_column, 
        sort_order = sort_order, ...)
    
    
    json <- .api$do("GET", "/api/2.0/policies/clusters/list", query = query)
    return (json$policies)
    
}
cluster_policies$list <- cluster_policies_list













