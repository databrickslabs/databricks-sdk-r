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
#' @alias appsCreate
#' @export
create_app <- function(client, manifest, resources = NULL) {
  body <- list(manifest = manifest, resources = resources)
  client$do("POST", "/api/2.0/preview/apps/deployments", body = body)
}

#' @rdname create_app
#' @export 
appsCreate <- create_app
#' Delete an application.
#' 
#' Delete an application definition
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of an application.
#'
#' @rdname delete_app
#' @alias appsDeleteApp
#' @export
delete_app <- function(client, name) {

  client$do("DELETE", paste("/api/2.0/preview/apps/instances/", name, sep = ""))
}

#' @rdname delete_app
#' @export 
appsDeleteApp <- delete_app
#' Get definition for an application.
#' 
#' Get an application definition
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of an application.
#'
#' @rdname get_app
#' @alias appsGetApp
#' @export
get_app <- function(client, name) {

  client$do("GET", paste("/api/2.0/preview/apps/instances/", name, sep = ""))
}

#' @rdname get_app
#' @export 
appsGetApp <- get_app
#' Get deployment status for an application.
#' 
#' Get deployment status for an application
#' @param client Required. Instance of DatabricksClient()
#'
#' @param deployment_id Required. The deployment id for an application.
#' @param include_app_log Boolean flag to include application logs.
#'
#' @rdname get_app_deployment_status
#' @alias appsGetAppDeploymentStatus
#' @export
get_app_deployment_status <- function(client, deployment_id, include_app_log = NULL) {
  query <- list(include_app_log = include_app_log)
  client$do("GET", paste("/api/2.0/preview/apps/deployments/", deployment_id, sep = ""),
    query = query)
}

#' @rdname get_app_deployment_status
#' @export 
appsGetAppDeploymentStatus <- get_app_deployment_status
#' List all applications.
#' 
#' List all available applications
#' @param client Required. Instance of DatabricksClient()
#'
#' @rdname get_app_apps
#' @alias appsGetApps
#' @export
get_app_apps <- function(client) {
  client$do("GET", "/api/2.0/preview/apps/instances")
}

#' @rdname get_app_apps
#' @export 
appsGetApps <- get_app_apps
#' Get deployment events for an application.
#' 
#' Get deployment events for an application
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of an application.
#'
#' @rdname get_app_events
#' @alias appsGetEvents
#' @export
get_app_events <- function(client, name) {

  client$do("GET", paste("/api/2.0/preview/apps/", name, "/events", , sep = ""))
}

#' @rdname get_app_events
#' @export 
appsGetEvents <- get_app_events






