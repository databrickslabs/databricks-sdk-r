# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get all artifacts.
#' 
#' List artifacts for a run. Takes an optional `artifact_path` prefix. If it is
#' specified, the response contains only artifacts with the specified prefix.",
#'
#' @param page_token Token indicating the page of artifact results to fetch.
#' @param path Filter artifacts matching this path (a relative path from the root artifact directory).
#' @param run_id ID of the run whose artifacts to list.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run whose artifacts to list.
databricks_m_lflow_artifacts_list <- function(page_token = NULL, 
    path = NULL, 
    run_id = NULL, 
    run_uuid = NULL, 
    ...) {
    query <- list(
        page_token = page_token, 
        path = path, 
        run_id = run_id, 
        run_uuid = run_uuid, ...)
    .api$do("GET", "/api/2.0/mlflow/artifacts/list", query = query)
}

