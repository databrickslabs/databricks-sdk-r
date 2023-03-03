# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a dashboard object.
#'
#' @param dashboard_filters_enabled In the web application, query filters that share a name are coupled to a single selection box if this value is true.
#' @param is_draft Draft dashboards only appear in list views for their owners.
#' @param is_trashed Indicates whether the dashboard is trashed.
#' @param name The title of this dashboard that appears in list views and at the top of the dashboard page.
#' @param parent The identifier of the workspace folder containing the dashboard.
#' @param tags 
#' @param widgets An array of widget objects.
databricks_dashboards_create <- function(dashboard_filters_enabled = NULL, 
    is_draft = NULL, 
    is_trashed = NULL, 
    name = NULL, 
    parent = NULL, 
    tags = NULL, 
    widgets = NULL, 
    ...) {
    body <- list(
        dashboard_filters_enabled = dashboard_filters_enabled, 
        is_draft = is_draft, 
        is_trashed = is_trashed, 
        name = name, 
        parent = parent, 
        tags = tags, 
        widgets = widgets, ...)
    
    .api$do("POST", "/api/2.0/preview/sql/dashboards", body = body)
}

#' Remove a dashboard.
#' 
#' Moves a dashboard to the trash. Trashed dashboards do not appear in list
#' views or searches, and cannot be shared.
#'
#' @param dashboard_id 
databricks_dashboards_delete <- function(dashboard_id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/preview/sql/dashboards/", dashboard_id, sep = ""))
}

#' Retrieve a definition.
#' 
#' Returns a JSON representation of a dashboard object, including its
#' visualization and query objects.
#'
#' @param dashboard_id 
databricks_dashboards_get <- function(dashboard_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/preview/sql/dashboards/", dashboard_id, sep = ""))
}

#' Get dashboard objects.
#' 
#' Fetch a paginated list of dashboard objects.
#'
#' @param order Name of dashboard attribute to order by.
#' @param page Page number to retrieve.
#' @param page_size Number of dashboards to return per page.
#' @param q Full text search term.
databricks_dashboards_list <- function(order = NULL, 
    page = NULL, 
    page_size = NULL, 
    q = NULL, 
    ...) {
    query <- list(
        order = order, 
        page = page, 
        page_size = page_size, 
        q = q, ...)
    
    
    
    query$page = 1
    results <- data.frame()
    while (TRUE) {
        json <- .api$do("GET", "/api/2.0/preview/sql/dashboards", query = query)
        if (is.null(nrow(json$results))) {
            break
        }
        # append this page of results to one results data.frame
        results <- dplyr::bind_rows(results, json$results)
        query$page <- query$page + 1
    }
    # de-duplicate any records via id column
    results <- results[!duplicated(results$id), ]
    return (results)
    
}

#' Restore a dashboard.
#' 
#' A restored dashboard appears in list views and searches and can be shared.
#'
#' @param dashboard_id 
databricks_dashboards_restore <- function(dashboard_id, ...) {
    
    
    .api$do("POST", paste("/api/2.0/preview/sql/dashboards/trash/", dashboard_id, sep = ""))
}











