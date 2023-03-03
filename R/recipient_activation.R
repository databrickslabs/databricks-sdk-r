# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Get a share activation URL.
#' 
#' Gets an activation URL for a share.
#'
#' @param activation_url The one time activation url.
databricks_recipient_activation_get_activation_url_info <- function(activation_url, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation_info/", activation_url, sep = ""))
}

#' Get an access token.
#' 
#' Retrieve access token with an activation url. This is a public API without
#' any authentication.
#'
#' @param activation_url The one time activation url.
databricks_recipient_activation_retrieve_token <- function(activation_url, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation/", activation_url, sep = ""))
}











