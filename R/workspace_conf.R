# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Check configuration status.
#' 
#' Gets the configuration status for a workspace.
#'
#' @param keys 
databricks_workspace_conf_get_status <- function(keys, ...) {
    query <- list(
        keys = keys, ...)
    
    .api$do("GET", "/api/2.0/workspace-conf", query = query)
}

#' Enable/disable features.
#' 
#' Sets the configuration status for a workspace, including enabling or
#' disabling it.
#'
databricks_workspace_conf_set_status <- function(...) {
    
    
    .api$do("PATCH", "/api/2.0/workspace-conf")
}











