# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create experiment.
#' 
#' Creates an experiment with a name. Returns the ID of the newly created
#' experiment. Validates that another experiment with the same name does not
#' already exist and fails if another experiment with the same name already
#' exists.
#' 
#' Throws `RESOURCE_ALREADY_EXISTS` if a experiment with the given name exists.
#'
#' @param artifact_location Location where all artifacts for the experiment are stored.
#' @param name Experiment name.
#' @param tags A collection of tags to set on the experiment.
experiments_create <- function(name, artifact_location = NULL, 
    tags = NULL, 
    ...) {
    body <- list(
        artifact_location = artifact_location, 
        name = name, 
        tags = tags, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/create", body = body)
}

#' Delete an experiment.
#' 
#' Marks an experiment and associated metadata, runs, metrics, params, and tags
#' for deletion. If the experiment uses FileStore, artifacts associated with
#' experiment are also deleted.
#'
#' @param experiment_id ID of the associated experiment.
experiments_delete <- function(experiment_id, ...) {
    body <- list(
        experiment_id = experiment_id, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/delete", body = body)
}

#' Get an experiment.
#' 
#' Gets metadata for an experiment. This method works on deleted experiments.
#'
#' @param experiment_id ID of the associated experiment.
experiments_get <- function(experiment_id, ...) {
    query <- list(
        experiment_id = experiment_id, ...)
    
    .api$do("GET", "/api/2.0/mlflow/experiments/get", query = query)
}

#' Get metadata.
#' 
#' "Gets metadata for an experiment.
#' 
#' This endpoint will return deleted experiments, but prefers the active
#' experiment if an active and deleted experiment share the same name. If
#' multiple deleted\nexperiments share the same name, the API will return one of
#' them.
#' 
#' Throws `RESOURCE_DOES_NOT_EXIST` if no experiment with the specified name
#' exists.S
#'
#' @param experiment_name Name of the associated experiment.
experiments_get_by_name <- function(experiment_name, ...) {
    query <- list(
        experiment_name = experiment_name, ...)
    
    .api$do("GET", "/api/2.0/mlflow/experiments/get-by-name", query = query)
}

#' List experiments.
#' 
#' Gets a list of all experiments.
#'
#' @param max_results Maximum number of experiments desired.
#' @param page_token Token indicating the page of experiments to fetch.
#' @param view_type Qualifier for type of experiments to be returned.
experiments_list <- function(max_results = NULL, 
    page_token = NULL, 
    view_type = NULL, 
    ...) {
    query <- list(
        max_results = max_results, 
        page_token = page_token, 
        view_type = view_type, ...)
    
    
    
    results <- data.frame()
    while (TRUE) {
        json <- .api$do("GET", "/api/2.0/mlflow/experiments/list", query = query)
        if (is.null(nrow(json$experiments))) {
            break
        }
        # append this page of results to one results data.frame
        results <- dplyr::bind_rows(results, json$experiments)
        if (is.null(json$next_page_token)) {
            break
        }
        query$page_token <- json$next_page_token
    }
    return (results)
    
}

#' Restores an experiment.
#' 
#' "Restore an experiment marked for deletion. This also restores\nassociated
#' metadata, runs, metrics, params, and tags. If experiment uses FileStore,
#' underlying\nartifacts associated with experiment are also restored.\n\nThrows
#' `RESOURCE_DOES_NOT_EXIST` if experiment was never created or was permanently
#' deleted.",
#'
#' @param experiment_id ID of the associated experiment.
experiments_restore <- function(experiment_id, ...) {
    body <- list(
        experiment_id = experiment_id, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/restore", body = body)
}

#' Search experiments.
#' 
#' Searches for experiments that satisfy specified search criteria.
#'
#' @param filter String representing a SQL filter condition (e.g.
#' @param max_results Maximum number of experiments desired.
#' @param order_by List of columns for ordering search results, which can include experiment name and last updated timestamp with an optional "DESC" or "ASC" annotation, where "ASC" is the default.
#' @param page_token Token indicating the page of experiments to fetch.
#' @param view_type Qualifier for type of experiments to be returned.
experiments_search <- function(filter = NULL, 
    max_results = NULL, 
    order_by = NULL, 
    page_token = NULL, 
    view_type = NULL, 
    ...) {
    body <- list(
        filter = filter, 
        max_results = max_results, 
        order_by = order_by, 
        page_token = page_token, 
        view_type = view_type, ...)
    
    
    
    results <- data.frame()
    while (TRUE) {
        json <- .api$do("POST", "/api/2.0/mlflow/experiments/search", body = body)
        if (is.null(nrow(json$experiments))) {
            break
        }
        # append this page of results to one results data.frame
        results <- dplyr::bind_rows(results, json$experiments)
        if (is.null(json$next_page_token)) {
            break
        }
        body$page_token <- json$next_page_token
    }
    return (results)
    
}

#' Set a tag.
#' 
#' Sets a tag on an experiment. Experiment tags are metadata that can be
#' updated.
#'
#' @param experiment_id ID of the experiment under which to log the tag.
#' @param key Name of the tag.
#' @param value String value of the tag being logged.
experiments_set_experiment_tag <- function(experiment_id, key, value, ...) {
    body <- list(
        experiment_id = experiment_id, 
        key = key, 
        value = value, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/set-experiment-tag", body = body)
}

#' Update an experiment.
#' 
#' Updates experiment metadata.
#'
#' @param experiment_id ID of the associated experiment.
#' @param new_name If provided, the experiment's name is changed to the new name.
experiments_update <- function(experiment_id, new_name = NULL, 
    ...) {
    body <- list(
        experiment_id = experiment_id, 
        new_name = new_name, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/update", body = body)
}













