# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create init script.
#' 
#' Creates a new global init script in this workspace.
#'
#' @param enabled Specifies whether the script is enabled.
#' @param name The name of the script.
#' @param position The position of a global init script, where 0 represents the first script to run, 1 is the second script to run, in ascending order.
#' @param script The Base64-encoded content of the script.
databricks_global_init_scripts_create <- function(name, script, enabled = NULL, 
    position = NULL, 
    ...) {
    body <- list(
        enabled = enabled, 
        name = name, 
        position = position, 
        script = script, ...)
    
    .api$do("POST", "/api/2.0/global-init-scripts", body = body)
}

#' Delete init script.
#' 
#' Deletes a global init script.
#'
#' @param script_id The ID of the global init script.
databricks_global_init_scripts_delete <- function(script_id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/global-init-scripts/", script_id, sep = ""))
}

#' Get an init script.
#' 
#' Gets all the details of a script, including its Base64-encoded contents.
#'
#' @param script_id The ID of the global init script.
databricks_global_init_scripts_get <- function(script_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/global-init-scripts/", script_id, sep = ""))
}

#' Get init scripts.
#' 
#' "Get a list of all global init scripts for this workspace. This returns all
#' properties for each script but **not** the script contents. To retrieve the
#' contents of a script, use the [get a global init
#' script](#operation/get-script) operation.
databricks_global_init_scripts_list <- function(...) {
    
    
    json <- .api$do("GET", "/api/2.0/global-init-scripts")
    return (json$scripts)
    
}

#' Update init script.
#' 
#' Updates a global init script, specifying only the fields to change. All
#' fields are optional. Unspecified fields retain their current value.
#'
#' @param enabled Specifies whether the script is enabled.
#' @param name The name of the script.
#' @param position The position of a script, where 0 represents the first script to run, 1 is the second script to run, in ascending order.
#' @param script The Base64-encoded content of the script.
#' @param script_id The ID of the global init script.
databricks_global_init_scripts_update <- function(name, script, script_id, enabled = NULL, 
    position = NULL, 
    ...) {
    body <- list(
        enabled = enabled, 
        name = name, 
        position = position, 
        script = script, ...)
    
    .api$do("PATCH", paste("/api/2.0/global-init-scripts/", script_id, sep = ""), body = body)
}













