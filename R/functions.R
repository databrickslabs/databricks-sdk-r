# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Functions implement User-Defined Functions (UDFs) in Unity Catalog.
#' 
#' The function implementation can be any SQL expression or Query, and it can be
#' invoked wherever a table reference is allowed in a query. In Unity Catalog, a
#' function resides at the same level as a table, so it can be referenced with
#' the form __catalog_name__.__schema_name__.__function_name__.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=functions_create]{create} \tab Create a function.\cr
#'  \link[=functions_delete]{delete} \tab Delete a function.\cr
#'  \link[=functions_get]{get} \tab Get a function.\cr
#'  \link[=functions_list]{list} \tab List functions.\cr
#'  \link[=functions_update]{update} \tab Update a function.\cr
#' }
#'
#' @rdname functions
#' @export
functions <- list()

#' Create a function.
#' 
#' Creates a new function
#' 
#' The user must have the following permissions in order for the function to be
#' created: - **USE_CATALOG** on the function's parent catalog - **USE_SCHEMA**
#' and **CREATE_FUNCTION** on the function's parent schema
#'
#' @param catalog_name Required. Name of parent catalog.
#' @param comment User-provided free-form text description.
#' @param data_type Required. Scalar function return data type.
#' @param external_language External function language.
#' @param external_name External function name.
#' @param full_data_type Required. Pretty printed function data type.
#' @param input_params Required. The array of __FunctionParameterInfo__ definitions of the function's parameters.
#' @param is_deterministic Required. Whether the function is deterministic.
#' @param is_null_call Required. Function null call.
#' @param name Required. Name of function, relative to parent schema.
#' @param parameter_style Required. Function parameter style.
#' @param properties A map of key-value properties attached to the securable.
#' @param return_params Required. Table function return parameters.
#' @param routine_body Required. Function language.
#' @param routine_definition Required. Function body.
#' @param routine_dependencies Required. Function dependencies.
#' @param schema_name Required. Name of parent schema relative to its parent catalog.
#' @param security_type Required. Function security type.
#' @param specific_name Required. Specific name of the function; Reserved for future use.
#' @param sql_data_access Required. Function SQL data access.
#' @param sql_path List of schemes whose objects can be referenced without qualification.
#'
#' @keywords internal
#'
#' @rdname functions_create
#'
#' @aliases functions_create
functions_create <- function(name, catalog_name, schema_name, input_params, data_type,
  full_data_type, return_params, routine_body, routine_definition, routine_dependencies,
  parameter_style, is_deterministic, sql_data_access, is_null_call, security_type,
  specific_name, comment = NULL, external_language = NULL, external_name = NULL,
  properties = NULL, sql_path = NULL) {
  body <- list(catalog_name = catalog_name, comment = comment, data_type = data_type,
    external_language = external_language, external_name = external_name, full_data_type = full_data_type,
    input_params = input_params, is_deterministic = is_deterministic, is_null_call = is_null_call,
    name = name, parameter_style = parameter_style, properties = properties,
    return_params = return_params, routine_body = routine_body, routine_definition = routine_definition,
    routine_dependencies = routine_dependencies, schema_name = schema_name, security_type = security_type,
    specific_name = specific_name, sql_data_access = sql_data_access, sql_path = sql_path)
  .state$api$do("POST", "/api/2.1/unity-catalog/functions", body = body)
}
functions$create <- functions_create

#' Delete a function.
#' 
#' Deletes the function that matches the supplied name. For the deletion to
#' succeed, the user must satisfy one of the following conditions: - Is the
#' owner of the function's parent catalog - Is the owner of the function's
#' parent schema and have the **USE_CATALOG** privilege on its parent catalog -
#' Is the owner of the function itself and have both the **USE_CATALOG**
#' privilege on its parent catalog and the **USE_SCHEMA** privilege on its
#' parent schema
#'
#' @param force Force deletion even if the function is notempty.
#' @param name Required. The fully-qualified name of the function (of the form __catalog_name__.__schema_name__.__function__name__).
#'
#' @keywords internal
#'
#' @rdname functions_delete
#'
#' @aliases functions_delete
functions_delete <- function(name, force = NULL) {
  query <- list(force = force)
  .state$api$do("DELETE", paste("/api/2.1/unity-catalog/functions/", name, sep = ""),
    query = query)
}
functions$delete <- functions_delete

#' Get a function.
#' 
#' Gets a function from within a parent catalog and schema. For the fetch to
#' succeed, the user must satisfy one of the following requirements: - Is a
#' metastore admin - Is an owner of the function's parent catalog - Have the
#' **USE_CATALOG** privilege on the function's parent catalog and be the owner
#' of the function - Have the **USE_CATALOG** privilege on the function's parent
#' catalog, the **USE_SCHEMA** privilege on the function's parent schema, and
#' the **EXECUTE** privilege on the function itself
#'
#' @param name Required. The fully-qualified name of the function (of the form __catalog_name__.__schema_name__.__function__name__).
#'
#' @keywords internal
#'
#' @rdname functions_get
#'
#' @aliases functions_get
functions_get <- function(name) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/functions/", name, sep = ""))
}
functions$get <- functions_get

#' List functions.
#' 
#' List functions within the specified parent catalog and schema. If the user is
#' a metastore admin, all functions are returned in the output list. Otherwise,
#' the user must have the **USE_CATALOG** privilege on the catalog and the
#' **USE_SCHEMA** privilege on the schema, and the output list contains only
#' functions for which either the user has the **EXECUTE** privilege or the user
#' is the owner. There is no guarantee of a specific ordering of the elements in
#' the array.
#'
#' @param catalog_name Required. Name of parent catalog for functions of interest.
#' @param schema_name Required. Parent schema of functions.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname functions_list
#'
#' @aliases functions_list
functions_list <- function(catalog_name, schema_name) {
  query <- list(catalog_name = catalog_name, schema_name = schema_name)

  json <- .state$api$do("GET", "/api/2.1/unity-catalog/functions", query = query)
  return(json$functions)

}
functions$list <- functions_list

#' Update a function.
#' 
#' Updates the function that matches the supplied name. Only the owner of the
#' function can be updated. If the user is not a metastore admin, the user must
#' be a member of the group that is the new function owner. - Is a metastore
#' admin - Is the owner of the function's parent catalog - Is the owner of the
#' function's parent schema and has the **USE_CATALOG** privilege on its parent
#' catalog - Is the owner of the function itself and has the **USE_CATALOG**
#' privilege on its parent catalog as well as the **USE_SCHEMA** privilege on
#' the function's parent schema.
#'
#' @param name Required. The fully-qualified name of the function (of the form __catalog_name__.__schema_name__.__function__name__).
#' @param owner Username of current owner of function.
#'
#' @keywords internal
#'
#' @rdname functions_update
#'
#' @aliases functions_update
functions_update <- function(name, owner = NULL) {
  body <- list(, owner = owner)
  .state$api$do("PATCH", paste("/api/2.1/unity-catalog/functions/", name, sep = ""),
    body = body)
}
functions$update <- functions_update

