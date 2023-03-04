# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.


#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=registry_webhooks_create]{create} \tab Create a webhook.\cr
#'  \link[=registry_webhooks_delete]{delete} \tab Delete a webhook.\cr
#'  \link[=registry_webhooks_list]{list} \tab List registry webhooks.\cr
#'  \link[=registry_webhooks_test]{test} \tab Test a webhook.\cr
#'  \link[=registry_webhooks_update]{update} \tab Update a webhook.\cr
#' }
#'
#' @rdname registry_webhooks
#' @export
registry_webhooks <- list()

#' Create a webhook.
#' 
#' **NOTE**: This endpoint is in Public Preview.
#' 
#' Creates a registry webhook.
#'
#' @param description User-specified description for the webhook.
#' @param events [required] Events that can trigger a registry webhook: * `MODEL_VERSION_CREATED`: A new model version was created for the associated model.
#' @param http_url_spec 
#' @param job_spec 
#' @param model_name Name of the model whose events would trigger this webhook.
#' @param status This describes an enum.
#'
#' @keywords internal
#'
#' @rdname registry_webhooks_create
#'
#' @aliases registry_webhooks_create
registry_webhooks_create <- function(events, description = NULL, http_url_spec = NULL,
  job_spec = NULL, model_name = NULL, status = NULL, ...) {
  body <- list(description = description, events = events, http_url_spec = http_url_spec,
    job_spec = job_spec, model_name = model_name, status = status, ...)

  .api$do("POST", "/api/2.0/mlflow/registry-webhooks/create", body = body)
}
registry_webhooks$create <- registry_webhooks_create

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
#' @rdname registry_webhooks_delete
#'
#' @aliases registry_webhooks_delete
registry_webhooks_delete <- function(id = NULL, ...) {
  query <- list(id = id, ...)

  .api$do("DELETE", "/api/2.0/mlflow/registry-webhooks/delete", query = query)
}
registry_webhooks$delete <- registry_webhooks_delete

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
#' @rdname registry_webhooks_list
#'
#' @aliases registry_webhooks_list
registry_webhooks_list <- function(events = NULL, model_name = NULL, page_token = NULL,
  ...) {
  query <- list(events = events, model_name = model_name, page_token = page_token,
    ...)



  results <- data.frame()
  while (TRUE) {
    json <- .api$do("GET", "/api/2.0/mlflow/registry-webhooks/list", query = query)
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
registry_webhooks$list <- registry_webhooks_list

#' Test a webhook.
#' 
#' **NOTE:** This endpoint is in Public Preview.
#' 
#' Tests a registry webhook.
#'
#' @param event If `event` is specified, the test trigger uses the specified event.
#' @param id [required] Webhook ID.
#'
#' @keywords internal
#'
#' @rdname registry_webhooks_test
#'
#' @aliases registry_webhooks_test
registry_webhooks_test <- function(id, event = NULL, ...) {
  body <- list(event = event, id = id, ...)

  .api$do("POST", "/api/2.0/mlflow/registry-webhooks/test", body = body)
}
registry_webhooks$test <- registry_webhooks_test

#' Update a webhook.
#' 
#' **NOTE:** This endpoint is in Public Preview.
#' 
#' Updates a registry webhook.
#'
#' @param description User-specified description for the webhook.
#' @param events Events that can trigger a registry webhook: * `MODEL_VERSION_CREATED`: A new model version was created for the associated model.
#' @param http_url_spec 
#' @param id [required] Webhook ID.
#' @param job_spec 
#' @param status This describes an enum.
#'
#' @keywords internal
#'
#' @rdname registry_webhooks_update
#'
#' @aliases registry_webhooks_update
registry_webhooks_update <- function(id, description = NULL, events = NULL, http_url_spec = NULL,
  job_spec = NULL, status = NULL, ...) {
  body <- list(description = description, events = events, http_url_spec = http_url_spec,
    id = id, job_spec = job_spec, status = status, ...)

  .api$do("PATCH", "/api/2.0/mlflow/registry-webhooks/update", body = body)
}
registry_webhooks$update <- registry_webhooks_update













