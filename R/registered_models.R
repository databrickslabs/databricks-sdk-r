# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL


#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=registered_models_create]{create} \tab Create a model.\cr
#'  \link[=registered_models_delete]{delete} \tab Delete a model.\cr
#'  \link[=registered_models_delete_tag]{delete_tag} \tab Delete a model tag.\cr
#'  \link[=registered_models_get]{get} \tab Get a model.\cr
#'  \link[=registered_models_get_latest_versions]{get_latest_versions} \tab Get the latest version.\cr
#'  \link[=registered_models_list]{list} \tab List models.\cr
#'  \link[=registered_models_rename]{rename} \tab Rename a model.\cr
#'  \link[=registered_models_search]{search} \tab Search models.\cr
#'  \link[=registered_models_set_tag]{set_tag} \tab Set a tag.\cr
#'  \link[=registered_models_update]{update} \tab Update model.\cr
#' }
#'
#' @rdname registered_models
#' @export
registered_models <- list()

#' Create a model.
#' 
#' Creates a new registered model with the name specified in the request body.
#' 
#' Throws `RESOURCE_ALREADY_EXISTS` if a registered model with the given name
#' exists.
#'
#' @param description Optional description for registered model.
#' @param name Required. Register models under this name.
#' @param tags Additional metadata for registered model.
#'
#' @keywords internal
#'
#' @rdname registered_models_create
#'
#' @aliases registered_models_create
registered_models_create <- function(name, description = NULL, tags = NULL) {
  body <- list(description = description, name = name, tags = tags)
  .api$do("POST", "/api/2.0/mlflow/registered-models/create", body = body)
}
registered_models$create <- registered_models_create

#' Delete a model.
#' 
#' Deletes a registered model.
#'
#' @param name Required. Registered model unique name identifier.
#'
#' @keywords internal
#'
#' @rdname registered_models_delete
#'
#' @aliases registered_models_delete
registered_models_delete <- function(name) {
  query <- list(name = name)
  .api$do("DELETE", "/api/2.0/mlflow/registered-models/delete", query = query)
}
registered_models$delete <- registered_models_delete

#' Delete a model tag.
#' 
#' Deletes the tag for a registered model.
#'
#' @param key Required. Name of the tag.
#' @param name Required. Name of the registered model that the tag was logged under.
#'
#' @keywords internal
#'
#' @rdname registered_models_delete_tag
#'
#' @aliases registered_models_delete_tag
registered_models_delete_tag <- function(name, key) {
  query <- list(key = key, name = name)
  .api$do("DELETE", "/api/2.0/mlflow/registered-models/delete-tag", query = query)
}
registered_models$delete_tag <- registered_models_delete_tag

#' Get a model.
#' 
#' Gets the registered model that matches the specified ID.
#'
#' @param name Required. Registered model unique name identifier.
#'
#' @keywords internal
#'
#' @rdname registered_models_get
#'
#' @aliases registered_models_get
registered_models_get <- function(name) {
  query <- list(name = name)
  .api$do("GET", "/api/2.0/mlflow/registered-models/get", query = query)
}
registered_models$get <- registered_models_get

#' Get the latest version.
#' 
#' Gets the latest version of a registered model.
#'
#' @param name Required. Registered model unique name identifier.
#' @param stages List of stages.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname registered_models_get_latest_versions
#'
#' @aliases registered_models_get_latest_versions
registered_models_get_latest_versions <- function(name, stages = NULL) {
  body <- list(name = name, stages = stages)

  json <- .api$do("POST", "/api/2.0/mlflow/registered-models/get-latest-versions",
    body = body)
  return(json$model_versions)

}
registered_models$get_latest_versions <- registered_models_get_latest_versions

#' List models.
#' 
#' Lists all available registered models, up to the limit specified in
#' __max_results__.
#'
#' @param max_results Maximum number of registered models desired.
#' @param page_token Pagination token to go to the next page based on a previous query.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname registered_models_list
#'
#' @aliases registered_models_list
registered_models_list <- function(max_results = NULL, page_token = NULL) {
  query <- list(max_results = max_results, page_token = page_token)
  results <- data.frame()
  while (TRUE) {
    json <- .api$do("GET", "/api/2.0/mlflow/registered-models/list", query = query)
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
registered_models$list <- registered_models_list

#' Rename a model.
#' 
#' Renames a registered model.
#'
#' @param name Required. Registered model unique name identifier.
#' @param new_name If provided, updates the name for this `registered_model`.
#'
#' @keywords internal
#'
#' @rdname registered_models_rename
#'
#' @aliases registered_models_rename
registered_models_rename <- function(name, new_name = NULL) {
  body <- list(name = name, new_name = new_name)
  .api$do("POST", "/api/2.0/mlflow/registered-models/rename", body = body)
}
registered_models$rename <- registered_models_rename

#' Search models.
#' 
#' Search for registered models based on the specified __filter__.
#'
#' @param filter String filter condition, like 'name LIKE 'my-model-name''.
#' @param max_results Maximum number of models desired.
#' @param order_by List of columns for ordering search results, which can include model name and last updated timestamp with an optional 'DESC' or 'ASC' annotation, where 'ASC' is the default.
#' @param page_token Pagination token to go to the next page based on a previous search query.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname registered_models_search
#'
#' @aliases registered_models_search
registered_models_search <- function(filter = NULL, max_results = NULL, order_by = NULL,
  page_token = NULL) {
  query <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token)
  results <- data.frame()
  while (TRUE) {
    json <- .api$do("GET", "/api/2.0/mlflow/registered-models/search", query = query)
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
registered_models$search <- registered_models_search

#' Set a tag.
#' 
#' Sets a tag on a registered model.
#'
#' @param key Required. Name of the tag.
#' @param name Required. Unique name of the model.
#' @param value Required. String value of the tag being logged.
#'
#' @keywords internal
#'
#' @rdname registered_models_set_tag
#'
#' @aliases registered_models_set_tag
registered_models_set_tag <- function(name, key, value) {
  body <- list(key = key, name = name, value = value)
  .api$do("POST", "/api/2.0/mlflow/registered-models/set-tag", body = body)
}
registered_models$set_tag <- registered_models_set_tag

#' Update model.
#' 
#' Updates a registered model.
#'
#' @param description If provided, updates the description for this `registered_model`.
#' @param name Required. Registered model unique name identifier.
#'
#' @keywords internal
#'
#' @rdname registered_models_update
#'
#' @aliases registered_models_update
registered_models_update <- function(name, description = NULL) {
  body <- list(description = description, name = name)
  .api$do("PATCH", "/api/2.0/mlflow/registered-models/update", body = body)
}
registered_models$update <- registered_models_update

