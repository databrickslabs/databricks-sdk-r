# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Databricks Providers REST API
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=providers_create]{create} \tab Create an auth provider.\cr
#'  \link[=providers_delete]{delete} \tab Delete a provider.\cr
#'  \link[=providers_get]{get} \tab Get a provider.\cr
#'  \link[=providers_list]{list} \tab List providers.\cr
#'  \link[=providers_list_shares]{list_shares} \tab List shares by Provider.\cr
#'  \link[=providers_update]{update} \tab Update a provider.\cr
#' }
#'
#' @rdname providers
#' @export
providers <- list()

#' Create an auth provider.
#' 
#' Creates a new authentication provider minimally based on a name and
#' authentication type. The caller must be an admin on the metastore.
#'
#' @param authentication_type Required. The delta sharing authentication type.
#' @param comment Description about the provider.
#' @param name Required. The name of the Provider.
#' @param recipient_profile_str This field is required when the __authentication_type__ is **TOKEN** or not provided.
#'
#' @keywords internal
#'
#' @rdname providers_create
#'
#' @aliases providers_create
providers_create <- function(name, authentication_type, comment = NULL, recipient_profile_str = NULL) {
  body <- list(authentication_type = authentication_type, comment = comment, name = name,
    recipient_profile_str = recipient_profile_str)
  .state$api$do("POST", "/api/2.1/unity-catalog/providers", body = body)
}
providers$create <- providers_create

#' Delete a provider.
#' 
#' Deletes an authentication provider, if the caller is a metastore admin or is
#' the owner of the provider.
#'
#' @param name Required. Name of the provider.
#'
#' @keywords internal
#'
#' @rdname providers_delete
#'
#' @aliases providers_delete
providers_delete <- function(name) {

  .state$api$do("DELETE", paste("/api/2.1/unity-catalog/providers/", name, sep = ""))
}
providers$delete <- providers_delete

#' Get a provider.
#' 
#' Gets a specific authentication provider. The caller must supply the name of
#' the provider, and must either be a metastore admin or the owner of the
#' provider.
#'
#' @param name Required. Name of the provider.
#'
#' @keywords internal
#'
#' @rdname providers_get
#'
#' @aliases providers_get
providers_get <- function(name) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/providers/", name, sep = ""))
}
providers$get <- providers_get

#' List providers.
#' 
#' Gets an array of available authentication providers. The caller must either
#' be a metastore admin or the owner of the providers. Providers not owned by
#' the caller are not included in the response. There is no guarantee of a
#' specific ordering of the elements in the array.
#'
#' @param data_provider_global_metastore_id If not provided, all providers will be returned.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname providers_list
#'
#' @aliases providers_list
providers_list <- function(data_provider_global_metastore_id = NULL) {
  query <- list(data_provider_global_metastore_id = data_provider_global_metastore_id)

  json <- .state$api$do("GET", "/api/2.1/unity-catalog/providers", query = query)
  return(json$providers)

}
providers$list <- providers_list

#' List shares by Provider.
#' 
#' Gets an array of a specified provider's shares within the metastore where:
#' 
#' * the caller is a metastore admin, or * the caller is the owner.
#'
#' @param name Required. Name of the provider in which to list shares.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname providers_list_shares
#'
#' @aliases providers_list_shares
providers_list_shares <- function(name) {


  json <- .state$api$do("GET", paste("/api/2.1/unity-catalog/providers/", name,
    "/shares", , sep = ""))
  return(json$shares)

}
providers$list_shares <- providers_list_shares

#' Update a provider.
#' 
#' Updates the information for an authentication provider, if the caller is a
#' metastore admin or is the owner of the provider. If the update changes the
#' provider name, the caller must be both a metastore admin and the owner of the
#' provider.
#'
#' @param comment Description about the provider.
#' @param name The name of the Provider.
#' @param owner Username of Provider owner.
#' @param recipient_profile_str This field is required when the __authentication_type__ is **TOKEN** or not provided.
#'
#' @keywords internal
#'
#' @rdname providers_update
#'
#' @aliases providers_update
providers_update <- function(name, comment = NULL, owner = NULL, recipient_profile_str = NULL) {
  body <- list(comment = comment, name = name, owner = owner, recipient_profile_str = recipient_profile_str)
  .state$api$do("PATCH", paste("/api/2.1/unity-catalog/providers/", name, sep = ""),
    body = body)
}
providers$update <- providers_update

