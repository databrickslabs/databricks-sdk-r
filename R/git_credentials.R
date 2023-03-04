# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Registers personal access token for Databricks to do operations on behalf of
#' the user.
#' 
#' See [more info].
#' 
#' [more info]: https://docs.databricks.com/repos/get-access-tokens-from-git-provider.html
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=git_credentials_create]{create} \tab Create a credential entry.\cr
#'  \link[=git_credentials_delete]{delete} \tab Delete a credential.\cr
#'  \link[=git_credentials_get]{get} \tab Get a credential entry.\cr
#'  \link[=git_credentials_list]{list} \tab Get Git credentials.\cr
#'  \link[=git_credentials_update]{update} \tab Update a credential.\cr
#' }
#'
#' @rdname git_credentials
#' @export
git_credentials <- list()

#' Create a credential entry.
#' 
#' Creates a Git credential entry for the user. Only one Git credential per user
#' is supported, so any attempts to create credentials if an entry already
#' exists will fail. Use the PATCH endpoint to update existing credentials, or
#' the DELETE endpoint to delete existing credentials.
#'
#' @param git_provider [required] Git provider.
#' @param git_username Git username.
#' @param personal_access_token The personal access token used to authenticate to the corresponding Git provider.
#'
#' @keywords internal
#'
#' @rdname git_credentials_create
#'
#' @aliases git_credentials_create
git_credentials_create <- function(git_provider, git_username = NULL, 
    personal_access_token = NULL, 
    ...) {
    body <- list(
        git_provider = git_provider, 
        git_username = git_username, 
        personal_access_token = personal_access_token, ...)
    
    .api$do("POST", "/api/2.0/git-credentials", body = body)
}
git_credentials$create <- git_credentials_create

#' Delete a credential.
#' 
#' Deletes the specified Git credential.
#'
#' @param credential_id [required] The ID for the corresponding credential to access.
#'
#' @keywords internal
#'
#' @rdname git_credentials_delete
#'
#' @aliases git_credentials_delete
git_credentials_delete <- function(credential_id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/git-credentials/", credential_id, sep = ""))
}
git_credentials$delete <- git_credentials_delete

#' Get a credential entry.
#' 
#' Gets the Git credential with the specified credential ID.
#'
#' @param credential_id [required] The ID for the corresponding credential to access.
#'
#' @keywords internal
#'
#' @rdname git_credentials_get
#'
#' @aliases git_credentials_get
git_credentials_get <- function(credential_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/git-credentials/", credential_id, sep = ""))
}
git_credentials$get <- git_credentials_get

#' Get Git credentials.
#' 
#' Lists the calling user's Git credentials. One credential per user is
#' supported.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname git_credentials_list
#'
#' @aliases git_credentials_list
git_credentials_list <- function(...) {
    
    
    json <- .api$do("GET", "/api/2.0/git-credentials")
    return (json$credentials)
    
}
git_credentials$list <- git_credentials_list

#' Update a credential.
#' 
#' Updates the specified Git credential.
#'
#' @param credential_id [required] The ID for the corresponding credential to access.
#' @param git_provider Git provider.
#' @param git_username Git username.
#' @param personal_access_token The personal access token used to authenticate to the corresponding Git provider.
#'
#' @keywords internal
#'
#' @rdname git_credentials_update
#'
#' @aliases git_credentials_update
git_credentials_update <- function(credential_id, git_provider = NULL, 
    git_username = NULL, 
    personal_access_token = NULL, 
    ...) {
    body <- list(
        git_provider = git_provider, 
        git_username = git_username, 
        personal_access_token = personal_access_token, ...)
    
    .api$do("PATCH", paste("/api/2.0/git-credentials/", credential_id, sep = ""), body = body)
}
git_credentials$update <- git_credentials_update













