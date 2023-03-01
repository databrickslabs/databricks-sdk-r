# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a credential entry.
#' 
#' Creates a Git credential entry for the user. Only one Git credential per user
#' is supported, so any attempts to create credentials if an entry already
#' exists will fail. Use the PATCH endpoint to update existing credentials, or
#' the DELETE endpoint to delete existing credentials.
#'
#' @param git_provider Git provider.
#' @param git_username Git username.
#' @param personal_access_token The personal access token used to authenticate to the corresponding Git provider.
databricks_git_credentials_create <- function(git_provider, git_username = NULL, 
    personal_access_token = NULL, 
    ...) {
    body <- list(
        git_provider = git_provider, 
        git_username = git_username, 
        personal_access_token = personal_access_token, ...)
    .api$do("POST", "/api/2.0/git-credentials", body = body)
}

#' Delete a credential.
#' 
#' Deletes the specified Git credential.
#'
#' @param credential_id The ID for the corresponding credential to access.
databricks_git_credentials_delete <- function(credential_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/git-credentials/", credential_id, sep = ""))
}

#' Get a credential entry.
#' 
#' Gets the Git credential with the specified credential ID.
#'
#' @param credential_id The ID for the corresponding credential to access.
databricks_git_credentials_get <- function(credential_id, ...) {
    
    .api$do("GET", paste("/api/2.0/git-credentials/", credential_id, sep = ""))
}

#' Get Git credentials.
#' 
#' Lists the calling user's Git credentials. One credential per user is
#' supported.
databricks_git_credentials_list <- function(...) {
    .api$do("GET", "/api/2.0/git-credentials")
}

#' Update a credential.
#' 
#' Updates the specified Git credential.
#'
#' @param credential_id The ID for the corresponding credential to access.
#' @param git_provider Git provider.
#' @param git_username Git username.
#' @param personal_access_token The personal access token used to authenticate to the corresponding Git provider.
databricks_git_credentials_update <- function(credential_id, git_provider = NULL, 
    git_username = NULL, 
    personal_access_token = NULL, 
    ...) {
    body <- list(
        git_provider = git_provider, 
        git_username = git_username, 
        personal_access_token = personal_access_token, ...)
    .api$do("PATCH", paste("/api/2.0/git-credentials/", credential_id, sep = ""), body = body)
}

