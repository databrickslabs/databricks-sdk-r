# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create init script.
#' 
#' Creates a new global init script in this workspace.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param enabled Specifies whether the script is enabled.
#' @param name Required. The name of the script.
#' @param position The position of a global init script, where 0 represents the first script to run, 1 is the second script to run, in ascending order.
#' @param script Required. The Base64-encoded content of the script.
#'
#' @rdname globalInitScriptsCreate
#' @export
globalInitScriptsCreate <- function(client, name, script, enabled = NULL, position = NULL) {
  body <- list(enabled = enabled, name = name, position = position, script = script)
  client$do("POST", "/api/2.0/global-init-scripts", body = body)
}

#' Delete init script.
#' 
#' Deletes a global init script.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param script_id Required. The ID of the global init script.
#'
#' @rdname globalInitScriptsDelete
#' @export
globalInitScriptsDelete <- function(client, script_id) {

  client$do("DELETE", paste("/api/2.0/global-init-scripts/", script_id, sep = ""))
}

#' Get an init script.
#' 
#' Gets all the details of a script, including its Base64-encoded contents.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param script_id Required. The ID of the global init script.
#'
#' @rdname globalInitScriptsGet
#' @export
globalInitScriptsGet <- function(client, script_id) {

  client$do("GET", paste("/api/2.0/global-init-scripts/", script_id, sep = ""))
}

#' Get init scripts.
#' 
#' Get a list of all global init scripts for this workspace. This returns all
#' properties for each script but **not** the script contents. To retrieve the
#' contents of a script, use the [get a global init
#' script](#operation/get-script) operation.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname globalInitScriptsList
#' @export
globalInitScriptsList <- function(client) {

  json <- client$do("GET", "/api/2.0/global-init-scripts")
  return(json$scripts)

}

#' Update init script.
#' 
#' Updates a global init script, specifying only the fields to change. All
#' fields are optional. Unspecified fields retain their current value.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param enabled Specifies whether the script is enabled.
#' @param name Required. The name of the script.
#' @param position The position of a script, where 0 represents the first script to run, 1 is the second script to run, in ascending order.
#' @param script Required. The Base64-encoded content of the script.
#' @param script_id Required. The ID of the global init script.
#'
#' @rdname globalInitScriptsUpdate
#' @export
globalInitScriptsUpdate <- function(client, name, script, script_id, enabled = NULL,
  position = NULL) {
  body <- list(enabled = enabled, name = name, position = position, script = script)
  client$do("PATCH", paste("/api/2.0/global-init-scripts/", script_id, sep = ""),
    body = body)
}

