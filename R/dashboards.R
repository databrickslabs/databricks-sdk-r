# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a dashboard object.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param dashboard_filters_enabled Indicates whether the dashboard filters are enabled.
#' @param is_favorite Indicates whether this dashboard object should appear in the current user's favorites list.
#' @param name Required. The title of this dashboard that appears in list views and at the top of the dashboard page.
#' @param parent The identifier of the workspace folder containing the object.
#' @param run_as_role Sets the **Run as** role for the object.
#' @param tags 
#'
#' @rdname dashboardsCreate
#' @export
dashboardsCreate <- function(client, name, dashboard_filters_enabled = NULL, is_favorite = NULL,
  parent = NULL, run_as_role = NULL, tags = NULL) {
  body <- list(dashboard_filters_enabled = dashboard_filters_enabled, is_favorite = is_favorite,
    name = name, parent = parent, run_as_role = run_as_role, tags = tags)
  client$do("POST", "/api/2.0/preview/sql/dashboards", body = body)
}

#' Remove a dashboard.
#' 
#' Moves a dashboard to the trash. Trashed dashboards do not appear in list
#' views or searches, and cannot be shared.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param dashboard_id Required. 
#'
#' @rdname dashboardsDelete
#' @export
dashboardsDelete <- function(client, dashboard_id) {

  client$do("DELETE", paste("/api/2.0/preview/sql/dashboards/", dashboard_id, sep = ""))
}

#' Retrieve a definition.
#' 
#' Returns a JSON representation of a dashboard object, including its
#' visualization and query objects.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param dashboard_id Required. 
#'
#' @rdname dashboardsGet
#' @export
dashboardsGet <- function(client, dashboard_id) {

  client$do("GET", paste("/api/2.0/preview/sql/dashboards/", dashboard_id, sep = ""))
}

#' Get dashboard objects.
#' 
#' Fetch a paginated list of dashboard objects.
#' 
#' ### **Warning: Calling this API concurrently 10 or more times could result in
#' throttling, service degradation, or a temporary ban.**
#' @param client Required. Instance of DatabricksClient()


#'
#' @param order Name of dashboard attribute to order by.
#' @param page Page number to retrieve.
#' @param page_size Number of dashboards to return per page.
#' @param q Full text search term.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname dashboardsList
#' @export
dashboardsList <- function(client, order = NULL, page = NULL, page_size = NULL, q = NULL) {
  query <- list(order = order, page = page, page_size = page_size, q = q)

  query$page = 1
  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/preview/sql/dashboards", query = query)
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

#' Restore a dashboard.
#' 
#' A restored dashboard appears in list views and searches and can be shared.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param dashboard_id Required. 
#'
#' @rdname dashboardsRestore
#' @export
dashboardsRestore <- function(client, dashboard_id) {

  client$do("POST", paste("/api/2.0/preview/sql/dashboards/trash/", dashboard_id,
    sep = ""))
}

#' Change a dashboard definition.
#' 
#' Modify this dashboard definition. This operation only affects attributes of
#' the dashboard object. It does not add, modify, or remove widgets.
#' 
#' **Note**: You cannot undo this operation.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param dashboard_id Required. 
#' @param name The title of this dashboard that appears in list views and at the top of the dashboard page.
#' @param run_as_role Sets the **Run as** role for the object.
#'
#' @rdname dashboardsUpdate
#' @export
dashboardsUpdate <- function(client, dashboard_id, name = NULL, run_as_role = NULL) {
  body <- list(name = name, run_as_role = run_as_role)
  client$do("POST", paste("/api/2.0/preview/sql/dashboards/", dashboard_id, sep = ""),
    body = body)
}

