# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a credential entry.
#' 
#' Creates a Git credential entry for the user. Only one Git credential per user
#' is supported, so any attempts to create credentials if an entry already
#' exists will fail. Use the PATCH endpoint to update existing credentials, or
#' the DELETE endpoint to delete existing credentials.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param git_provider Required. Git provider.
#' @param git_username Git username.
#' @param personal_access_token The personal access token used to authenticate to the corresponding Git provider.
#'
#' @rdname create_git_credential
#' @alias gitCredentialsCreate
#' @export
create_git_credential <- function(client, git_provider, git_username = NULL, personal_access_token = NULL) {
  body <- list(git_provider = git_provider, git_username = git_username, personal_access_token = personal_access_token)
  client$do("POST", "/api/2.0/git-credentials", body = body)
}

#' @rdname create_git_credential
#' @export 
gitCredentialsCreate <- create_git_credential
#' Delete a credential.
#' 
#' Deletes the specified Git credential.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param credential_id Required. The ID for the corresponding credential to access.
#'
#' @rdname delete_git_credential
#' @alias gitCredentialsDelete
#' @export
delete_git_credential <- function(client, credential_id) {

  client$do("DELETE", paste("/api/2.0/git-credentials/", credential_id, sep = ""))
}

#' @rdname delete_git_credential
#' @export 
gitCredentialsDelete <- delete_git_credential
#' Get a credential entry.
#' 
#' Gets the Git credential with the specified credential ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param credential_id Required. The ID for the corresponding credential to access.
#'
#' @rdname get_git_credential
#' @alias gitCredentialsGet
#' @export
get_git_credential <- function(client, credential_id) {

  client$do("GET", paste("/api/2.0/git-credentials/", credential_id, sep = ""))
}

#' @rdname get_git_credential
#' @export 
gitCredentialsGet <- get_git_credential
#' Get Git credentials.
#' 
#' Lists the calling user's Git credentials. One credential per user is
#' supported.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_git_credentials
#' @alias gitCredentialsList
#' @export
list_git_credentials <- function(client) {

  json <- client$do("GET", "/api/2.0/git-credentials")
  return(json$credentials)

}

#' @rdname list_git_credentials
#' @export 
gitCredentialsList <- list_git_credentials
#' Update a credential.
#' 
#' Updates the specified Git credential.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param credential_id Required. The ID for the corresponding credential to access.
#' @param git_provider Git provider.
#' @param git_username Git username.
#' @param personal_access_token The personal access token used to authenticate to the corresponding Git provider.
#'
#' @rdname update_git_credential
#' @alias gitCredentialsUpdate
#' @export
update_git_credential <- function(client, credential_id, git_provider = NULL, git_username = NULL,
  personal_access_token = NULL) {
  body <- list(git_provider = git_provider, git_username = git_username, personal_access_token = personal_access_token)
  client$do("PATCH", paste("/api/2.0/git-credentials/", credential_id, sep = ""),
    body = body)
}

#' @rdname update_git_credential
#' @export 
gitCredentialsUpdate <- update_git_credential





