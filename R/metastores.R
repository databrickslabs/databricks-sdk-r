# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an assignment.
#' 
#' Creates a new metastore assignment. If an assignment for the same
#' __workspace_id__ exists, it will be overwritten by the new __metastore_id__
#' and __default_catalog_name__. The caller must be an account admin.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param default_catalog_name Required. The name of the default catalog in the metastore.
#' @param metastore_id Required. The unique ID of the metastore.
#' @param workspace_id Required. A workspace ID.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/assign) for more 
#' information on the request and response field structure.
#'
#' @rdname assign_metastore
#' @alias metastoresAssign
#' @export
assign_metastore <- function(client, workspace_id, metastore_id, default_catalog_name) {
  body <- list(default_catalog_name = default_catalog_name, metastore_id = metastore_id)
  client$do("PUT", paste("/api/2.1/unity-catalog/workspaces/", workspace_id, "/metastore",
    , sep = ""), body = body)
}

#' @rdname assign_metastore
#' @export 
metastoresAssign <- assign_metastore
#' Create a metastore.
#' 
#' Creates a new metastore based on a provided name and optional storage root
#' path. By default (if the __owner__ field is not set), the owner of the new
#' metastore is the user calling the __createMetastore__ API. If the __owner__
#' field is set to the empty string (**''**), the ownership is assigned to the
#' System User instead.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The user-specified name of the metastore.
#' @param region Cloud region which the metastore serves (e.g., `us-west-2`, `westus`).
#' @param storage_root The storage root URL for metastore.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_metastore
#' @alias metastoresCreate
#' @export
create_metastore <- function(client, name, region = NULL, storage_root = NULL) {
  body <- list(name = name, region = region, storage_root = storage_root)
  client$do("POST", "/api/2.1/unity-catalog/metastores", body = body)
}

#' @rdname create_metastore
#' @export 
metastoresCreate <- create_metastore
#' Get metastore assignment for workspace.
#' 
#' Gets the metastore assignment for the workspace being accessed.
#' @param client Required. Instance of DatabricksClient()
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/current) for more 
#' information on the request and response field structure.
#'
#' @rdname current_metastore
#' @alias metastoresCurrent
#' @export
current_metastore <- function(client) {
  client$do("GET", "/api/2.1/unity-catalog/current-metastore-assignment")
}

#' @rdname current_metastore
#' @export 
metastoresCurrent <- current_metastore
#' Delete a metastore.
#' 
#' Deletes a metastore. The caller must be a metastore admin.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param force Force deletion even if the metastore is not empty.
#' @param id Required. Unique ID of the metastore.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_metastore
#' @alias metastoresDelete
#' @export
delete_metastore <- function(client, id, force = NULL) {
  query <- list(force = force)
  client$do("DELETE", paste("/api/2.1/unity-catalog/metastores/", id, sep = ""),
    query = query)
}

#' @rdname delete_metastore
#' @export 
metastoresDelete <- delete_metastore
#' Get a metastore.
#' 
#' Gets a metastore that matches the supplied ID. The caller must be a metastore
#' admin to retrieve this info.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param id Required. Unique ID of the metastore.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_metastore
#' @alias metastoresGet
#' @export
get_metastore <- function(client, id) {

  client$do("GET", paste("/api/2.1/unity-catalog/metastores/", id, sep = ""))
}

#' @rdname get_metastore
#' @export 
metastoresGet <- get_metastore
#' List metastores.
#' 
#' Gets an array of the available metastores (as __MetastoreInfo__ objects). The
#' caller must be an admin to retrieve this info. There is no guarantee of a
#' specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_metastores
#' @alias metastoresList
#' @export
list_metastores <- function(client) {

  json <- client$do("GET", "/api/2.1/unity-catalog/metastores")
  return(json$metastores)

}

#' @rdname list_metastores
#' @export 
metastoresList <- list_metastores
#' Get a metastore summary.
#' 
#' Gets information about a metastore. This summary includes the storage
#' credential, the cloud vendor, the cloud region, and the global metastore ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/summary) for more 
#' information on the request and response field structure.
#'
#' @rdname summary_metastore
#' @alias metastoresSummary
#' @export
summary_metastore <- function(client) {
  client$do("GET", "/api/2.1/unity-catalog/metastore_summary")
}

#' @rdname summary_metastore
#' @export 
metastoresSummary <- summary_metastore
#' Delete an assignment.
#' 
#' Deletes a metastore assignment. The caller must be an account administrator.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param metastore_id Required. Query for the ID of the metastore to delete.
#' @param workspace_id Required. A workspace ID.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/unassign) for more 
#' information on the request and response field structure.
#'
#' @rdname unassign_metastore
#' @alias metastoresUnassign
#' @export
unassign_metastore <- function(client, workspace_id, metastore_id) {
  query <- list(metastore_id = metastore_id)
  client$do("DELETE", paste("/api/2.1/unity-catalog/workspaces/", workspace_id,
    "/metastore", , sep = ""), query = query)
}

#' @rdname unassign_metastore
#' @export 
metastoresUnassign <- unassign_metastore
#' Update a metastore.
#' 
#' Updates information for a specific metastore. The caller must be a metastore
#' admin. If the __owner__ field is set to the empty string (**''**), the
#' ownership is updated to the System User.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param delta_sharing_organization_name The organization name of a Delta Sharing entity, to be used in Databricks-to-Databricks Delta Sharing as the official name.
#' @param delta_sharing_recipient_token_lifetime_in_seconds The lifetime of delta sharing recipient token in seconds.
#' @param delta_sharing_scope The scope of Delta Sharing enabled for the metastore.
#' @param id Required. Unique ID of the metastore.
#' @param new_name New name for the metastore.
#' @param owner The owner of the metastore.
#' @param privilege_model_version Privilege model version of the metastore, of the form `major.minor` (e.g., `1.0`).
#' @param storage_root_credential_id UUID of storage credential to access the metastore storage_root.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_metastore
#' @alias metastoresUpdate
#' @export
update_metastore <- function(client, id, delta_sharing_organization_name = NULL,
  delta_sharing_recipient_token_lifetime_in_seconds = NULL, delta_sharing_scope = NULL,
  new_name = NULL, owner = NULL, privilege_model_version = NULL, storage_root_credential_id = NULL) {
  body <- list(delta_sharing_organization_name = delta_sharing_organization_name,
    delta_sharing_recipient_token_lifetime_in_seconds = delta_sharing_recipient_token_lifetime_in_seconds,
    delta_sharing_scope = delta_sharing_scope, new_name = new_name, owner = owner,
    privilege_model_version = privilege_model_version, storage_root_credential_id = storage_root_credential_id)
  client$do("PATCH", paste("/api/2.1/unity-catalog/metastores/", id, sep = ""),
    body = body)
}

#' @rdname update_metastore
#' @export 
metastoresUpdate <- update_metastore
#' Update an assignment.
#' 
#' Updates a metastore assignment. This operation can be used to update
#' __metastore_id__ or __default_catalog_name__ for a specified Workspace, if
#' the Workspace is already assigned a metastore. The caller must be an account
#' admin to update __metastore_id__; otherwise, the caller can be a Workspace
#' admin.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param default_catalog_name The name of the default catalog for the metastore.
#' @param metastore_id The unique ID of the metastore.
#' @param workspace_id Required. A workspace ID.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/metastores/updateassignment) for more 
#' information on the request and response field structure.
#'
#' @rdname update_metastore_assignment
#' @alias metastoresUpdateAssignment
#' @export
update_metastore_assignment <- function(client, workspace_id, default_catalog_name = NULL,
  metastore_id = NULL) {
  body <- list(default_catalog_name = default_catalog_name, metastore_id = metastore_id)
  client$do("PATCH", paste("/api/2.1/unity-catalog/workspaces/", workspace_id,
    "/metastore", , sep = ""), body = body)
}

#' @rdname update_metastore_assignment
#' @export 
metastoresUpdateAssignment <- update_metastore_assignment










