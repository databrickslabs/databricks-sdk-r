# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a model.
#' 
#' Creates a new registered model with the name specified in the request body.
#' 
#' Throws `RESOURCE_ALREADY_EXISTS` if a registered model with the given name
#' exists.
#'
#' @param description Optional description for registered model.
#' @param name Register models under this name.
#' @param tags Additional metadata for registered model.
databricks_registered_models_create <- function(name, description = NULL, 
    tags = NULL, 
    ...) {
    body <- list(
        description = description, 
        name = name, 
        tags = tags, ...)
    
    .api$do("POST", "/api/2.0/mlflow/registered-models/create", body = body)
}

#' Delete a model.
#' 
#' Deletes a registered model.
#'
#' @param name Registered model unique name identifier.
databricks_registered_models_delete <- function(name, ...) {
    query <- list(
        name = name, ...)
    
    .api$do("DELETE", "/api/2.0/mlflow/registered-models/delete", query = query)
}

#' Delete a model tag.
#' 
#' Deletes the tag for a registered model.
#'
#' @param key Name of the tag.
#' @param name Name of the registered model that the tag was logged under.
databricks_registered_models_delete_tag <- function(name, key, ...) {
    query <- list(
        key = key, 
        name = name, ...)
    
    .api$do("DELETE", "/api/2.0/mlflow/registered-models/delete-tag", query = query)
}

#' Get a model.
#' 
#' Gets the registered model that matches the specified ID.
#'
#' @param name Registered model unique name identifier.
databricks_registered_models_get <- function(name, ...) {
    query <- list(
        name = name, ...)
    
    .api$do("GET", "/api/2.0/mlflow/registered-models/get", query = query)
}

#' Get the latest version.
#' 
#' Gets the latest version of a registered model.
#'
#' @param name Registered model unique name identifier.
#' @param stages List of stages.
databricks_registered_models_get_latest_versions <- function(name, stages = NULL, 
    ...) {
    body <- list(
        name = name, 
        stages = stages, ...)
    
    
    json <- .api$do("POST", "/api/2.0/mlflow/registered-models/get-latest-versions", body = body)
    return (json$model_versions)
    
}

#' List models.
#' 
#' Lists all available registered models, up to the limit specified in
#' __max_results__.
#'
#' @param max_results Maximum number of registered models desired.
#' @param page_token Pagination token to go to the next page based on a previous query.
databricks_registered_models_list <- function(max_results = NULL, 
    page_token = NULL, 
    ...) {
    query <- list(
        max_results = max_results, 
        page_token = page_token, ...)
    
    
    
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
    return (results)
    
}

#' Rename a model.
#' 
#' Renames a registered model.
#'
#' @param name Registered model unique name identifier.
#' @param new_name If provided, updates the name for this `registered_model`.
databricks_registered_models_rename <- function(name, new_name = NULL, 
    ...) {
    body <- list(
        name = name, 
        new_name = new_name, ...)
    
    .api$do("POST", "/api/2.0/mlflow/registered-models/rename", body = body)
}

#' Search models.
#' 
#' Search for registered models based on the specified __filter__.
#'
#' @param filter String filter condition, like "name LIKE 'my-model-name'".
#' @param max_results Maximum number of models desired.
#' @param order_by List of columns for ordering search results, which can include model name and last updated timestamp with an optional "DESC" or "ASC" annotation, where "ASC" is the default.
#' @param page_token Pagination token to go to the next page based on a previous search query.
databricks_registered_models_search <- function(filter = NULL, 
    max_results = NULL, 
    order_by = NULL, 
    page_token = NULL, 
    ...) {
    query <- list(
        filter = filter, 
        max_results = max_results, 
        order_by = order_by, 
        page_token = page_token, ...)
    
    
    
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
    return (results)
    
}

#' Set a tag.
#' 
#' Sets a tag on a registered model.
#'
#' @param key Name of the tag.
#' @param name Unique name of the model.
#' @param value String value of the tag being logged.
databricks_registered_models_set_tag <- function(name, key, value, ...) {
    body <- list(
        key = key, 
        name = name, 
        value = value, ...)
    
    .api$do("POST", "/api/2.0/mlflow/registered-models/set-tag", body = body)
}

#' Update model.
#' 
#' Updates a registered model.
#'
#' @param description If provided, updates the description for this `registered_model`.
#' @param name Registered model unique name identifier.
databricks_registered_models_update <- function(name, description = NULL, 
    ...) {
    body <- list(
        description = description, 
        name = name, ...)
    
    .api$do("PATCH", "/api/2.0/mlflow/registered-models/update", body = body)
}













