# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create and deploy an application.
#' 
#' Creates and deploys an application.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param manifest Required. Manifest that specifies the application requirements.
#' @param resources Information passed at app deployment time to fulfill app dependencies.
#'
#' @rdname create_app
#' @export
create_app <- function(client, manifest, resources = NULL) {
  body <- list(manifest = manifest, resources = resources)
  client$do("POST", "/api/2.0/preview/apps/deployments", body = body)
}
#' Delete an application.
#' 
#' Delete an application definition
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of an application.
#'
#' @rdname delete_app
#' @export
delete_app <- function(client, name) {

  client$do("DELETE", paste("/api/2.0/preview/apps/instances/", name, sep = ""))
}
#' Get definition for an application.
#' 
#' Get an application definition
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of an application.
#'
#' @rdname get_app
#' @export
get_app <- function(client, name) {

  client$do("GET", paste("/api/2.0/preview/apps/instances/", name, sep = ""))
}
#' Get deployment status for an application.
#' 
#' Get deployment status for an application
#' @param client Required. Instance of DatabricksClient()
#'
#' @param deployment_id Required. The deployment id for an application.
#' @param include_app_log Boolean flag to include application logs.
#'
#' @rdname get_app_deployment_status
#' @export
get_app_deployment_status <- function(client, deployment_id, include_app_log = NULL) {
  query <- list(include_app_log = include_app_log)
  client$do("GET", paste("/api/2.0/preview/apps/deployments/", deployment_id, sep = ""),
    query = query)
}
#' List all applications.
#' 
#' List all available applications
#' @param client Required. Instance of DatabricksClient()
#'
#' @rdname get_app_apps
#' @export
get_app_apps <- function(client) {
  client$do("GET", "/api/2.0/preview/apps/instances")
}
#' Get deployment events for an application.
#' 
#' Get deployment events for an application
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of an application.
#'
#' @rdname get_app_events
#' @export
get_app_events <- function(client, name) {

  client$do("GET", paste("/api/2.0/preview/apps/", name, "/events", , sep = ""))
}






