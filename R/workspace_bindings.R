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
#' @rdname get_workspace_binding
#' @alias workspaceBindingsGet
#' @export
get_workspace_binding <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/workspace-bindings/catalogs/",
    name, sep = ""))
}

#' @rdname get_workspace_binding
#' @export 
workspaceBindingsGet <- get_workspace_binding
#' Get securable workspace bindings.
#' 
#' Gets workspace bindings of the securable. The caller must be a metastore
#' admin or an owner of the securable.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param securable_name Required. The name of the securable.
#' @param securable_type Required. The type of the securable.
#'
#' @rdname get_workspace_binding_bindings
#' @alias workspaceBindingsGetBindings
#' @export
get_workspace_binding_bindings <- function(client, securable_type, securable_name) {

  client$do("GET", paste("/api/2.1/unity-catalog/bindings/", securable_type, "/",
    securable_name, sep = ""))
}

#' @rdname get_workspace_binding_bindings
#' @export 
workspaceBindingsGetBindings <- get_workspace_binding_bindings
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
#' @rdname update_workspace_binding
#' @alias workspaceBindingsUpdate
#' @export
update_workspace_binding <- function(client, name, assign_workspaces = NULL, unassign_workspaces = NULL) {
  body <- list(assign_workspaces = assign_workspaces, unassign_workspaces = unassign_workspaces)
  client$do("PATCH", paste("/api/2.1/unity-catalog/workspace-bindings/catalogs/",
    name, sep = ""), body = body)
}

#' @rdname update_workspace_binding
#' @export 
workspaceBindingsUpdate <- update_workspace_binding
#' Update securable workspace bindings.
#' 
#' Updates workspace bindings of the securable. The caller must be a metastore
#' admin or an owner of the securable.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param add List of workspace bindings.
#' @param remove List of workspace bindings.
#' @param securable_name Required. The name of the securable.
#' @param securable_type Required. The type of the securable.
#'
#' @rdname update_workspace_binding_bindings
#' @alias workspaceBindingsUpdateBindings
#' @export
update_workspace_binding_bindings <- function(client, securable_type, securable_name,
  add = NULL, remove = NULL) {
  body <- list(add = add, remove = remove)
  client$do("PATCH", paste("/api/2.1/unity-catalog/bindings/", securable_type,
    "/", securable_name, sep = ""), body = body)
}

#' @rdname update_workspace_binding_bindings
#' @export 
workspaceBindingsUpdateBindings <- update_workspace_binding_bindings




