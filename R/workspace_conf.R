# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Check configuration status.
#' 
#' Gets the configuration status for a workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param keys Required. 
#'
#' @rdname workspaceConfGetStatus
workspaceConfGetStatus <- function(client, keys) {
  query <- list(keys = keys)
  client$do("GET", "/api/2.0/workspace-conf", query = query)
}

#' Enable/disable features.
#' 
#' Sets the configuration status for a workspace, including enabling or
#' disabling it.
#' @param client Required. Instance of DatabricksClient()
#'
#'
#' @rdname workspaceConfSetStatus
workspaceConfSetStatus <- function(client) {

  client$do("PATCH", "/api/2.0/workspace-conf")
}

