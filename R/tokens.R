# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' The Token API allows you to create, list, and revoke tokens that can be used
#' to authenticate and access Databricks REST APIs.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=tokens_create]{create} \tab Create a user token.\cr
#'  \link[=tokens_delete]{delete} \tab Revoke token.\cr
#'  \link[=tokens_list]{list} \tab List tokens.\cr
#' }
#'
#' @rdname tokens
#' @export
tokens <- list()

#' Create a user token.
#' 
#' Creates and returns a token for a user. If this call is made through token
#' authentication, it creates a token with the same client ID as the
#' authenticated token. If the user's token quota is exceeded, this call returns
#' an error **QUOTA_EXCEEDED**.
#'
#' @param comment Optional description to attach to the token.
#' @param lifetime_seconds The lifetime of the token, in seconds.
#'
#' @keywords internal
#'
#' @rdname tokens_create
#'
#' @aliases tokens_create
tokens_create <- function(comment = NULL, lifetime_seconds = NULL) {
  body <- list(comment = comment, lifetime_seconds = lifetime_seconds)
  .state$api$do("POST", "/api/2.0/token/create", body = body)
}
tokens$create <- tokens_create

#' Revoke token.
#' 
#' Revokes an access token.
#' 
#' If a token with the specified ID is not valid, this call returns an error
#' **RESOURCE_DOES_NOT_EXIST**.
#'
#' @param token_id Required. The ID of the token to be revoked.
#'
#' @keywords internal
#'
#' @rdname tokens_delete
#'
#' @aliases tokens_delete
tokens_delete <- function(token_id) {
  body <- list(token_id = token_id)
  .state$api$do("POST", "/api/2.0/token/delete", body = body)
}
tokens$delete <- tokens_delete

#' List tokens.
#' 
#' Lists all the valid tokens for a user-workspace pair.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname tokens_list
#'
#' @aliases tokens_list
tokens_list <- function() {

  json <- .state$api$do("GET", "/api/2.0/token/list")
  return(json$token_infos)

}
tokens$list <- tokens_list

