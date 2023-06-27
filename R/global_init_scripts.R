# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' The Global Init Scripts API enables Workspace administrators to configure
#' global initialization scripts for their workspace. These scripts run on every
#' node in every cluster in the workspace.
#' 
#' **Important:** Existing clusters must be restarted to pick up any changes
#' made to global init scripts. Global init scripts are run in order. If the
#' init script returns with a bad exit code, the Apache Spark container fails to
#' launch and init scripts with later position are skipped. If enough containers
#' fail, the entire cluster fails with a `GLOBAL_INIT_SCRIPT_FAILURE` error
#' code.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=global_init_scripts_create]{create} \tab Create init script.\cr
#'  \link[=global_init_scripts_delete]{delete} \tab Delete init script.\cr
#'  \link[=global_init_scripts_get]{get} \tab Get an init script.\cr
#'  \link[=global_init_scripts_list]{list} \tab Get init scripts.\cr
#'  \link[=global_init_scripts_update]{update} \tab Update init script.\cr
#' }
#'
#' @rdname global_init_scripts
#' @export
global_init_scripts <- list()

#' Create init script.
#' 
#' Creates a new global init script in this workspace.
#'
#' @param enabled Specifies whether the script is enabled.
#' @param name Required. The name of the script.
#' @param position The position of a global init script, where 0 represents the first script to run, 1 is the second script to run, in ascending order.
#' @param script Required. The Base64-encoded content of the script.
#'
#' @keywords internal
#'
#' @rdname global_init_scripts_create
#'
#' @aliases global_init_scripts_create
global_init_scripts_create <- function(name, script, enabled = NULL, position = NULL) {
  body <- list(enabled = enabled, name = name, position = position, script = script)
  .state$api$do("POST", "/api/2.0/global-init-scripts", body = body)
}
global_init_scripts$create <- global_init_scripts_create

#' Delete init script.
#' 
#' Deletes a global init script.
#'
#' @param script_id Required. The ID of the global init script.
#'
#' @keywords internal
#'
#' @rdname global_init_scripts_delete
#'
#' @aliases global_init_scripts_delete
global_init_scripts_delete <- function(script_id) {

  .state$api$do("DELETE", paste("/api/2.0/global-init-scripts/", script_id, sep = ""))
}
global_init_scripts$delete <- global_init_scripts_delete

#' Get an init script.
#' 
#' Gets all the details of a script, including its Base64-encoded contents.
#'
#' @param script_id Required. The ID of the global init script.
#'
#' @keywords internal
#'
#' @rdname global_init_scripts_get
#'
#' @aliases global_init_scripts_get
global_init_scripts_get <- function(script_id) {

  .state$api$do("GET", paste("/api/2.0/global-init-scripts/", script_id, sep = ""))
}
global_init_scripts$get <- global_init_scripts_get

#' Get init scripts.
#' 
#' Get a list of all global init scripts for this workspace. This returns all
#' properties for each script but **not** the script contents. To retrieve the
#' contents of a script, use the [get a global init
#' script](#operation/get-script) operation.#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname global_init_scripts_list
#'
#' @aliases global_init_scripts_list
global_init_scripts_list <- function() {

  json <- .state$api$do("GET", "/api/2.0/global-init-scripts")
  return(json$scripts)

}
global_init_scripts$list <- global_init_scripts_list

#' Update init script.
#' 
#' Updates a global init script, specifying only the fields to change. All
#' fields are optional. Unspecified fields retain their current value.
#'
#' @param enabled Specifies whether the script is enabled.
#' @param name Required. The name of the script.
#' @param position The position of a script, where 0 represents the first script to run, 1 is the second script to run, in ascending order.
#' @param script Required. The Base64-encoded content of the script.
#' @param script_id Required. The ID of the global init script.
#'
#' @keywords internal
#'
#' @rdname global_init_scripts_update
#'
#' @aliases global_init_scripts_update
global_init_scripts_update <- function(name, script, script_id, enabled = NULL, position = NULL) {
  body <- list(enabled = enabled, name = name, position = position, script = script)
  .state$api$do("PATCH", paste("/api/2.0/global-init-scripts/", script_id, sep = ""),
    body = body)
}
global_init_scripts$update <- global_init_scripts_update

