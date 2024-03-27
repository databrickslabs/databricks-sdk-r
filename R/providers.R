# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an auth provider.
#' 
#' Creates a new authentication provider minimally based on a name and
#' authentication type. The caller must be an admin on the metastore.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param authentication_type Required. The delta sharing authentication type.
#' @param comment Description about the provider.
#' @param name Required. The name of the Provider.
#' @param recipient_profile_str This field is required when the __authentication_type__ is **TOKEN** or not provided.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/providers/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_provider
#' @alias providersCreate
#' @export
create_provider <- function(client, name, authentication_type, comment = NULL, recipient_profile_str = NULL) {
  body <- list(authentication_type = authentication_type, comment = comment, name = name,
    recipient_profile_str = recipient_profile_str)
  client$do("POST", "/api/2.1/unity-catalog/providers", body = body)
}

#' @rdname create_provider
#' @export 
providersCreate <- create_provider
#' Delete a provider.
#' 
#' Deletes an authentication provider, if the caller is a metastore admin or is
#' the owner of the provider.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the provider.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/providers/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_provider
#' @alias providersDelete
#' @export
delete_provider <- function(client, name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/providers/", name, sep = ""))
}

#' @rdname delete_provider
#' @export 
providersDelete <- delete_provider
#' Get a provider.
#' 
#' Gets a specific authentication provider. The caller must supply the name of
#' the provider, and must either be a metastore admin or the owner of the
#' provider.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the provider.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/providers/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_provider
#' @alias providersGet
#' @export
get_provider <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/providers/", name, sep = ""))
}

#' @rdname get_provider
#' @export 
providersGet <- get_provider
#' List providers.
#' 
#' Gets an array of available authentication providers. The caller must either
#' be a metastore admin or the owner of the providers. Providers not owned by
#' the caller are not included in the response. There is no guarantee of a
#' specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param data_provider_global_metastore_id If not provided, all providers will be returned.
#'
#' @return `data.frame` with all of the response pages.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/providers/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_providers
#' @alias providersList
#' @export
list_providers <- function(client, data_provider_global_metastore_id = NULL) {
  query <- list(data_provider_global_metastore_id = data_provider_global_metastore_id)

  json <- client$do("GET", "/api/2.1/unity-catalog/providers", query = query)
  return(json$providers)

}

#' @rdname list_providers
#' @export 
providersList <- list_providers
#' List shares by Provider.
#' 
#' Gets an array of a specified provider's shares within the metastore where:
#' 
#' * the caller is a metastore admin, or * the caller is the owner.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the provider in which to list shares.
#'
#' @return `data.frame` with all of the response pages.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/providers/listshares) for more 
#' information on the request and response field structure.
#'
#' @rdname list_provider_shares
#' @alias providersListShares
#' @export
list_provider_shares <- function(client, name) {


  json <- client$do("GET", paste("/api/2.1/unity-catalog/providers/", name, "/shares",
    , sep = ""))
  return(json$shares)

}

#' @rdname list_provider_shares
#' @export 
providersListShares <- list_provider_shares
#' Update a provider.
#' 
#' Updates the information for an authentication provider, if the caller is a
#' metastore admin or is the owner of the provider. If the update changes the
#' provider name, the caller must be both a metastore admin and the owner of the
#' provider.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment Description about the provider.
#' @param name Required. Name of the provider.
#' @param new_name New name for the provider.
#' @param owner Username of Provider owner.
#' @param recipient_profile_str This field is required when the __authentication_type__ is **TOKEN** or not provided.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/providers/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_provider
#' @alias providersUpdate
#' @export
update_provider <- function(client, name, comment = NULL, new_name = NULL, owner = NULL,
  recipient_profile_str = NULL) {
  body <- list(comment = comment, new_name = new_name, owner = owner, recipient_profile_str = recipient_profile_str)
  client$do("PATCH", paste("/api/2.1/unity-catalog/providers/", name, sep = ""),
    body = body)
}

#' @rdname update_provider
#' @export 
providersUpdate <- update_provider






