# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' This API allows retrieving information about currently authenticated user or
#' service principal.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=current_user_me]{me} \tab Get current user info.\cr
#' }
#'
#' @rdname current_user
#' @export
current_user <- list()

#' Get current user info.
#' 
#' Get details about the current method caller's identity.#'
#' @keywords internal
#'
#' @rdname current_user_me
#'
#' @aliases current_user_me
current_user_me <- function() {
  .api$do("GET", "/api/2.0/preview/scim/v2/Me")
}
current_user$me <- current_user_me

