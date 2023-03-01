# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create on-behalf token.
#' 
#' Creates a token on behalf of a service principal.
#'
#' @param application_id Application ID of the service principal.
#' @param comment Comment that describes the purpose of the token.
#' @param lifetime_seconds The number of seconds before the token expires.
databricks_token_management_create_obo_token <- function(application_id, lifetime_seconds, comment = NULL, 
    ...) {
    body <- list(
        application_id = application_id, 
        comment = comment, 
        lifetime_seconds = lifetime_seconds, ...)
    .api$do("POST", "/api/2.0/token-management/on-behalf-of/tokens", body = body)
}

#' Delete a token.
#' 
#' Deletes a token, specified by its ID.
#'
#' @param token_id The ID of the token to get.
databricks_token_management_delete <- function(token_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/token-management/tokens/", token_id, sep = ""))
}

#' Get token info.
#' 
#' Gets information about a token, specified by its ID.
#'
#' @param token_id The ID of the token to get.
databricks_token_management_get <- function(token_id, ...) {
    
    .api$do("GET", paste("/api/2.0/token-management/tokens/", token_id, sep = ""))
}

#' List all tokens.
#' 
#' Lists all tokens associated with the specified workspace or user.
#'
#' @param created_by_id User ID of the user that created the token.
#' @param created_by_username Username of the user that created the token.
databricks_token_management_list <- function(created_by_id = NULL, 
    created_by_username = NULL, 
    ...) {
    query <- list(
        created_by_id = created_by_id, 
        created_by_username = created_by_username, ...)
    .api$do("GET", "/api/2.0/token-management/tokens", query = query)
}

