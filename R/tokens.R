# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a user token.
#' 
#' Creates and returns a token for a user. If this call is made through token
#' authentication, it creates a token with the same client ID as the
#' authenticated token. If the user's token quota is exceeded, this call returns
#' an error **QUOTA_EXCEEDED**.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment Optional description to attach to the token.
#' @param lifetime_seconds The lifetime of the token, in seconds.
#'
#' @rdname create_token
#' @alias tokensCreate
#' @export
create_token <- function(client, comment = NULL, lifetime_seconds = NULL) {
  body <- list(comment = comment, lifetime_seconds = lifetime_seconds)
  client$do("POST", "/api/2.0/token/create", body = body)
}

#' @rdname create_token
#' @export 
tokensCreate <- create_token
#' Revoke token.
#' 
#' Revokes an access token.
#' 
#' If a token with the specified ID is not valid, this call returns an error
#' **RESOURCE_DOES_NOT_EXIST**.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param token_id Required. The ID of the token to be revoked.
#'
#' @rdname delete_token
#' @alias tokensDelete
#' @export
delete_token <- function(client, token_id) {
  body <- list(token_id = token_id)
  client$do("POST", "/api/2.0/token/delete", body = body)
}

#' @rdname delete_token
#' @export 
tokensDelete <- delete_token
#' List tokens.
#' 
#' Lists all the valid tokens for a user-workspace pair.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_tokens
#' @alias tokensList
#' @export
list_tokens <- function(client) {

  json <- client$do("GET", "/api/2.0/token/list")
  return(json$token_infos)

}

#' @rdname list_tokens
#' @export 
tokensList <- list_tokens



