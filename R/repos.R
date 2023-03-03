# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a repo.
#' 
#' Creates a repo in the workspace and links it to the remote Git repo
#' specified. Note that repos created programmatically must be linked to a
#' remote Git repo, unlike repos created in the browser.
#'
#' @param path Desired path for the repo in the workspace.
#' @param provider Git provider.
#' @param sparse_checkout If specified, the repo will be created with sparse checkout enabled.
#' @param url URL of the Git repository to be linked.
databricks_repos_create <- function(url, provider, path = NULL, 
    sparse_checkout = NULL, 
    ...) {
    body <- list(
        path = path, 
        provider = provider, 
        sparse_checkout = sparse_checkout, 
        url = url, ...)
    
    .api$do("POST", "/api/2.0/repos", body = body)
}

#' Delete a repo.
#' 
#' Deletes the specified repo.
#'
#' @param repo_id The ID for the corresponding repo to access.
databricks_repos_delete <- function(repo_id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/repos/", repo_id, sep = ""))
}

#' Get a repo.
#' 
#' Returns the repo with the given repo ID.
#'
#' @param repo_id The ID for the corresponding repo to access.
databricks_repos_get <- function(repo_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/repos/", repo_id, sep = ""))
}

#' Get repos.
#' 
#' Returns repos that the calling user has Manage permissions on. Results are
#' paginated with each page containing twenty repos.
#'
#' @param next_page_token Token used to get the next page of results.
#' @param path_prefix Filters repos that have paths starting with the given path prefix.
databricks_repos_list <- function(next_page_token = NULL, 
    path_prefix = NULL, 
    ...) {
    query <- list(
        next_page_token = next_page_token, 
        path_prefix = path_prefix, ...)
    
    
    
    results <- data.frame()
    while (TRUE) {
        json <- .api$do("GET", "/api/2.0/repos", query = query)
        if (is.null(nrow(json$repos))) {
            break
        }
        # append this page of results to one results data.frame
        results <- dplyr::bind_rows(results, json$repos)
        if (is.null(json$next_page_token)) {
            break
        }
        query$next_page_token <- json$next_page_token
    }
    return (results)
    
}

#' Update a repo.
#' 
#' Updates the repo to a different branch or tag, or updates the repo to the
#' latest commit on the same branch.
#'
#' @param branch Branch that the local version of the repo is checked out to.
#' @param repo_id The ID for the corresponding repo to access.
#' @param sparse_checkout If specified, update the sparse checkout settings.
#' @param tag Tag that the local version of the repo is checked out to.
databricks_repos_update <- function(repo_id, branch = NULL, 
    sparse_checkout = NULL, 
    tag = NULL, 
    ...) {
    body <- list(
        branch = branch, 
        sparse_checkout = sparse_checkout, 
        tag = tag, ...)
    
    .api$do("PATCH", paste("/api/2.0/repos/", repo_id, sep = ""), body = body)
}











