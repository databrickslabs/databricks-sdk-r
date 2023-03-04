# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.


#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=experiments_create]{create} \tab Create experiment.\cr
#'  \link[=experiments_delete]{delete} \tab Delete an experiment.\cr
#'  \link[=experiments_get]{get} \tab Get an experiment.\cr
#'  \link[=experiments_get_by_name]{get_by_name} \tab Get metadata.\cr
#'  \link[=experiments_list]{list} \tab List experiments.\cr
#'  \link[=experiments_restore]{restore} \tab Restores an experiment.\cr
#'  \link[=experiments_search]{search} \tab Search experiments.\cr
#'  \link[=experiments_set_experiment_tag]{set_experiment_tag} \tab Set a tag.\cr
#'  \link[=experiments_update]{update} \tab Update an experiment.\cr
#' }
#'
#' @rdname experiments
#' @export
experiments <- list()

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
#' @param name [required] Experiment name.
#' @param tags A collection of tags to set on the experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_create
#'
#' @aliases experiments_create
experiments_create <- function(name, artifact_location = NULL, 
    tags = NULL, 
    ...) {
    body <- list(
        artifact_location = artifact_location, 
        name = name, 
        tags = tags, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/create", body = body)
}
experiments$create <- experiments_create

#' Delete an experiment.
#' 
#' Marks an experiment and associated metadata, runs, metrics, params, and tags
#' for deletion. If the experiment uses FileStore, artifacts associated with
#' experiment are also deleted.
#'
#' @param experiment_id [required] ID of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_delete
#'
#' @aliases experiments_delete
experiments_delete <- function(experiment_id, ...) {
    body <- list(
        experiment_id = experiment_id, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/delete", body = body)
}
experiments$delete <- experiments_delete

#' Get an experiment.
#' 
#' Gets metadata for an experiment. This method works on deleted experiments.
#'
#' @param experiment_id [required] ID of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_get
#'
#' @aliases experiments_get
experiments_get <- function(experiment_id, ...) {
    query <- list(
        experiment_id = experiment_id, ...)
    
    .api$do("GET", "/api/2.0/mlflow/experiments/get", query = query)
}
experiments$get <- experiments_get

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
#' @param experiment_name [required] Name of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_get_by_name
#'
#' @aliases experiments_get_by_name
experiments_get_by_name <- function(experiment_name, ...) {
    query <- list(
        experiment_name = experiment_name, ...)
    
    .api$do("GET", "/api/2.0/mlflow/experiments/get-by-name", query = query)
}
experiments$get_by_name <- experiments_get_by_name

#' List experiments.
#' 
#' Gets a list of all experiments.
#'
#' @param max_results Maximum number of experiments desired.
#' @param page_token Token indicating the page of experiments to fetch.
#' @param view_type Qualifier for type of experiments to be returned.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname experiments_list
#'
#' @aliases experiments_list
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
experiments$list <- experiments_list

#' Restores an experiment.
#' 
#' "Restore an experiment marked for deletion. This also restores\nassociated
#' metadata, runs, metrics, params, and tags. If experiment uses FileStore,
#' underlying\nartifacts associated with experiment are also restored.\n\nThrows
#' `RESOURCE_DOES_NOT_EXIST` if experiment was never created or was permanently
#' deleted.",
#'
#' @param experiment_id [required] ID of the associated experiment.
#'
#' @keywords internal
#'
#' @rdname experiments_restore
#'
#' @aliases experiments_restore
experiments_restore <- function(experiment_id, ...) {
    body <- list(
        experiment_id = experiment_id, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/restore", body = body)
}
experiments$restore <- experiments_restore

#' Search experiments.
#' 
#' Searches for experiments that satisfy specified search criteria.
#'
#' @param filter String representing a SQL filter condition (e.g.
#' @param max_results Maximum number of experiments desired.
#' @param order_by List of columns for ordering search results, which can include experiment name and last updated timestamp with an optional "DESC" or "ASC" annotation, where "ASC" is the default.
#' @param page_token Token indicating the page of experiments to fetch.
#' @param view_type Qualifier for type of experiments to be returned.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname experiments_search
#'
#' @aliases experiments_search
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
experiments$search <- experiments_search

#' Set a tag.
#' 
#' Sets a tag on an experiment. Experiment tags are metadata that can be
#' updated.
#'
#' @param experiment_id [required] ID of the experiment under which to log the tag.
#' @param key [required] Name of the tag.
#' @param value [required] String value of the tag being logged.
#'
#' @keywords internal
#'
#' @rdname experiments_set_experiment_tag
#'
#' @aliases experiments_set_experiment_tag
experiments_set_experiment_tag <- function(experiment_id, key, value, ...) {
    body <- list(
        experiment_id = experiment_id, 
        key = key, 
        value = value, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/set-experiment-tag", body = body)
}
experiments$set_experiment_tag <- experiments_set_experiment_tag

#' Update an experiment.
#' 
#' Updates experiment metadata.
#'
#' @param experiment_id [required] ID of the associated experiment.
#' @param new_name If provided, the experiment's name is changed to the new name.
#'
#' @keywords internal
#'
#' @rdname experiments_update
#'
#' @aliases experiments_update
experiments_update <- function(experiment_id, new_name = NULL, 
    ...) {
    body <- list(
        experiment_id = experiment_id, 
        new_name = new_name, ...)
    
    .api$do("POST", "/api/2.0/mlflow/experiments/update", body = body)
}
experiments$update <- experiments_update













