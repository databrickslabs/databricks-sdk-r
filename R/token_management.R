# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create on-behalf token.
#' 
#' Creates a token on behalf of a service principal.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param application_id Required. Application ID of the service principal.
#' @param comment Comment that describes the purpose of the token.
#' @param lifetime_seconds Required. The number of seconds before the token expires.
#'
#' @rdname tokenManagementCreateOboToken
#' @export
tokenManagementCreateOboToken <- function(client, application_id, lifetime_seconds,
  comment = NULL) {
  body <- list(application_id = application_id, comment = comment, lifetime_seconds = lifetime_seconds)
  client$do("POST", "/api/2.0/token-management/on-behalf-of/tokens", body = body)
}

#' Delete a token.
#' 
#' Deletes a token, specified by its ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param token_id Required. The ID of the token to get.
#'
#' @rdname tokenManagementDelete
#' @export
tokenManagementDelete <- function(client, token_id) {

  client$do("DELETE", paste("/api/2.0/token-management/tokens/", token_id, sep = ""))
}

#' Get token info.
#' 
#' Gets information about a token, specified by its ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param token_id Required. The ID of the token to get.
#'
#' @rdname tokenManagementGet
#' @export
tokenManagementGet <- function(client, token_id) {

  client$do("GET", paste("/api/2.0/token-management/tokens/", token_id, sep = ""))
}

#' List all tokens.
#' 
#' Lists all tokens associated with the specified workspace or user.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param created_by_id User ID of the user that created the token.
#' @param created_by_username Username of the user that created the token.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname tokenManagementList
#' @export
tokenManagementList <- function(client, created_by_id = NULL, created_by_username = NULL) {
  query <- list(created_by_id = created_by_id, created_by_username = created_by_username)

  json <- client$do("GET", "/api/2.0/token-management/tokens", query = query)
  return(json$token_infos)

}

