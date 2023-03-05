# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Databricks Delta Sharing: Recipient Activation REST API
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=recipient_activation_get_activation_url_info]{get_activation_url_info} \tab Get a share activation URL.\cr
#'  \link[=recipient_activation_retrieve_token]{retrieve_token} \tab Get an access token.\cr
#' }
#'
#' @rdname recipient_activation
#' @export
recipient_activation <- list()

#' Get a share activation URL.
#' 
#' Gets an activation URL for a share.
#'
#' @param activation_url Required. The one time activation url.
#'
#' @keywords internal
#'
#' @rdname recipient_activation_get_activation_url_info
#'
#' @aliases recipient_activation_get_activation_url_info
recipient_activation_get_activation_url_info <- function(activation_url) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation_info/",
    activation_url, sep = ""))
}
recipient_activation$get_activation_url_info <- recipient_activation_get_activation_url_info

#' Get an access token.
#' 
#' Retrieve access token with an activation url. This is a public API without
#' any authentication.
#'
#' @param activation_url Required. The one time activation url.
#'
#' @keywords internal
#'
#' @rdname recipient_activation_retrieve_token
#'
#' @aliases recipient_activation_retrieve_token
recipient_activation_retrieve_token <- function(activation_url) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/public/data_sharing_activation/",
    activation_url, sep = ""))
}
recipient_activation$retrieve_token <- recipient_activation_retrieve_token

