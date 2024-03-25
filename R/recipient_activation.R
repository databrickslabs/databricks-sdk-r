# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get a share activation URL.
#' 
#' Gets an activation URL for a share.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param activation_url Required. The one time activation url.
#'
#' @rdname recipientActivationGetActivationUrlInfo
#' @export
recipientActivationGetActivationUrlInfo <- function(client, activation_url) {

  client$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation_info/",
    activation_url, sep = ""))
}

#' Get an access token.
#' 
#' Retrieve access token with an activation url. This is a public API without
#' any authentication.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param activation_url Required. The one time activation url.
#'
#' @rdname recipientActivationRetrieveToken
#' @export
recipientActivationRetrieveToken <- function(client, activation_url) {

  client$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation/",
    activation_url, sep = ""))
}

