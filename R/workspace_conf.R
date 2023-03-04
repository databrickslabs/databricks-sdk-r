# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' This API allows updating known workspace settings for advanced users.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=workspace_conf_get_status]{get_status} \tab Check configuration status.\cr
#'  \link[=workspace_conf_set_status]{set_status} \tab Enable/disable features.\cr
#' }
#'
#' @rdname workspace_conf
#' @export
workspace_conf <- list()

#' Check configuration status.
#' 
#' Gets the configuration status for a workspace.
#'
#' @param keys [required] 
#'
#' @keywords internal
#'
#' @rdname workspace_conf_get_status
#'
#' @aliases workspace_conf_get_status
workspace_conf_get_status <- function(keys, ...) {
    query <- list(
        keys = keys, ...)
    
    .api$do("GET", "/api/2.0/workspace-conf", query = query)
}
workspace_conf$get_status <- workspace_conf_get_status

#' Enable/disable features.
#' 
#' Sets the configuration status for a workspace, including enabling or
#' disabling it.
#'
#'
#' @keywords internal
#'
#' @rdname workspace_conf_set_status
#'
#' @aliases workspace_conf_set_status
workspace_conf_set_status <- function(...) {
    
    
    .api$do("PATCH", "/api/2.0/workspace-conf")
}
workspace_conf$set_status <- workspace_conf_set_status













