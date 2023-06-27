# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' A catalog in Databricks can be configured as __OPEN__ or __ISOLATED__. An
#' __OPEN__ catalog can be accessed from any workspace, while an __ISOLATED__
#' catalog can only be access from a configured list of workspaces.
#' 
#' A catalog's workspace bindings can be configured by a metastore admin or the
#' owner of the catalog.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=workspace_bindings_get]{get} \tab Get catalog workspace bindings.\cr
#'  \link[=workspace_bindings_update]{update} \tab Update catalog workspace bindings.\cr
#' }
#'
#' @rdname workspace_bindings
#' @export
workspace_bindings <- list()

#' Get catalog workspace bindings.
#' 
#' Gets workspace bindings of the catalog. The caller must be a metastore admin
#' or an owner of the catalog.
#'
#' @param name Required. The name of the catalog.
#'
#' @keywords internal
#'
#' @rdname workspace_bindings_get
#'
#' @aliases workspace_bindings_get
workspace_bindings_get <- function(name) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/workspace-bindings/catalogs/",
    name, sep = ""))
}
workspace_bindings$get <- workspace_bindings_get

#' Update catalog workspace bindings.
#' 
#' Updates workspace bindings of the catalog. The caller must be a metastore
#' admin or an owner of the catalog.
#'
#' @param assign_workspaces A list of workspace IDs.
#' @param name Required. The name of the catalog.
#' @param unassign_workspaces A list of workspace IDs.
#'
#' @keywords internal
#'
#' @rdname workspace_bindings_update
#'
#' @aliases workspace_bindings_update
workspace_bindings_update <- function(name, assign_workspaces = NULL, unassign_workspaces = NULL) {
  body <- list(assign_workspaces = assign_workspaces, unassign_workspaces = unassign_workspaces)
  .state$api$do("PATCH", paste("/api/2.1/unity-catalog/workspace-bindings/catalogs/",
    name, sep = ""), body = body)
}
workspace_bindings$update <- workspace_bindings_update

