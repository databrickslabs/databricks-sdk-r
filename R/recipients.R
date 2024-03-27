# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a share recipient.
#' 
#' Creates a new recipient with the delta sharing authentication type in the
#' metastore. The caller must be a metastore admin or has the
#' **CREATE_RECIPIENT** privilege on the metastore.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param authentication_type Required. The delta sharing authentication type.
#' @param comment Description about the recipient.
#' @param data_recipient_global_metastore_id The global Unity Catalog metastore id provided by the data recipient.
#' @param ip_access_list IP Access List.
#' @param name Required. Name of Recipient.
#' @param owner Username of the recipient owner.
#' @param properties_kvpairs Recipient properties as map of string key-value pairs.
#' @param sharing_code The one-time sharing code provided by the data recipient.
#'
#' @rdname create_recipient
#' @alias recipientsCreate
#' @export
create_recipient <- function(client, name, authentication_type, comment = NULL, data_recipient_global_metastore_id = NULL,
  ip_access_list = NULL, owner = NULL, properties_kvpairs = NULL, sharing_code = NULL) {
  body <- list(authentication_type = authentication_type, comment = comment, data_recipient_global_metastore_id = data_recipient_global_metastore_id,
    ip_access_list = ip_access_list, name = name, owner = owner, properties_kvpairs = properties_kvpairs,
    sharing_code = sharing_code)
  client$do("POST", "/api/2.1/unity-catalog/recipients", body = body)
}

#' @rdname create_recipient
#' @export 
recipientsCreate <- create_recipient
#' Delete a share recipient.
#' 
#' Deletes the specified recipient from the metastore. The caller must be the
#' owner of the recipient.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the recipient.
#'
#' @rdname delete_recipient
#' @alias recipientsDelete
#' @export
delete_recipient <- function(client, name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/recipients/", name, sep = ""))
}

#' @rdname delete_recipient
#' @export 
recipientsDelete <- delete_recipient
#' Get a share recipient.
#' 
#' Gets a share recipient from the metastore if:
#' 
#' * the caller is the owner of the share recipient, or: * is a metastore admin
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the recipient.
#'
#' @rdname get_recipient
#' @alias recipientsGet
#' @export
get_recipient <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/recipients/", name, sep = ""))
}

#' @rdname get_recipient
#' @export 
recipientsGet <- get_recipient
#' List share recipients.
#' 
#' Gets an array of all share recipients within the current metastore where:
#' 
#' * the caller is a metastore admin, or * the caller is the owner. There is no
#' guarantee of a specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param data_recipient_global_metastore_id If not provided, all recipients will be returned.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_recipients
#' @alias recipientsList
#' @export
list_recipients <- function(client, data_recipient_global_metastore_id = NULL) {
  query <- list(data_recipient_global_metastore_id = data_recipient_global_metastore_id)

  json <- client$do("GET", "/api/2.1/unity-catalog/recipients", query = query)
  return(json$recipients)

}

#' @rdname list_recipients
#' @export 
recipientsList <- list_recipients
#' Rotate a token.
#' 
#' Refreshes the specified recipient's delta sharing authentication token with
#' the provided token info. The caller must be the owner of the recipient.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param existing_token_expire_in_seconds Required. The expiration time of the bearer token in ISO 8601 format.
#' @param name Required. The name of the recipient.
#'
#' @rdname rotate_recipient_token
#' @alias recipientsRotateToken
#' @export
rotate_recipient_token <- function(client, name, existing_token_expire_in_seconds) {
  body <- list(existing_token_expire_in_seconds = existing_token_expire_in_seconds)
  client$do("POST", paste("/api/2.1/unity-catalog/recipients/", name, "/rotate-token",
    , sep = ""), body = body)
}

#' @rdname rotate_recipient_token
#' @export 
recipientsRotateToken <- rotate_recipient_token
#' Get recipient share permissions.
#' 
#' Gets the share permissions for the specified Recipient. The caller must be a
#' metastore admin or the owner of the Recipient.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the Recipient.
#'
#' @rdname share_recipient_permissions
#' @alias recipientsSharePermissions
#' @export
share_recipient_permissions <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/recipients/", name, "/share-permissions",
    , sep = ""))
}

#' @rdname share_recipient_permissions
#' @export 
recipientsSharePermissions <- share_recipient_permissions
#' Update a share recipient.
#' 
#' Updates an existing recipient in the metastore. The caller must be a
#' metastore admin or the owner of the recipient. If the recipient name will be
#' updated, the user must be both a metastore admin and the owner of the
#' recipient.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment Description about the recipient.
#' @param ip_access_list IP Access List.
#' @param name Required. Name of the recipient.
#' @param new_name New name for the recipient.
#' @param owner Username of the recipient owner.
#' @param properties_kvpairs Recipient properties as map of string key-value pairs.
#'
#' @rdname update_recipient
#' @alias recipientsUpdate
#' @export
update_recipient <- function(client, name, comment = NULL, ip_access_list = NULL,
  new_name = NULL, owner = NULL, properties_kvpairs = NULL) {
  body <- list(comment = comment, ip_access_list = ip_access_list, new_name = new_name,
    owner = owner, properties_kvpairs = properties_kvpairs)
  client$do("PATCH", paste("/api/2.1/unity-catalog/recipients/", name, sep = ""),
    body = body)
}

#' @rdname update_recipient
#' @export 
recipientsUpdate <- update_recipient







