# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' A metastore is the top-level container of objects in Unity Catalog. It stores
#' data assets (tables and views) and the permissions that govern access to
#' them. Databricks account admins can create metastores and assign them to
#' Databricks workspaces to control which workloads use each metastore. For a
#' workspace to use Unity Catalog, it must have a Unity Catalog metastore
#' attached.
#' 
#' Each metastore is configured with a root storage location in a cloud storage
#' account. This storage location is used for metadata and managed tables data.
#' 
#' NOTE: This metastore is distinct from the metastore included in Databricks
#' workspaces created before Unity Catalog was released. If your workspace
#' includes a legacy Hive metastore, the data in that metastore is available in
#' a catalog named hive_metastore.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=metastores_assign]{assign} \tab Create an assignment.\cr
#'  \link[=metastores_create]{create} \tab Create a metastore.\cr
#'  \link[=metastores_current]{current} \tab Get metastore assignment for workspace.\cr
#'  \link[=metastores_delete]{delete} \tab Delete a metastore.\cr
#'  \link[=metastores_get]{get} \tab Get a metastore.\cr
#'  \link[=metastores_list]{list} \tab List metastores.\cr
#'  \link[=metastores_summary]{summary} \tab Get a metastore summary.\cr
#'  \link[=metastores_unassign]{unassign} \tab Delete an assignment.\cr
#'  \link[=metastores_update]{update} \tab Update a metastore.\cr
#'  \link[=metastores_update_assignment]{update_assignment} \tab Update an assignment.\cr
#' }
#'
#' @rdname metastores
#' @export
metastores <- list()

#' Create an assignment.
#' 
#' Creates a new metastore assignment. If an assignment for the same
#' __workspace_id__ exists, it will be overwritten by the new __metastore_id__
#' and __default_catalog_name__. The caller must be an account admin.
#'
#' @param default_catalog_name Required. The name of the default catalog in the metastore.
#' @param metastore_id Required. The unique ID of the metastore.
#' @param workspace_id Required. Workspace ID.
#'
#' @keywords internal
#'
#' @rdname metastores_assign
#'
#' @aliases metastores_assign
metastores_assign <- function(metastore_id, default_catalog_name, workspace_id, ...) {
  body <- list(default_catalog_name = default_catalog_name, metastore_id = metastore_id,
    ...)

  .api$do("PUT", paste("/api/2.1/unity-catalog/workspaces/", workspace_id, "/metastore",
    , sep = ""), body = body)
}
metastores$assign <- metastores_assign

#' Create a metastore.
#' 
#' Creates a new metastore based on a provided name and storage root path.
#'
#' @param name Required. The user-specified name of the metastore.
#' @param region Cloud region which the metastore serves (e.g., `us-west-2`, `westus`).
#' @param storage_root Required. The storage root URL for metastore.
#'
#' @keywords internal
#'
#' @rdname metastores_create
#'
#' @aliases metastores_create
metastores_create <- function(name, storage_root, region = NULL, ...) {
  body <- list(name = name, region = region, storage_root = storage_root, ...)

  .api$do("POST", "/api/2.1/unity-catalog/metastores", body = body)
}
metastores$create <- metastores_create

#' Get metastore assignment for workspace.
#' 
#' Gets the metastore assignment for the workspace being accessed.#'
#' @keywords internal
#'
#' @rdname metastores_current
#'
#' @aliases metastores_current
metastores_current <- function(...) {

  .api$do("GET", "/api/2.1/unity-catalog/current-metastore-assignment")
}
metastores$current <- metastores_current

#' Delete a metastore.
#' 
#' Deletes a metastore. The caller must be a metastore admin.
#'
#' @param force Force deletion even if the metastore is not empty.
#' @param id Required. Unique ID of the metastore.
#'
#' @keywords internal
#'
#' @rdname metastores_delete
#'
#' @aliases metastores_delete
metastores_delete <- function(id, force = NULL, ...) {
  query <- list(force = force, ...)

  .api$do("DELETE", paste("/api/2.1/unity-catalog/metastores/", id, sep = ""),
    query = query)
}
metastores$delete <- metastores_delete

#' Get a metastore.
#' 
#' Gets a metastore that matches the supplied ID. The caller must be a metastore
#' admin to retrieve this info.
#'
#' @param id Required. Unique ID of the metastore.
#'
#' @keywords internal
#'
#' @rdname metastores_get
#'
#' @aliases metastores_get
metastores_get <- function(id, ...) {


  .api$do("GET", paste("/api/2.1/unity-catalog/metastores/", id, sep = ""))
}
metastores$get <- metastores_get

#' List metastores.
#' 
#' Gets an array of the available metastores (as __MetastoreInfo__ objects). The
#' caller must be an admin to retrieve this info. There is no guarantee of a
#' specific ordering of the elements in the array.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname metastores_list
#'
#' @aliases metastores_list
metastores_list <- function(...) {


  json <- .api$do("GET", "/api/2.1/unity-catalog/metastores")
  return(json$metastores)

}
metastores$list <- metastores_list

#' Get a metastore summary.
#' 
#' Gets information about a metastore. This summary includes the storage
#' credential, the cloud vendor, the cloud region, and the global metastore ID.#'
#' @keywords internal
#'
#' @rdname metastores_summary
#'
#' @aliases metastores_summary
metastores_summary <- function(...) {

  .api$do("GET", "/api/2.1/unity-catalog/metastore_summary")
}
metastores$summary <- metastores_summary

#' Delete an assignment.
#' 
#' Deletes a metastore assignment. The caller must be an account administrator.
#'
#' @param metastore_id Required. Query for the ID of the metastore to delete.
#' @param workspace_id Required. A workspace ID.
#'
#' @keywords internal
#'
#' @rdname metastores_unassign
#'
#' @aliases metastores_unassign
metastores_unassign <- function(workspace_id, metastore_id, ...) {
  query <- list(metastore_id = metastore_id, ...)

  .api$do("DELETE", paste("/api/2.1/unity-catalog/workspaces/", workspace_id, "/metastore",
    , sep = ""), query = query)
}
metastores$unassign <- metastores_unassign

#' Update a metastore.
#' 
#' Updates information for a specific metastore. The caller must be a metastore
#' admin.
#'
#' @param delta_sharing_organization_name The organization name of a Delta Sharing entity, to be used in Databricks-to-Databricks Delta Sharing as the official name.
#' @param delta_sharing_recipient_token_lifetime_in_seconds The lifetime of delta sharing recipient token in seconds.
#' @param delta_sharing_scope The scope of Delta Sharing enabled for the metastore.
#' @param id Required. Unique ID of the metastore.
#' @param metastore_id Required. Databricks Unity Catalog metastore ID.
#' @param name The user-specified name of the metastore.
#' @param owner The owner of the metastore.
#' @param privilege_model_version Privilege model version of the metastore, of the form `major.minor` (e.g., `1.0`).
#' @param storage_root_credential_id UUID of storage credential to access the metastore storage_root.
#'
#' @keywords internal
#'
#' @rdname metastores_update
#'
#' @aliases metastores_update
metastores_update <- function(metastore_id, id, delta_sharing_organization_name = NULL,
  delta_sharing_recipient_token_lifetime_in_seconds = NULL, delta_sharing_scope = NULL,
  name = NULL, owner = NULL, privilege_model_version = NULL, storage_root_credential_id = NULL,
  ...) {
  body <- list(delta_sharing_organization_name = delta_sharing_organization_name,
    delta_sharing_recipient_token_lifetime_in_seconds = delta_sharing_recipient_token_lifetime_in_seconds,
    delta_sharing_scope = delta_sharing_scope, name = name, owner = owner, privilege_model_version = privilege_model_version,
    storage_root_credential_id = storage_root_credential_id, ...)

  .api$do("PATCH", paste("/api/2.1/unity-catalog/metastores/", id, sep = ""), body = body)
}
metastores$update <- metastores_update

#' Update an assignment.
#' 
#' Updates a metastore assignment. This operation can be used to update
#' __metastore_id__ or __default_catalog_name__ for a specified Workspace, if
#' the Workspace is already assigned a metastore. The caller must be an account
#' admin to update __metastore_id__; otherwise, the caller can be a Workspace
#' admin.
#'
#' @param default_catalog_name The name of the default catalog for the metastore.
#' @param metastore_id The unique ID of the metastore.
#' @param workspace_id Required. Workspace ID.
#'
#' @keywords internal
#'
#' @rdname metastores_update_assignment
#'
#' @aliases metastores_update_assignment
metastores_update_assignment <- function(workspace_id, metastore_id, default_catalog_name = NULL,
  ...) {
  body <- list(default_catalog_name = default_catalog_name, metastore_id = metastore_id,
    ...)

  .api$do("PATCH", paste("/api/2.1/unity-catalog/workspaces/", workspace_id, "/metastore",
    , sep = ""), body = body)
}
metastores$update_assignment <- metastores_update_assignment

