# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' MLflow Model Registry is a centralized model repository and a UI and set of
#' APIs that enable you to manage the full lifecycle of MLflow Models.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=model_registry_approve_transition_request]{approve_transition_request} \tab Approve transition request.\cr
#'  \link[=model_registry_create_comment]{create_comment} \tab Post a comment.\cr
#'  \link[=model_registry_create_model]{create_model} \tab Create a model.\cr
#'  \link[=model_registry_create_model_version]{create_model_version} \tab Create a model version.\cr
#'  \link[=model_registry_create_transition_request]{create_transition_request} \tab Make a transition request.\cr
#'  \link[=model_registry_create_webhook]{create_webhook} \tab Create a webhook.\cr
#'  \link[=model_registry_delete_comment]{delete_comment} \tab Delete a comment.\cr
#'  \link[=model_registry_delete_model]{delete_model} \tab Delete a model.\cr
#'  \link[=model_registry_delete_model_tag]{delete_model_tag} \tab Delete a model tag.\cr
#'  \link[=model_registry_delete_model_version]{delete_model_version} \tab Delete a model version.\cr
#'  \link[=model_registry_delete_model_version_tag]{delete_model_version_tag} \tab Delete a model version tag.\cr
#'  \link[=model_registry_delete_transition_request]{delete_transition_request} \tab Delete a ransition request.\cr
#'  \link[=model_registry_delete_webhook]{delete_webhook} \tab Delete a webhook.\cr
#'  \link[=model_registry_get_latest_versions]{get_latest_versions} \tab Get the latest version.\cr
#'  \link[=model_registry_get_model]{get_model} \tab Get model.\cr
#'  \link[=model_registry_get_model_version]{get_model_version} \tab Get a model version.\cr
#'  \link[=model_registry_get_model_version_download_uri]{get_model_version_download_uri} \tab Get a model version URI.\cr
#'  \link[=model_registry_list_models]{list_models} \tab List models.\cr
#'  \link[=model_registry_list_transition_requests]{list_transition_requests} \tab List transition requests.\cr
#'  \link[=model_registry_list_webhooks]{list_webhooks} \tab List registry webhooks.\cr
#'  \link[=model_registry_reject_transition_request]{reject_transition_request} \tab Reject a transition request.\cr
#'  \link[=model_registry_rename_model]{rename_model} \tab Rename a model.\cr
#'  \link[=model_registry_search_model_versions]{search_model_versions} \tab Searches model versions.\cr
#'  \link[=model_registry_search_models]{search_models} \tab Search models.\cr
#'  \link[=model_registry_set_model_tag]{set_model_tag} \tab Set a tag.\cr
#'  \link[=model_registry_set_model_version_tag]{set_model_version_tag} \tab Set a version tag.\cr
#'  \link[=model_registry_test_registry_webhook]{test_registry_webhook} \tab Test a webhook.\cr
#'  \link[=model_registry_transition_stage]{transition_stage} \tab Transition a stage.\cr
#'  \link[=model_registry_update_comment]{update_comment} \tab Update a comment.\cr
#'  \link[=model_registry_update_model]{update_model} \tab Update model.\cr
#'  \link[=model_registry_update_model_version]{update_model_version} \tab Update model version.\cr
#'  \link[=model_registry_update_webhook]{update_webhook} \tab Update a webhook.\cr
#' }
#'
#' @rdname model_registry
#' @export
model_registry <- list()

#' Approve transition request.
#' 
#' Approves a model version stage transition request.
#'
#' @param archive_existing_versions Required. Specifies whether to archive all current model versions in the target stage.
#' @param comment User-provided comment on the action.
#' @param name Required. Name of the model.
#' @param stage Required. Target stage of the transition.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname model_registry_approve_transition_request
#'
#' @aliases model_registry_approve_transition_request
model_registry_approve_transition_request <- function(name, version, stage, archive_existing_versions,
  comment = NULL) {
  body <- list(archive_existing_versions = archive_existing_versions, comment = comment,
    name = name, stage = stage, version = version)
  .state$api$do("POST", "/api/2.0/mlflow/transition-requests/approve", body = body)
}
model_registry$approve_transition_request <- model_registry_approve_transition_request

#' Post a comment.
#' 
#' Posts a comment on a model version. A comment can be submitted either by a
#' user or programmatically to display relevant information about the model. For
#' example, test results or deployment errors.
#'
#' @param comment Required. User-provided comment on the action.
#' @param name Required. Name of the model.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname model_registry_create_comment
#'
#' @aliases model_registry_create_comment
model_registry_create_comment <- function(name, version, comment) {
  body <- list(comment = comment, name = name, version = version)
  .state$api$do("POST", "/api/2.0/mlflow/comments/create", body = body)
}
model_registry$create_comment <- model_registry_create_comment

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
#' @rdname model_registry_create_model
#'
#' @aliases model_registry_create_model
model_registry_create_model <- function(name, description = NULL, tags = NULL) {
  body <- list(description = description, name = name, tags = tags)
  .state$api$do("POST", "/api/2.0/mlflow/registered-models/create", body = body)
}
model_registry$create_model <- model_registry_create_model

#' Create a model version.
#' 
#' Creates a model version.
#'
#' @param description Optional description for model version.
#' @param name Required. Register model under this name.
#' @param run_id MLflow run ID for correlation, if `source` was generated by an experiment run in MLflow tracking server.
#' @param run_link MLflow run link - this is the exact link of the run that generated this model version, potentially hosted at another instance of MLflow.
#' @param source Required. URI indicating the location of the model artifacts.
#' @param tags Additional metadata for model version.
#'
#' @keywords internal
#'
#' @rdname model_registry_create_model_version
#'
#' @aliases model_registry_create_model_version
model_registry_create_model_version <- function(name, source, description = NULL,
  run_id = NULL, run_link = NULL, tags = NULL) {
  body <- list(description = description, name = name, run_id = run_id, run_link = run_link,
    source = source, tags = tags)
  .state$api$do("POST", "/api/2.0/mlflow/model-versions/create", body = body)
}
model_registry$create_model_version <- model_registry_create_model_version

#' Make a transition request.
#' 
#' Creates a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param name Required. Name of the model.
#' @param stage Required. Target stage of the transition.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname model_registry_create_transition_request
#'
#' @aliases model_registry_create_transition_request
model_registry_create_transition_request <- function(name, version, stage, comment = NULL) {
  body <- list(comment = comment, name = name, stage = stage, version = version)
  .state$api$do("POST", "/api/2.0/mlflow/transition-requests/create", body = body)
}
model_registry$create_transition_request <- model_registry_create_transition_request

#' Create a webhook.
#' 
#' **NOTE**: This endpoint is in Public Preview.
#' 
#' Creates a registry webhook.
#'
#' @param description User-specified description for the webhook.
#' @param events Required. Events that can trigger a registry webhook: * `MODEL_VERSION_CREATED`: A new model version was created for the associated model.
#' @param http_url_spec 
#' @param job_spec 
#' @param model_name Name of the model whose events would trigger this webhook.
#' @param status This describes an enum.
#'
#' @keywords internal
#'
#' @rdname model_registry_create_webhook
#'
#' @aliases model_registry_create_webhook
model_registry_create_webhook <- function(events, description = NULL, http_url_spec = NULL,
  job_spec = NULL, model_name = NULL, status = NULL) {
  body <- list(description = description, events = events, http_url_spec = http_url_spec,
    job_spec = job_spec, model_name = model_name, status = status)
  .state$api$do("POST", "/api/2.0/mlflow/registry-webhooks/create", body = body)
}
model_registry$create_webhook <- model_registry_create_webhook

#' Delete a comment.
#' 
#' Deletes a comment on a model version.
#'
#' @param id Required. 
#'
#' @keywords internal
#'
#' @rdname model_registry_delete_comment
#'
#' @aliases model_registry_delete_comment
model_registry_delete_comment <- function(id) {
  query <- list(id = id)
  .state$api$do("DELETE", "/api/2.0/mlflow/comments/delete", query = query)
}
model_registry$delete_comment <- model_registry_delete_comment

#' Delete a model.
#' 
#' Deletes a registered model.
#'
#' @param name Required. Registered model unique name identifier.
#'
#' @keywords internal
#'
#' @rdname model_registry_delete_model
#'
#' @aliases model_registry_delete_model
model_registry_delete_model <- function(name) {
  query <- list(name = name)
  .state$api$do("DELETE", "/api/2.0/mlflow/registered-models/delete", query = query)
}
model_registry$delete_model <- model_registry_delete_model

#' Delete a model tag.
#' 
#' Deletes the tag for a registered model.
#'
#' @param key Required. Name of the tag.
#' @param name Required. Name of the registered model that the tag was logged under.
#'
#' @keywords internal
#'
#' @rdname model_registry_delete_model_tag
#'
#' @aliases model_registry_delete_model_tag
model_registry_delete_model_tag <- function(name, key) {
  query <- list(key = key, name = name)
  .state$api$do("DELETE", "/api/2.0/mlflow/registered-models/delete-tag", query = query)
}
model_registry$delete_model_tag <- model_registry_delete_model_tag

#' Delete a model version.
#' 
#' Deletes a model version.
#'
#' @param name Required. Name of the registered model.
#' @param version Required. Model version number.
#'
#' @keywords internal
#'
#' @rdname model_registry_delete_model_version
#'
#' @aliases model_registry_delete_model_version
model_registry_delete_model_version <- function(name, version) {
  query <- list(name = name, version = version)
  .state$api$do("DELETE", "/api/2.0/mlflow/model-versions/delete", query = query)
}
model_registry$delete_model_version <- model_registry_delete_model_version

#' Delete a model version tag.
#' 
#' Deletes a model version tag.
#'
#' @param key Required. Name of the tag.
#' @param name Required. Name of the registered model that the tag was logged under.
#' @param version Required. Model version number that the tag was logged under.
#'
#' @keywords internal
#'
#' @rdname model_registry_delete_model_version_tag
#'
#' @aliases model_registry_delete_model_version_tag
model_registry_delete_model_version_tag <- function(name, version, key) {
  query <- list(key = key, name = name, version = version)
  .state$api$do("DELETE", "/api/2.0/mlflow/model-versions/delete-tag", query = query)
}
model_registry$delete_model_version_tag <- model_registry_delete_model_version_tag

#' Delete a ransition request.
#' 
#' Cancels a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param creator Required. Username of the user who created this request.
#' @param name Required. Name of the model.
#' @param stage Required. Target stage of the transition request.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname model_registry_delete_transition_request
#'
#' @aliases model_registry_delete_transition_request
model_registry_delete_transition_request <- function(name, version, stage, creator,
  comment = NULL) {
  query <- list(comment = comment, creator = creator, name = name, stage = stage,
    version = version)
  .state$api$do("DELETE", "/api/2.0/mlflow/transition-requests/delete", query = query)
}
model_registry$delete_transition_request <- model_registry_delete_transition_request

#' Delete a webhook.
#' 
#' **NOTE:** This endpoint is in Public Preview.
#' 
#' Deletes a registry webhook.
#'
#' @param id Webhook ID required to delete a registry webhook.
#'
#' @keywords internal
#'
#' @rdname model_registry_delete_webhook
#'
#' @aliases model_registry_delete_webhook
model_registry_delete_webhook <- function(id = NULL) {
  query <- list(id = id)
  .state$api$do("DELETE", "/api/2.0/mlflow/registry-webhooks/delete", query = query)
}
model_registry$delete_webhook <- model_registry_delete_webhook

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
#' @rdname model_registry_get_latest_versions
#'
#' @aliases model_registry_get_latest_versions
model_registry_get_latest_versions <- function(name, stages = NULL) {
  body <- list(name = name, stages = stages)

  json <- .state$api$do("POST", "/api/2.0/mlflow/registered-models/get-latest-versions",
    body = body)
  return(json$model_versions)

}
model_registry$get_latest_versions <- model_registry_get_latest_versions

#' Get model.
#' 
#' Get the details of a model. This is a Databricks workspace version of the
#' [MLflow endpoint] that also returns the model's Databricks workspace ID and
#' the permission level of the requesting user on the model.
#' 
#' [MLflow endpoint]: https://www.mlflow.org/docs/latest/rest-api.html#get-registeredmodel
#'
#' @param name Required. Registered model unique name identifier.
#'
#' @keywords internal
#'
#' @rdname model_registry_get_model
#'
#' @aliases model_registry_get_model
model_registry_get_model <- function(name) {
  query <- list(name = name)
  .state$api$do("GET", "/api/2.0/mlflow/databricks/registered-models/get", query = query)
}
model_registry$get_model <- model_registry_get_model

#' Get a model version.
#' 
#' Get a model version.
#'
#' @param name Required. Name of the registered model.
#' @param version Required. Model version number.
#'
#' @keywords internal
#'
#' @rdname model_registry_get_model_version
#'
#' @aliases model_registry_get_model_version
model_registry_get_model_version <- function(name, version) {
  query <- list(name = name, version = version)
  .state$api$do("GET", "/api/2.0/mlflow/model-versions/get", query = query)
}
model_registry$get_model_version <- model_registry_get_model_version

#' Get a model version URI.
#' 
#' Gets a URI to download the model version.
#'
#' @param name Required. Name of the registered model.
#' @param version Required. Model version number.
#'
#' @keywords internal
#'
#' @rdname model_registry_get_model_version_download_uri
#'
#' @aliases model_registry_get_model_version_download_uri
model_registry_get_model_version_download_uri <- function(name, version) {
  query <- list(name = name, version = version)
  .state$api$do("GET", "/api/2.0/mlflow/model-versions/get-download-uri", query = query)
}
model_registry$get_model_version_download_uri <- model_registry_get_model_version_download_uri

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
#' @rdname model_registry_list_models
#'
#' @aliases model_registry_list_models
model_registry_list_models <- function(max_results = NULL, page_token = NULL) {
  query <- list(max_results = max_results, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/mlflow/registered-models/list", query = query)
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
model_registry$list_models <- model_registry_list_models

#' List transition requests.
#' 
#' Gets a list of all open stage transition requests for the model version.
#'
#' @param name Required. Name of the model.
#' @param version Required. Version of the model.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname model_registry_list_transition_requests
#'
#' @aliases model_registry_list_transition_requests
model_registry_list_transition_requests <- function(name, version) {
  query <- list(name = name, version = version)

  json <- .state$api$do("GET", "/api/2.0/mlflow/transition-requests/list", query = query)
  return(json$requests)

}
model_registry$list_transition_requests <- model_registry_list_transition_requests

#' List registry webhooks.
#' 
#' **NOTE:** This endpoint is in Public Preview.
#' 
#' Lists all registry webhooks.
#'
#' @param events If `events` is specified, any webhook with one or more of the specified trigger events is included in the output.
#' @param model_name If not specified, all webhooks associated with the specified events are listed, regardless of their associated model.
#' @param page_token Token indicating the page of artifact results to fetch.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname model_registry_list_webhooks
#'
#' @aliases model_registry_list_webhooks
model_registry_list_webhooks <- function(events = NULL, model_name = NULL, page_token = NULL) {
  query <- list(events = events, model_name = model_name, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/mlflow/registry-webhooks/list", query = query)
    if (is.null(nrow(json$webhooks))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$webhooks)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
model_registry$list_webhooks <- model_registry_list_webhooks

#' Reject a transition request.
#' 
#' Rejects a model version stage transition request.
#'
#' @param comment User-provided comment on the action.
#' @param name Required. Name of the model.
#' @param stage Required. Target stage of the transition.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname model_registry_reject_transition_request
#'
#' @aliases model_registry_reject_transition_request
model_registry_reject_transition_request <- function(name, version, stage, comment = NULL) {
  body <- list(comment = comment, name = name, stage = stage, version = version)
  .state$api$do("POST", "/api/2.0/mlflow/transition-requests/reject", body = body)
}
model_registry$reject_transition_request <- model_registry_reject_transition_request

#' Rename a model.
#' 
#' Renames a registered model.
#'
#' @param name Required. Registered model unique name identifier.
#' @param new_name If provided, updates the name for this `registered_model`.
#'
#' @keywords internal
#'
#' @rdname model_registry_rename_model
#'
#' @aliases model_registry_rename_model
model_registry_rename_model <- function(name, new_name = NULL) {
  body <- list(name = name, new_name = new_name)
  .state$api$do("POST", "/api/2.0/mlflow/registered-models/rename", body = body)
}
model_registry$rename_model <- model_registry_rename_model

#' Searches model versions.
#' 
#' Searches for specific model versions based on the supplied __filter__.
#'
#' @param filter String filter condition, like 'name='my-model-name''.
#' @param max_results Maximum number of models desired.
#' @param order_by List of columns to be ordered by including model name, version, stage with an optional 'DESC' or 'ASC' annotation, where 'ASC' is the default.
#' @param page_token Pagination token to go to next page based on previous search query.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname model_registry_search_model_versions
#'
#' @aliases model_registry_search_model_versions
model_registry_search_model_versions <- function(filter = NULL, max_results = NULL,
  order_by = NULL, page_token = NULL) {
  query <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/mlflow/model-versions/search", query = query)
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
model_registry$search_model_versions <- model_registry_search_model_versions

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
#' @rdname model_registry_search_models
#'
#' @aliases model_registry_search_models
model_registry_search_models <- function(filter = NULL, max_results = NULL, order_by = NULL,
  page_token = NULL) {
  query <- list(filter = filter, max_results = max_results, order_by = order_by,
    page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/mlflow/registered-models/search",
      query = query)
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
model_registry$search_models <- model_registry_search_models

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
#' @rdname model_registry_set_model_tag
#'
#' @aliases model_registry_set_model_tag
model_registry_set_model_tag <- function(name, key, value) {
  body <- list(key = key, name = name, value = value)
  .state$api$do("POST", "/api/2.0/mlflow/registered-models/set-tag", body = body)
}
model_registry$set_model_tag <- model_registry_set_model_tag

#' Set a version tag.
#' 
#' Sets a model version tag.
#'
#' @param key Required. Name of the tag.
#' @param name Required. Unique name of the model.
#' @param value Required. String value of the tag being logged.
#' @param version Required. Model version number.
#'
#' @keywords internal
#'
#' @rdname model_registry_set_model_version_tag
#'
#' @aliases model_registry_set_model_version_tag
model_registry_set_model_version_tag <- function(name, version, key, value) {
  body <- list(key = key, name = name, value = value, version = version)
  .state$api$do("POST", "/api/2.0/mlflow/model-versions/set-tag", body = body)
}
model_registry$set_model_version_tag <- model_registry_set_model_version_tag

#' Test a webhook.
#' 
#' **NOTE:** This endpoint is in Public Preview.
#' 
#' Tests a registry webhook.
#'
#' @param event If `event` is specified, the test trigger uses the specified event.
#' @param id Required. Webhook ID.
#'
#' @keywords internal
#'
#' @rdname model_registry_test_registry_webhook
#'
#' @aliases model_registry_test_registry_webhook
model_registry_test_registry_webhook <- function(id, event = NULL) {
  body <- list(event = event, id = id)
  .state$api$do("POST", "/api/2.0/mlflow/registry-webhooks/test", body = body)
}
model_registry$test_registry_webhook <- model_registry_test_registry_webhook

#' Transition a stage.
#' 
#' Transition a model version's stage. This is a Databricks workspace version of
#' the [MLflow endpoint] that also accepts a comment associated with the
#' transition to be recorded.',
#' 
#' [MLflow endpoint]: https://www.mlflow.org/docs/latest/rest-api.html#transition-modelversion-stage
#'
#' @param archive_existing_versions Required. Specifies whether to archive all current model versions in the target stage.
#' @param comment User-provided comment on the action.
#' @param name Required. Name of the model.
#' @param stage Required. Target stage of the transition.
#' @param version Required. Version of the model.
#'
#' @keywords internal
#'
#' @rdname model_registry_transition_stage
#'
#' @aliases model_registry_transition_stage
model_registry_transition_stage <- function(name, version, stage, archive_existing_versions,
  comment = NULL) {
  body <- list(archive_existing_versions = archive_existing_versions, comment = comment,
    name = name, stage = stage, version = version)
  .state$api$do("POST", "/api/2.0/mlflow/databricks/model-versions/transition-stage",
    body = body)
}
model_registry$transition_stage <- model_registry_transition_stage

#' Update a comment.
#' 
#' Post an edit to a comment on a model version.
#'
#' @param comment Required. User-provided comment on the action.
#' @param id Required. Unique identifier of an activity.
#'
#' @keywords internal
#'
#' @rdname model_registry_update_comment
#'
#' @aliases model_registry_update_comment
model_registry_update_comment <- function(id, comment) {
  body <- list(comment = comment, id = id)
  .state$api$do("PATCH", "/api/2.0/mlflow/comments/update", body = body)
}
model_registry$update_comment <- model_registry_update_comment

#' Update model.
#' 
#' Updates a registered model.
#'
#' @param description If provided, updates the description for this `registered_model`.
#' @param name Required. Registered model unique name identifier.
#'
#' @keywords internal
#'
#' @rdname model_registry_update_model
#'
#' @aliases model_registry_update_model
model_registry_update_model <- function(name, description = NULL) {
  body <- list(description = description, name = name)
  .state$api$do("PATCH", "/api/2.0/mlflow/registered-models/update", body = body)
}
model_registry$update_model <- model_registry_update_model

#' Update model version.
#' 
#' Updates the model version.
#'
#' @param description If provided, updates the description for this `registered_model`.
#' @param name Required. Name of the registered model.
#' @param version Required. Model version number.
#'
#' @keywords internal
#'
#' @rdname model_registry_update_model_version
#'
#' @aliases model_registry_update_model_version
model_registry_update_model_version <- function(name, version, description = NULL) {
  body <- list(description = description, name = name, version = version)
  .state$api$do("PATCH", "/api/2.0/mlflow/model-versions/update", body = body)
}
model_registry$update_model_version <- model_registry_update_model_version

#' Update a webhook.
#' 
#' **NOTE:** This endpoint is in Public Preview.
#' 
#' Updates a registry webhook.
#'
#' @param description User-specified description for the webhook.
#' @param events Events that can trigger a registry webhook: * `MODEL_VERSION_CREATED`: A new model version was created for the associated model.
#' @param http_url_spec 
#' @param id Required. Webhook ID.
#' @param job_spec 
#' @param status This describes an enum.
#'
#' @keywords internal
#'
#' @rdname model_registry_update_webhook
#'
#' @aliases model_registry_update_webhook
model_registry_update_webhook <- function(id, description = NULL, events = NULL,
  http_url_spec = NULL, job_spec = NULL, status = NULL) {
  body <- list(description = description, events = events, http_url_spec = http_url_spec,
    id = id, job_spec = job_spec, status = status)
  .state$api$do("PATCH", "/api/2.0/mlflow/registry-webhooks/update", body = body)
}
model_registry$update_webhook <- model_registry_update_webhook

