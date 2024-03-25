# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Exchange token.
#' 
#' Exchange tokens with an Identity Provider to get a new access token. It
#' allows specifying scopes to determine token permissions.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param partition_id Required. The partition of Credentials store.
#' @param scopes Required. Array of scopes for the token request.
#' @param token_type Required. A list of token types being requested.
#'
#' @rdname credentialsManagerExchangeToken
#' @export
credentialsManagerExchangeToken <- function(client, partition_id, token_type, scopes) {
  body <- list(partitionId = partition_id, scopes = scopes, tokenType = token_type)
  client$do("POST", "/api/2.0/credentials-manager/exchange-tokens/token", body = body)
}

