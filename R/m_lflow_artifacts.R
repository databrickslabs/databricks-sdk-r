# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.


#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=m_lflow_artifacts_list]{list} \tab Get all artifacts.\cr
#' }
#'
#' @rdname m_lflow_artifacts
#' @export
m_lflow_artifacts <- list()

#' Get all artifacts.
#' 
#' List artifacts for a run. Takes an optional `artifact_path` prefix. If it is
#' specified, the response contains only artifacts with the specified prefix.',
#'
#' @param page_token Token indicating the page of artifact results to fetch.
#' @param path Filter artifacts matching this path (a relative path from the root artifact directory).
#' @param run_id ID of the run whose artifacts to list.
#' @param run_uuid [Deprecated, use run_id instead] ID of the run whose artifacts to list.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname m_lflow_artifacts_list
#'
#' @aliases m_lflow_artifacts_list
m_lflow_artifacts_list <- function(page_token = NULL, path = NULL, run_id = NULL,
  run_uuid = NULL, ...) {
  query <- list(page_token = page_token, path = path, run_id = run_id, run_uuid = run_uuid,
    ...)



  results <- data.frame()
  while (TRUE) {
    json <- .api$do("GET", "/api/2.0/mlflow/artifacts/list", query = query)
    if (is.null(nrow(json$files))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$files)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}
m_lflow_artifacts$list <- m_lflow_artifacts_list













