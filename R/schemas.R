# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a schema.
#' 
#' Creates a new schema for catalog in the Metatastore. The caller must be a
#' metastore admin, or have the **CREATE_SCHEMA** privilege in the parent
#' catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. Name of parent catalog.
#' @param comment User-provided free-form text description.
#' @param name Required. Name of schema, relative to parent catalog.
#' @param properties A map of key-value properties attached to the securable.
#' @param storage_root Storage root URL for managed tables within schema.
#'
#' @rdname create_schema
#' @alias schemasCreate
#' @export
create_schema <- function(client, name, catalog_name, comment = NULL, properties = NULL,
  storage_root = NULL) {
  body <- list(catalog_name = catalog_name, comment = comment, name = name, properties = properties,
    storage_root = storage_root)
  client$do("POST", "/api/2.1/unity-catalog/schemas", body = body)
}

#' @rdname create_schema
#' @export 
schemasCreate <- create_schema
#' Delete a schema.
#' 
#' Deletes the specified schema from the parent catalog. The caller must be the
#' owner of the schema or an owner of the parent catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the schema.
#'
#' @rdname delete_schema
#' @alias schemasDelete
#' @export
delete_schema <- function(client, full_name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""))
}

#' @rdname delete_schema
#' @export 
schemasDelete <- delete_schema
#' Get a schema.
#' 
#' Gets the specified schema within the metastore. The caller must be a
#' metastore admin, the owner of the schema, or a user that has the
#' **USE_SCHEMA** privilege on the schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. Full name of the schema.
#' @param include_browse Whether to include schemas in the response for which the principal can only access selective metadata for.
#'
#' @rdname get_schema
#' @alias schemasGet
#' @export
get_schema <- function(client, full_name, include_browse = NULL) {
  query <- list(include_browse = include_browse)
  client$do("GET", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""),
    query = query)
}

#' @rdname get_schema
#' @export 
schemasGet <- get_schema
#' List schemas.
#' 
#' Gets an array of schemas for a catalog in the metastore. If the caller is the
#' metastore admin or the owner of the parent catalog, all schemas for the
#' catalog will be retrieved. Otherwise, only schemas owned by the caller (or
#' for which the caller has the **USE_SCHEMA** privilege) will be retrieved.
#' There is no guarantee of a specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. Parent catalog for schemas of interest.
#' @param include_browse Whether to include schemas in the response for which the principal can only access selective metadata for.
#' @param max_results Maximum number of schemas to return.
#' @param page_token Opaque pagination token to go to next page based on previous query.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_schemas
#' @alias schemasList
#' @export
list_schemas <- function(client, catalog_name, include_browse = NULL, max_results = NULL,
  page_token = NULL) {
  query <- list(catalog_name = catalog_name, include_browse = include_browse, max_results = max_results,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/schemas", query = query)
    if (is.null(nrow(json$schemas))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$schemas)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_schemas
#' @export 
schemasList <- list_schemas
#' Update a schema.
#' 
#' Updates a schema for a catalog. The caller must be the owner of the schema or
#' a metastore admin. If the caller is a metastore admin, only the __owner__
#' field can be changed in the update. If the __name__ field must be updated,
#' the caller must be a metastore admin or have the **CREATE_SCHEMA** privilege
#' on the parent catalog.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param enable_predictive_optimization Whether predictive optimization should be enabled for this object and objects under it.
#' @param full_name Required. Full name of the schema.
#' @param new_name New name for the schema.
#' @param owner Username of current owner of schema.
#' @param properties A map of key-value properties attached to the securable.
#'
#' @rdname update_schema
#' @alias schemasUpdate
#' @export
update_schema <- function(client, full_name, comment = NULL, enable_predictive_optimization = NULL,
  new_name = NULL, owner = NULL, properties = NULL) {
  body <- list(comment = comment, enable_predictive_optimization = enable_predictive_optimization,
    new_name = new_name, owner = owner, properties = properties)
  client$do("PATCH", paste("/api/2.1/unity-catalog/schemas/", full_name, sep = ""),
    body = body)
}

#' @rdname update_schema
#' @export 
schemasUpdate <- update_schema





