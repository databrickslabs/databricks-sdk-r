# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Enables administrators to get all tokens and delete tokens for other users.
#' Admins can either get every token, get a specific token by ID, or get all
#' tokens for a particular user.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=token_management_create_obo_token]{create_obo_token} \tab Create on-behalf token.\cr
#'  \link[=token_management_delete]{delete} \tab Delete a token.\cr
#'  \link[=token_management_get]{get} \tab Get token info.\cr
#'  \link[=token_management_list]{list} \tab List all tokens.\cr
#' }
#'
#' @rdname token_management
#' @export
token_management <- list()

#' Create on-behalf token.
#' 
#' Creates a token on behalf of a service principal.
#'
#' @param application_id Required. Application ID of the service principal.
#' @param comment Comment that describes the purpose of the token.
#' @param lifetime_seconds Required. The number of seconds before the token expires.
#'
#' @keywords internal
#'
#' @rdname token_management_create_obo_token
#'
#' @aliases token_management_create_obo_token
token_management_create_obo_token <- function(application_id, lifetime_seconds, comment = NULL) {
  body <- list(application_id = application_id, comment = comment, lifetime_seconds = lifetime_seconds)
  .state$api$do("POST", "/api/2.0/token-management/on-behalf-of/tokens", body = body)
}
token_management$create_obo_token <- token_management_create_obo_token

#' Delete a token.
#' 
#' Deletes a token, specified by its ID.
#'
#' @param token_id Required. The ID of the token to get.
#'
#' @keywords internal
#'
#' @rdname token_management_delete
#'
#' @aliases token_management_delete
token_management_delete <- function(token_id) {

  .state$api$do("DELETE", paste("/api/2.0/token-management/tokens/", token_id,
    sep = ""))
}
token_management$delete <- token_management_delete

#' Get token info.
#' 
#' Gets information about a token, specified by its ID.
#'
#' @param token_id Required. The ID of the token to get.
#'
#' @keywords internal
#'
#' @rdname token_management_get
#'
#' @aliases token_management_get
token_management_get <- function(token_id) {

  .state$api$do("GET", paste("/api/2.0/token-management/tokens/", token_id, sep = ""))
}
token_management$get <- token_management_get

#' List all tokens.
#' 
#' Lists all tokens associated with the specified workspace or user.
#'
#' @param created_by_id User ID of the user that created the token.
#' @param created_by_username Username of the user that created the token.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname token_management_list
#'
#' @aliases token_management_list
token_management_list <- function(created_by_id = NULL, created_by_username = NULL) {
  query <- list(created_by_id = created_by_id, created_by_username = created_by_username)

  json <- .state$api$do("GET", "/api/2.0/token-management/tokens", query = query)
  return(json$token_infos)

}
token_management$list <- token_management_list

