# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a Registered Model.
#' 
#' Creates a new registered model in Unity Catalog.
#' 
#' File storage for model versions in the registered model will be located in
#' the default location which is specified by the parent schema, or the parent
#' catalog, or the Metastore.
#' 
#' For registered model creation to succeed, the user must satisfy the following
#' conditions: - The caller must be a metastore admin, or be the owner of the
#' parent catalog and schema, or have the **USE_CATALOG** privilege on the
#' parent catalog and the **USE_SCHEMA** privilege on the parent schema. - The
#' caller must have the **CREATE MODEL** or **CREATE FUNCTION** privilege on the
#' parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name Required. The name of the catalog where the schema and the registered model reside.
#' @param comment The comment attached to the registered model.
#' @param name Required. The name of the registered model.
#' @param schema_name Required. The name of the schema where the registered model resides.
#' @param storage_location The storage location on the cloud under which model version data files are stored.
#'
#' @rdname registeredModelsCreate
#' @export
registeredModelsCreate <- function(client, catalog_name, schema_name, name, comment = NULL,
  storage_location = NULL) {
  body <- list(catalog_name = catalog_name, comment = comment, name = name, schema_name = schema_name,
    storage_location = storage_location)
  client$do("POST", "/api/2.1/unity-catalog/models", body = body)
}

#' Delete a Registered Model.
#' 
#' Deletes a registered model and all its model versions from the specified
#' parent catalog and schema.
#' 
#' The caller must be a metastore admin or an owner of the registered model. For
#' the latter case, the caller must also be the owner or have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. The three-level (fully qualified) name of the registered model.
#'
#' @rdname registeredModelsDelete
#' @export
registeredModelsDelete <- function(client, full_name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/models/", full_name, sep = ""))
}

#' Delete a Registered Model Alias.
#' 
#' Deletes a registered model alias.
#' 
#' The caller must be a metastore admin or an owner of the registered model. For
#' the latter case, the caller must also be the owner or have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alias Required. The name of the alias.
#' @param full_name Required. The three-level (fully qualified) name of the registered model.
#'
#' @rdname registeredModelsDeleteAlias
#' @export
registeredModelsDeleteAlias <- function(client, full_name, alias) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/models/", full_name, "/aliases/",
    alias, sep = ""))
}

#' Get a Registered Model.
#' 
#' Get a registered model.
#' 
#' The caller must be a metastore admin or an owner of (or have the **EXECUTE**
#' privilege on) the registered model. For the latter case, the caller must also
#' be the owner or have the **USE_CATALOG** privilege on the parent catalog and
#' the **USE_SCHEMA** privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. The three-level (fully qualified) name of the registered model.
#' @param include_browse Whether to include registered models in the response for which the principal can only access selective metadata for.
#'
#' @rdname registeredModelsGet
#' @export
registeredModelsGet <- function(client, full_name, include_browse = NULL) {
  query <- list(include_browse = include_browse)
  client$do("GET", paste("/api/2.1/unity-catalog/models/", full_name, sep = ""),
    query = query)
}

#' List Registered Models.
#' 
#' List registered models. You can list registered models under a particular
#' schema, or list all registered models in the current metastore.
#' 
#' The returned models are filtered based on the privileges of the calling user.
#' For example, the metastore admin is able to list all the registered models. A
#' regular user needs to be the owner or have the **EXECUTE** privilege on the
#' registered model to recieve the registered models in the response. For the
#' latter case, the caller must also be the owner or have the **USE_CATALOG**
#' privilege on the parent catalog and the **USE_SCHEMA** privilege on the
#' parent schema.
#' 
#' There is no guarantee of a specific ordering of the elements in the response.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_name The identifier of the catalog under which to list registered models.
#' @param include_browse Whether to include registered models in the response for which the principal can only access selective metadata for.
#' @param max_results Max number of registered models to return.
#' @param page_token Opaque token to send for the next page of results (pagination).
#' @param schema_name The identifier of the schema under which to list registered models.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname registeredModelsList
#' @export
registeredModelsList <- function(client, catalog_name = NULL, include_browse = NULL,
  max_results = NULL, page_token = NULL, schema_name = NULL) {
  query <- list(catalog_name = catalog_name, include_browse = include_browse, max_results = max_results,
    page_token = page_token, schema_name = schema_name)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/models", query = query)
    if (is.null(nrow(json$registered_models))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$registered_models)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' Set a Registered Model Alias.
#' 
#' Set an alias on the specified registered model.
#' 
#' The caller must be a metastore admin or an owner of the registered model. For
#' the latter case, the caller must also be the owner or have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alias Required. The name of the alias.
#' @param full_name Required. Full name of the registered model.
#' @param version_num Required. The version number of the model version to which the alias points.
#'
#' @rdname registeredModelsSetAlias
#' @export
registeredModelsSetAlias <- function(client, full_name, alias, version_num) {
  body <- list(alias = alias, full_name = full_name, version_num = version_num)
  client$do("PUT", paste("/api/2.1/unity-catalog/models/", full_name, "/aliases/",
    alias, sep = ""), body = body)
}

#' Update a Registered Model.
#' 
#' Updates the specified registered model.
#' 
#' The caller must be a metastore admin or an owner of the registered model. For
#' the latter case, the caller must also be the owner or have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' 
#' Currently only the name, the owner or the comment of the registered model can
#' be updated.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment The comment attached to the registered model.
#' @param full_name Required. The three-level (fully qualified) name of the registered model.
#' @param new_name New name for the registered model.
#' @param owner The identifier of the user who owns the registered model.
#'
#' @rdname registeredModelsUpdate
#' @export
registeredModelsUpdate <- function(client, full_name, comment = NULL, new_name = NULL,
  owner = NULL) {
  body <- list(comment = comment, new_name = new_name, owner = owner)
  client$do("PATCH", paste("/api/2.1/unity-catalog/models/", full_name, sep = ""),
    body = body)
}

