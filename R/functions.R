# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a function.
#' 
#' Creates a new function
#' 
#' The user must have the following permissions in order for the function to be
#' created: - **USE_CATALOG** on the function's parent catalog - **USE_SCHEMA**
#' and **CREATE_FUNCTION** on the function's parent schema
#' @param client Required. Instance of DatabricksClient()
#'
#' @param function_info Required. Partial __FunctionInfo__ specifying the function to be created.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/functions/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_function
#' @alias functionsCreate
#' @export
create_function <- function(client, function_info) {
  body <- list(function_info = function_info)
  client$do("POST", "/api/2.1/unity-catalog/functions", body = body)
}

#' @rdname create_function
#' @export 
functionsCreate <- create_function
#' Delete a function.
#' 
#' Deletes the function that matches the supplied name. For the deletion to
#' succeed, the user must satisfy one of the following conditions: - Is the
#' owner of the function's parent catalog - Is the owner of the function's
#' parent schema and have the **USE_CATALOG** privilege on its parent catalog -
#' Is the owner of the function itself and have both the **USE_CATALOG**
#' privilege on its parent catalog and the **USE_SCHEMA** privilege on its
#' parent schema
#' @param client Required. Instance of DatabricksClient()
#'
#' @param force Force deletion even if the function is notempty.
#' @param name Required. The fully-qualified name of the function (of the form __catalog_name__.__schema_name__.__function__name__).
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/functions/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_function
#' @alias functionsDelete
#' @export
delete_function <- function(client, name, force = NULL) {
  query <- list(force = force)
  client$do("DELETE", paste("/api/2.1/unity-catalog/functions/", name, sep = ""),
    query = query)
}

#' @rdname delete_function
#' @export 
functionsDelete <- delete_function
#' Get a function.
#' 
#' Gets a function from within a parent catalog and schema. For the fetch to
#' succeed, the user must satisfy one of the following requirements: - Is a
#' metastore admin - Is an owner of the function's parent catalog - Have the
#' **USE_CATALOG** privilege on the function's parent catalog and be the owner
#' of the function - Have the **USE_CATALOG** privilege on the function's parent
#' catalog, the **USE_SCHEMA** privilege on the function's parent schema, and
#' the **EXECUTE** privilege on the function itself
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_browse Whether to include functions in the response for which the principal can only access selective metadata for.
#' @param name Required. The fully-qualified name of the function (of the form __catalog_name__.__schema_name__.__function__name__).
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/functions/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_function
#' @alias functionsGet
#' @export
get_function <- function(client, name, include_browse = NULL) {
  query <- list(include_browse = include_browse)
  client$do("GET", paste("/api/2.1/unity-catalog/functions/", name, sep = ""),
    query = query)
}

#' @rdname get_function
#' @export 
functionsGet <- get_function
#' List functions.
#' 
#' List functions within the specified parent catalog and schema. If the user is
#' a metastore admin, all functions are returned in the output list. Otherwise,
#' the user must have the **USE_CATALOG** privilege on the catalog and the
#' **USE_SCHEMA** privilege on the schema, and the output list contains only
#' functions for which either the user has the **EXECUTE** privilege or the user
#' is the owner. There is no guarantee of a specific ordering of the elements in
#' the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. Name of parent catalog for functions of interest.
#' @param include_browse Whether to include functions in the response for which the principal can only access selective metadata for.
#' @param max_results Maximum number of functions to return.
#' @param page_token Opaque pagination token to go to next page based on previous query.
#' @param schema_name Required. Parent schema of functions.
#'
#' @return `data.frame` with all of the response pages.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/functions/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_functions
#' @alias functionsList
#' @export
list_functions <- function(client, catalog_name, schema_name, include_browse = NULL,
  max_results = NULL, page_token = NULL) {
  query <- list(catalog_name = catalog_name, include_browse = include_browse, max_results = max_results,
    page_token = page_token, schema_name = schema_name)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/functions", query = query)
    if (is.null(nrow(json$functions))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$functions)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_functions
#' @export 
functionsList <- list_functions
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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The fully-qualified name of the function (of the form __catalog_name__.__schema_name__.__function__name__).
#' @param owner Username of current owner of function.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/functions/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_function
#' @alias functionsUpdate
#' @export
update_function <- function(client, name, owner = NULL) {
  body <- list(owner = owner)
  client$do("PATCH", paste("/api/2.1/unity-catalog/functions/", name, sep = ""),
    body = body)
}

#' @rdname update_function
#' @export 
functionsUpdate <- update_function





