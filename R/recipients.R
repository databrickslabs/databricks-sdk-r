# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Databricks Delta Sharing: Recipients REST API
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=recipients_create]{create} \tab Create a share recipient.\cr
#'  \link[=recipients_delete]{delete} \tab Delete a share recipient.\cr
#'  \link[=recipients_get]{get} \tab Get a share recipient.\cr
#'  \link[=recipients_list]{list} \tab List share recipients.\cr
#'  \link[=recipients_rotate_token]{rotate_token} \tab Rotate a token.\cr
#'  \link[=recipients_share_permissions]{share_permissions} \tab Get recipient share permissions.\cr
#'  \link[=recipients_update]{update} \tab Update a share recipient.\cr
#' }
#'
#' @rdname recipients
#' @export
recipients <- list()

#' Create a share recipient.
#' 
#' Creates a new recipient with the delta sharing authentication type in the
#' metastore. The caller must be a metastore admin or has the
#' **CREATE_RECIPIENT** privilege on the metastore.
#'
#' @param authentication_type Required. The delta sharing authentication type.
#' @param comment Description about the recipient.
#' @param data_recipient_global_metastore_id The global Unity Catalog metastore id provided by the data recipient.\n This field is required when the __authentication_type__ is **DATABRICKS**.\n The identifier is of format __cloud__:__region__:__metastore-uuid__.
#' @param ip_access_list IP Access List.
#' @param name Required. Name of Recipient.
#' @param owner Username of the recipient owner.
#' @param properties_kvpairs Recipient properties as map of string key-value pairs.\n.
#' @param sharing_code The one-time sharing code provided by the data recipient.
#'
#' @keywords internal
#'
#' @rdname recipients_create
#'
#' @aliases recipients_create
recipients_create <- function(name, authentication_type, comment = NULL, data_recipient_global_metastore_id = NULL,
  ip_access_list = NULL, owner = NULL, properties_kvpairs = NULL, sharing_code = NULL) {
  body <- list(authentication_type = authentication_type, comment = comment, data_recipient_global_metastore_id = data_recipient_global_metastore_id,
    ip_access_list = ip_access_list, name = name, owner = owner, properties_kvpairs = properties_kvpairs,
    sharing_code = sharing_code)
  .state$api$do("POST", "/api/2.1/unity-catalog/recipients", body = body)
}
recipients$create <- recipients_create

#' Delete a share recipient.
#' 
#' Deletes the specified recipient from the metastore. The caller must be the
#' owner of the recipient.
#'
#' @param name Required. Name of the recipient.
#'
#' @keywords internal
#'
#' @rdname recipients_delete
#'
#' @aliases recipients_delete
recipients_delete <- function(name) {

  .state$api$do("DELETE", paste("/api/2.1/unity-catalog/recipients/", name, sep = ""))
}
recipients$delete <- recipients_delete

#' Get a share recipient.
#' 
#' Gets a share recipient from the metastore if:
#' 
#' * the caller is the owner of the share recipient, or: * is a metastore admin
#'
#' @param name Required. Name of the recipient.
#'
#' @keywords internal
#'
#' @rdname recipients_get
#'
#' @aliases recipients_get
recipients_get <- function(name) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/recipients/", name, sep = ""))
}
recipients$get <- recipients_get

#' List share recipients.
#' 
#' Gets an array of all share recipients within the current metastore where:
#' 
#' * the caller is a metastore admin, or * the caller is the owner. There is no
#' guarantee of a specific ordering of the elements in the array.
#'
#' @param data_recipient_global_metastore_id If not provided, all recipients will be returned.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname recipients_list
#'
#' @aliases recipients_list
recipients_list <- function(data_recipient_global_metastore_id = NULL) {
  query <- list(data_recipient_global_metastore_id = data_recipient_global_metastore_id)

  json <- .state$api$do("GET", "/api/2.1/unity-catalog/recipients", query = query)
  return(json$recipients)

}
recipients$list <- recipients_list

#' Rotate a token.
#' 
#' Refreshes the specified recipient's delta sharing authentication token with
#' the provided token info. The caller must be the owner of the recipient.
#'
#' @param existing_token_expire_in_seconds Required. The expiration time of the bearer token in ISO 8601 format.
#' @param name Required. The name of the recipient.
#'
#' @keywords internal
#'
#' @rdname recipients_rotate_token
#'
#' @aliases recipients_rotate_token
recipients_rotate_token <- function(existing_token_expire_in_seconds, name) {
  body <- list(existing_token_expire_in_seconds = existing_token_expire_in_seconds)
  .state$api$do("POST", paste("/api/2.1/unity-catalog/recipients/", name, "/rotate-token",
    , sep = ""), body = body)
}
recipients$rotate_token <- recipients_rotate_token

#' Get recipient share permissions.
#' 
#' Gets the share permissions for the specified Recipient. The caller must be a
#' metastore admin or the owner of the Recipient.
#'
#' @param name Required. The name of the Recipient.
#'
#' @keywords internal
#'
#' @rdname recipients_share_permissions
#'
#' @aliases recipients_share_permissions
recipients_share_permissions <- function(name) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/recipients/", name, "/share-permissions",
    , sep = ""))
}
recipients$share_permissions <- recipients_share_permissions

#' Update a share recipient.
#' 
#' Updates an existing recipient in the metastore. The caller must be a
#' metastore admin or the owner of the recipient. If the recipient name will be
#' updated, the user must be both a metastore admin and the owner of the
#' recipient.
#'
#' @param comment Description about the recipient.
#' @param ip_access_list IP Access List.
#' @param name Name of Recipient.
#' @param owner Username of the recipient owner.
#' @param properties_kvpairs Recipient properties as map of string key-value pairs.\n When provided in update request, the specified properties will override the existing properties.
#'
#' @keywords internal
#'
#' @rdname recipients_update
#'
#' @aliases recipients_update
recipients_update <- function(name, comment = NULL, ip_access_list = NULL, owner = NULL,
  properties_kvpairs = NULL) {
  body <- list(comment = comment, ip_access_list = ip_access_list, name = name,
    owner = owner, properties_kvpairs = properties_kvpairs)
  .state$api$do("PATCH", paste("/api/2.1/unity-catalog/recipients/", name, sep = ""),
    body = body)
}
recipients$update <- recipients_update

