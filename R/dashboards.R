# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' In general, there is little need to modify dashboards using the API. However,
#' it can be useful to use dashboard objects to look-up a collection of related
#' query IDs. The API can also be used to duplicate multiple dashboards at once
#' since you can get a dashboard definition with a GET request and then POST it
#' to create a new one. Dashboards can be scheduled using the `sql_task` type of
#' the Jobs API, e.g. :method:jobs/create.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=dashboards_create]{create} \tab Create a dashboard object.\cr
#'  \link[=dashboards_delete]{delete} \tab Remove a dashboard.\cr
#'  \link[=dashboards_get]{get} \tab Retrieve a definition.\cr
#'  \link[=dashboards_list]{list} \tab Get dashboard objects.\cr
#'  \link[=dashboards_restore]{restore} \tab Restore a dashboard.\cr
#' }
#'
#' @rdname dashboards
#' @export
dashboards <- list()

#' Create a dashboard object.
#'
#' @param is_favorite Indicates whether this query object should appear in the current user's favorites list.
#' @param name The title of this dashboard that appears in list views and at the top of the dashboard page.
#' @param parent The identifier of the workspace folder containing the dashboard.
#' @param tags 
#'
#' @keywords internal
#'
#' @rdname dashboards_create
#'
#' @aliases dashboards_create
dashboards_create <- function(is_favorite = NULL, name = NULL, parent = NULL, tags = NULL) {
  body <- list(is_favorite = is_favorite, name = name, parent = parent, tags = tags)
  .state$api$do("POST", "/api/2.0/preview/sql/dashboards", body = body)
}
dashboards$create <- dashboards_create

#' Remove a dashboard.
#' 
#' Moves a dashboard to the trash. Trashed dashboards do not appear in list
#' views or searches, and cannot be shared.
#'
#' @param dashboard_id Required. 
#'
#' @keywords internal
#'
#' @rdname dashboards_delete
#'
#' @aliases dashboards_delete
dashboards_delete <- function(dashboard_id) {

  .state$api$do("DELETE", paste("/api/2.0/preview/sql/dashboards/", dashboard_id,
    sep = ""))
}
dashboards$delete <- dashboards_delete

#' Retrieve a definition.
#' 
#' Returns a JSON representation of a dashboard object, including its
#' visualization and query objects.
#'
#' @param dashboard_id Required. 
#'
#' @keywords internal
#'
#' @rdname dashboards_get
#'
#' @aliases dashboards_get
dashboards_get <- function(dashboard_id) {

  .state$api$do("GET", paste("/api/2.0/preview/sql/dashboards/", dashboard_id,
    sep = ""))
}
dashboards$get <- dashboards_get

#' Get dashboard objects.
#' 
#' Fetch a paginated list of dashboard objects.
#'
#' @param order Name of dashboard attribute to order by.
#' @param page Page number to retrieve.
#' @param page_size Number of dashboards to return per page.
#' @param q Full text search term.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname dashboards_list
#'
#' @aliases dashboards_list
dashboards_list <- function(order = NULL, page = NULL, page_size = NULL, q = NULL) {
  query <- list(order = order, page = page, page_size = page_size, q = q)

  query$page = 1
  results <- data.frame()
  while (TRUE) {
    json <- .state$api$do("GET", "/api/2.0/preview/sql/dashboards", query = query)
    if (is.null(nrow(json$results))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$results)
    query$page <- query$page + 1
  }
  # de-duplicate any records via id column
  results <- results[!duplicated(results$id), ]
  return(results)

}
dashboards$list <- dashboards_list

#' Restore a dashboard.
#' 
#' A restored dashboard appears in list views and searches and can be shared.
#'
#' @param dashboard_id Required. 
#'
#' @keywords internal
#'
#' @rdname dashboards_restore
#'
#' @aliases dashboards_restore
dashboards_restore <- function(dashboard_id) {

  .state$api$do("POST", paste("/api/2.0/preview/sql/dashboards/trash/", dashboard_id,
    sep = ""))
}
dashboards$restore <- dashboards_restore

