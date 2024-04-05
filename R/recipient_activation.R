# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get a share activation URL.
#' 
#' Gets an activation URL for a share.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param activation_url Required. The one time activation url.
#'
#'
#' @rdname get_recipient_activation_url_info
#' @alias recipientActivationGetActivationUrlInfo
#' @export
get_recipient_activation_url_info <- function(client, activation_url) {

  client$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation_info/",
    activation_url, sep = ""))
}

#' @rdname get_recipient_activation_url_info
#' @export 
recipientActivationGetActivationUrlInfo <- get_recipient_activation_url_info
#' Get an access token.
#' 
#' Retrieve access token with an activation url. This is a public API without
#' any authentication.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param activation_url Required. The one time activation url.
#'
#'
#' @rdname retrieve_recipient_activation_token
#' @alias recipientActivationRetrieveToken
#' @export
retrieve_recipient_activation_token <- function(client, activation_url) {

  client$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation/",
    activation_url, sep = ""))
}

#' @rdname retrieve_recipient_activation_token
#' @export 
recipientActivationRetrieveToken <- retrieve_recipient_activation_token


