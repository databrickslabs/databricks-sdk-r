# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Delete a Model Version.
#' 
#' Deletes a model version from the specified registered model. Any aliases
#' assigned to the model version will also be deleted.
#' 
#' The caller must be a metastore admin or an owner of the parent registered
#' model. For the latter case, the caller must also be the owner or have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. The three-level (fully qualified) name of the model version.
#' @param version Required. The integer version number of the model version.
#'
#' @rdname delete_model_version
#' @export
delete_model_version <- function(client, full_name, version) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/models/", full_name, "/versions/",
    version, sep = ""))
}
#' Get a Model Version.
#' 
#' Get a model version.
#' 
#' The caller must be a metastore admin or an owner of (or have the **EXECUTE**
#' privilege on) the parent registered model. For the latter case, the caller
#' must also be the owner or have the **USE_CATALOG** privilege on the parent
#' catalog and the **USE_SCHEMA** privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. The three-level (fully qualified) name of the model version.
#' @param include_browse Whether to include model versions in the response for which the principal can only access selective metadata for.
#' @param version Required. The integer version number of the model version.
#'
#' @rdname get_model_version
#' @export
get_model_version <- function(client, full_name, version, include_browse = NULL) {
  query <- list(include_browse = include_browse)
  client$do("GET", paste("/api/2.1/unity-catalog/models/", full_name, "/versions/",
    version, sep = ""), query = query)
}
#' Get Model Version By Alias.
#' 
#' Get a model version by alias.
#' 
#' The caller must be a metastore admin or an owner of (or have the **EXECUTE**
#' privilege on) the registered model. For the latter case, the caller must also
#' be the owner or have the **USE_CATALOG** privilege on the parent catalog and
#' the **USE_SCHEMA** privilege on the parent schema.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param alias Required. The name of the alias.
#' @param full_name Required. The three-level (fully qualified) name of the registered model.
#'
#' @rdname get_model_version_by_alias
#' @export
get_model_version_by_alias <- function(client, full_name, alias) {

  client$do("GET", paste("/api/2.1/unity-catalog/models/", full_name, "/aliases/",
    alias, sep = ""))
}
#' List Model Versions.
#' 
#' List model versions. You can list model versions under a particular schema,
#' or list all model versions in the current metastore.
#' 
#' The returned models are filtered based on the privileges of the calling user.
#' For example, the metastore admin is able to list all the model versions. A
#' regular user needs to be the owner or have the **EXECUTE** privilege on the
#' parent registered model to recieve the model versions in the response. For
#' the latter case, the caller must also be the owner or have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' 
#' There is no guarantee of a specific ordering of the elements in the response.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param full_name Required. The full three-level name of the registered model under which to list model versions.
#' @param include_browse Whether to include model versions in the response for which the principal can only access selective metadata for.
#' @param max_results Maximum number of model versions to return.
#' @param page_token Opaque pagination token to go to next page based on previous query.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_model_versions
#' @export
list_model_versions <- function(client, full_name, include_browse = NULL, max_results = NULL,
  page_token = NULL) {
  query <- list(include_browse = include_browse, max_results = max_results, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", paste("/api/2.1/unity-catalog/models/", full_name,
      "/versions", , sep = ""), query = query)
    if (is.null(nrow(json$model_versions))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$model_versions)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
#' Update a Model Version.
#' 
#' Updates the specified model version.
#' 
#' The caller must be a metastore admin or an owner of the parent registered
#' model. For the latter case, the caller must also be the owner or have the
#' **USE_CATALOG** privilege on the parent catalog and the **USE_SCHEMA**
#' privilege on the parent schema.
#' 
#' Currently only the comment of the model version can be updated.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment The comment attached to the model version.
#' @param full_name Required. The three-level (fully qualified) name of the model version.
#' @param version Required. The integer version number of the model version.
#'
#' @rdname update_model_version
#' @export
update_model_version <- function(client, full_name, version, comment = NULL) {
  body <- list(comment = comment)
  client$do("PATCH", paste("/api/2.1/unity-catalog/models/", full_name, "/versions/",
    version, sep = ""), body = body)
}





