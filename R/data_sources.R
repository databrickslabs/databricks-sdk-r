# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get a list of SQL warehouses.
#' 
#' Retrieves a full list of SQL warehouses available in this workspace. All
#' fields that appear in this API response are enumerated for clarity. However,
#' you need only a SQL warehouse's `id` to create new queries against it.
data_sources_list <- function(...) {
    
    .api$do("GET", "/api/2.0/preview/sql/data_sources")
}













