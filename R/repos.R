# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' The Repos API allows users to manage their git repos. Users can use the API
#' to access all repos that they have manage permissions on.
#' 
#' Databricks Repos is a visual Git client in Databricks. It supports common Git
#' operations such a cloning a repository, committing and pushing, pulling,
#' branch management, and visual comparison of diffs when committing.
#' 
#' Within Repos you can develop code in notebooks or other files and follow data
#' science and engineering code development best practices using Git for version
#' control, collaboration, and CI/CD.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=repos_create]{create} \tab Create a repo.\cr
#'  \link[=repos_delete]{delete} \tab Delete a repo.\cr
#'  \link[=repos_get]{get} \tab Get a repo.\cr
#'  \link[=repos_list]{list} \tab Get repos.\cr
#'  \link[=repos_update]{update} \tab Update a repo.\cr
#' }
#'
#' @rdname repos
#' @export
repos <- list()

#' Create a repo.
#' 
#' Creates a repo in the workspace and links it to the remote Git repo
#' specified. Note that repos created programmatically must be linked to a
#' remote Git repo, unlike repos created in the browser.
#'
#' @param path Desired path for the repo in the workspace.
#' @param provider [required] Git provider.
#' @param sparse_checkout If specified, the repo will be created with sparse checkout enabled.
#' @param url [required] URL of the Git repository to be linked.
#'
#' @keywords internal
#'
#' @rdname repos_create
#'
#' @aliases repos_create
repos_create <- function(url, provider, path = NULL, 
    sparse_checkout = NULL, 
    ...) {
    body <- list(
        path = path, 
        provider = provider, 
        sparse_checkout = sparse_checkout, 
        url = url, ...)
    
    .api$do("POST", "/api/2.0/repos", body = body)
}
repos$create <- repos_create

#' Delete a repo.
#' 
#' Deletes the specified repo.
#'
#' @param repo_id [required] The ID for the corresponding repo to access.
#'
#' @keywords internal
#'
#' @rdname repos_delete
#'
#' @aliases repos_delete
repos_delete <- function(repo_id, ...) {
    
    
    .api$do("DELETE", paste("/api/2.0/repos/", repo_id, sep = ""))
}
repos$delete <- repos_delete

#' Get a repo.
#' 
#' Returns the repo with the given repo ID.
#'
#' @param repo_id [required] The ID for the corresponding repo to access.
#'
#' @keywords internal
#'
#' @rdname repos_get
#'
#' @aliases repos_get
repos_get <- function(repo_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/repos/", repo_id, sep = ""))
}
repos$get <- repos_get

#' Get repos.
#' 
#' Returns repos that the calling user has Manage permissions on. Results are
#' paginated with each page containing twenty repos.
#'
#' @param next_page_token Token used to get the next page of results.
#' @param path_prefix Filters repos that have paths starting with the given path prefix.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname repos_list
#'
#' @aliases repos_list
repos_list <- function(next_page_token = NULL, 
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
repos$list <- repos_list

#' Update a repo.
#' 
#' Updates the repo to a different branch or tag, or updates the repo to the
#' latest commit on the same branch.
#'
#' @param branch Branch that the local version of the repo is checked out to.
#' @param repo_id [required] The ID for the corresponding repo to access.
#' @param sparse_checkout If specified, update the sparse checkout settings.
#' @param tag Tag that the local version of the repo is checked out to.
#'
#' @keywords internal
#'
#' @rdname repos_update
#'
#' @aliases repos_update
repos_update <- function(repo_id, branch = NULL, 
    sparse_checkout = NULL, 
    tag = NULL, 
    ...) {
    body <- list(
        branch = branch, 
        sparse_checkout = sparse_checkout, 
        tag = tag, ...)
    
    .api$do("PATCH", paste("/api/2.0/repos/", repo_id, sep = ""), body = body)
}
repos$update <- repos_update













