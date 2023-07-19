# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get catalog workspace bindings.
#' 
#' Gets workspace bindings of the catalog. The caller must be a metastore admin
#' or an owner of the catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the catalog.
#'
#' @rdname workspaceBindingsGet
#' @export
workspaceBindingsGet <- function(client, name) {
    
    client$do("GET", paste("/api/2.1/unity-catalog/workspace-bindings/catalogs/", name, sep = ""))
}

#' Update catalog workspace bindings.
#' 
#' Updates workspace bindings of the catalog. The caller must be a metastore
#' admin or an owner of the catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param assign_workspaces A list of workspace IDs.
#' @param name Required. The name of the catalog.
#' @param unassign_workspaces A list of workspace IDs.
#'
#' @rdname workspaceBindingsUpdate
#' @export
workspaceBindingsUpdate <- function(client, name, assign_workspaces=NULL, unassign_workspaces=NULL) {
    body <- list(
        assign_workspaces = assign_workspaces
        , unassign_workspaces = unassign_workspaces)
    client$do("PATCH", paste("/api/2.1/unity-catalog/workspace-bindings/catalogs/", name, sep = ""), body = body)
}

