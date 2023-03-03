# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get current user info.
#' 
#' Get details about the current method caller's identity.
databricks_current_user_me <- function(...) {
    
    .api$do("GET", "/api/2.0/preview/scim/v2/Me")
}











