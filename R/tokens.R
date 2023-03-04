# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a user token.
#' 
#' Creates and returns a token for a user. If this call is made through token
#' authentication, it creates a token with the same client ID as the
#' authenticated token. If the user's token quota is exceeded, this call returns
#' an error **QUOTA_EXCEEDED**.
#'
#' @param comment Optional description to attach to the token.
#' @param lifetime_seconds The lifetime of the token, in seconds.
tokens_create <- function(comment = NULL, 
    lifetime_seconds = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        lifetime_seconds = lifetime_seconds, ...)
    
    .api$do("POST", "/api/2.0/token/create", body = body)
}

#' Revoke token.
#' 
#' Revokes an access token.
#' 
#' If a token with the specified ID is not valid, this call returns an error
#' **RESOURCE_DOES_NOT_EXIST**.
#'
#' @param token_id The ID of the token to be revoked.
tokens_delete <- function(token_id, ...) {
    body <- list(
        token_id = token_id, ...)
    
    .api$do("POST", "/api/2.0/token/delete", body = body)
}

#' List tokens.
#' 
#' Lists all the valid tokens for a user-workspace pair.
tokens_list <- function(...) {
    
    
    json <- .api$do("GET", "/api/2.0/token/list")
    return (json$token_infos)
    
}













