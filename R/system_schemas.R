# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' A system schema is a schema that lives within the system catalog. A system
#' schema may contain information about customer usage of Unity Catalog such as
#' audit-logs, billing-logs, lineage information, etc.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=system_schemas_disable]{disable} \tab Disable a system schema.\cr
#'  \link[=system_schemas_enable]{enable} \tab Enable a system schema.\cr
#'  \link[=system_schemas_list]{list} \tab List system schemas.\cr
#' }
#'
#' @rdname system_schemas
#' @export
system_schemas <- list()

#' Disable a system schema.
#' 
#' Disables the system schema and removes it from the system catalog. The caller
#' must be an account admin or a metastore admin.
#'
#' @param metastore_id Required. The metastore ID under which the system schema lives.
#' @param schema_name Required. Full name of the system schema.
#'
#' @keywords internal
#'
#' @rdname system_schemas_disable
#'
#' @aliases system_schemas_disable
system_schemas_disable <- function(metastore_id, schema_name) {

  .state$api$do("DELETE", paste("/api/2.1/unity-catalog/metastores/", metastore_id,
    "/systemschemas/", schema_name, sep = ""))
}
system_schemas$disable <- system_schemas_disable

#' Enable a system schema.
#' 
#' Enables the system schema and adds it to the system catalog. The caller must
#' be an account admin or a metastore admin.#'
#' @keywords internal
#'
#' @rdname system_schemas_enable
#'
#' @aliases system_schemas_enable
system_schemas_enable <- function() {
  .state$api$do("POST", paste("/api/2.1/unity-catalog/metastores/", , "/systemschemas/",
    , sep = ""))
}
system_schemas$enable <- system_schemas_enable

#' List system schemas.
#' 
#' Gets an array of system schemas for a metastore. The caller must be an
#' account admin or a metastore admin.
#'
#' @param metastore_id Required. The ID for the metastore in which the system schema resides.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname system_schemas_list
#'
#' @aliases system_schemas_list
system_schemas_list <- function(metastore_id) {


  json <- .state$api$do("GET", paste("/api/2.1/unity-catalog/metastores/", metastore_id,
    "/systemschemas", , sep = ""))
  return(json$schemas)

}
system_schemas$list <- system_schemas_list

