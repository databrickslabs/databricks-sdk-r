# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create an auth provider.
#' 
#' Creates a new authentication provider minimally based on a name and
#' authentication type. The caller must be an admin on the metastore.
#'
#' @param authentication_type The delta sharing authentication type.
#' @param comment Description about the provider.
#' @param name The name of the Provider.
#' @param recipient_profile_str This field is required when the __authentication_type__ is **TOKEN** or not provided.
databricks_providers_create <- function(name, authentication_type, comment = NULL, 
    recipient_profile_str = NULL, 
    ...) {
    body <- list(
        authentication_type = authentication_type, 
        comment = comment, 
        name = name, 
        recipient_profile_str = recipient_profile_str, ...)
    
    .api$do("POST", "/api/2.1/unity-catalog/providers", body = body)
}

#' Delete a provider.
#' 
#' Deletes an authentication provider, if the caller is a metastore admin or is
#' the owner of the provider.
#'
#' @param name Name of the provider.
databricks_providers_delete <- function(name, ...) {
    
    
    .api$do("DELETE", paste("/api/2.1/unity-catalog/providers/", name, sep = ""))
}

#' Get a provider.
#' 
#' Gets a specific authentication provider. The caller must supply the name of
#' the provider, and must either be a metastore admin or the owner of the
#' provider.
#'
#' @param name Name of the provider.
databricks_providers_get <- function(name, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/providers/", name, sep = ""))
}

#' List providers.
#' 
#' Gets an array of available authentication providers. The caller must either
#' be a metastore admin or the owner of the providers. Providers not owned by
#' the caller are not included in the response. There is no guarantee of a
#' specific ordering of the elements in the array.
#'
#' @param data_provider_global_metastore_id If not provided, all providers will be returned.
databricks_providers_list <- function(data_provider_global_metastore_id = NULL, 
    ...) {
    query <- list(
        data_provider_global_metastore_id = data_provider_global_metastore_id, ...)
    
    
    json <- .api$do("GET", "/api/2.1/unity-catalog/providers", query = query)
    return (json$providers)
    
}

#' List shares by Provider.
#' 
#' Gets an array of a specified provider's shares within the metastore where:
#' 
#' * the caller is a metastore admin, or * the caller is the owner.
#'
#' @param name Name of the provider in which to list shares.
databricks_providers_list_shares <- function(name, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/providers/", name, "/shares", , sep = ""))
}

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
databricks_providers_update <- function(name, comment = NULL, 
    owner = NULL, 
    recipient_profile_str = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, 
        owner = owner, 
        recipient_profile_str = recipient_profile_str, ...)
    
    .api$do("PATCH", paste("/api/2.1/unity-catalog/providers/", name, sep = ""), body = body)
}













