# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get history of a given metric within a run.
#' 
#' Gets a list of all values for the specified metric for a given run.
#'
#' @param max_results Maximum number of Metric records to return per paginated request.
#' @param metric_key Name of the metric.
#' @param page_token Token indicating the page of metric histories to fetch.
#' @param run_id ID of the run from which to fetch metric values.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run from which to fetch metric values.
databricks_m_lflow_metrics_get_history <- function(metric_key, max_results = NULL, 
    page_token = NULL, 
    run_id = NULL, 
    run_uuid = NULL, 
    ...) {
    query <- list(
        max_results = max_results, 
        metric_key = metric_key, 
        page_token = page_token, 
        run_id = run_id, 
        run_uuid = run_uuid, ...)
    .api$do("GET", "/api/2.0/mlflow/metrics/get-history", query = query)
}

