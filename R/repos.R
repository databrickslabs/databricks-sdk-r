# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a repo.
#' 
#' Creates a repo in the workspace and links it to the remote Git repo
#' specified. Note that repos created programmatically must be linked to a
#' remote Git repo, unlike repos created in the browser.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param path Desired path for the repo in the workspace.
#' @param provider Required. Git provider.
#' @param sparse_checkout If specified, the repo will be created with sparse checkout enabled.
#' @param url Required. URL of the Git repository to be linked.
#'
#' @rdname reposCreate
#' @export
reposCreate <- function(client, url, provider, path = NULL, sparse_checkout = NULL) {
  body <- list(path = path, provider = provider, sparse_checkout = sparse_checkout,
    url = url)
  client$do("POST", "/api/2.0/repos", body = body)
}

#' Delete a repo.
#' 
#' Deletes the specified repo.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param repo_id Required. The ID for the corresponding repo to access.
#'
#' @rdname reposDelete
#' @export
reposDelete <- function(client, repo_id) {

  client$do("DELETE", paste("/api/2.0/repos/", repo_id, sep = ""))
}

#' Get a repo.
#' 
#' Returns the repo with the given repo ID.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param repo_id Required. The ID for the corresponding repo to access.
#'
#' @rdname reposGet
#' @export
reposGet <- function(client, repo_id) {

  client$do("GET", paste("/api/2.0/repos/", repo_id, sep = ""))
}

#' Get repo permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' @rdname reposGetPermissionLevels
#' @export
reposGetPermissionLevels <- function(client, repo_id) {

  client$do("GET", paste("/api/2.0/permissions/repos/", repo_id, "/permissionLevels",
    , sep = ""))
}

#' Get repo permissions.
#' 
#' Gets the permissions of a repo. Repos can inherit permissions from their root
#' object.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' @rdname reposGetPermissions
#' @export
reposGetPermissions <- function(client, repo_id) {

  client$do("GET", paste("/api/2.0/permissions/repos/", repo_id, sep = ""))
}

#' Get repos.
#' 
#' Returns repos that the calling user has Manage permissions on. Results are
#' paginated with each page containing twenty repos.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param next_page_token Token used to get the next page of results.
#' @param path_prefix Filters repos that have paths starting with the given path prefix.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname reposList
#' @export
reposList <- function(client, next_page_token = NULL, path_prefix = NULL) {
  query <- list(next_page_token = next_page_token, path_prefix = path_prefix)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/repos", query = query)
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
  return(results)

}

#' Set repo permissions.
#' 
#' Sets permissions on a repo. Repos can inherit permissions from their root
#' object.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param access_control_list 
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' @rdname reposSetPermissions
#' @export
reposSetPermissions <- function(client, repo_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/repos/", repo_id, sep = ""), body = body)
}

#' Update a repo.
#' 
#' Updates the repo to a different branch or tag, or updates the repo to the
#' latest commit on the same branch.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param branch Branch that the local version of the repo is checked out to.
#' @param repo_id Required. The ID for the corresponding repo to access.
#' @param sparse_checkout If specified, update the sparse checkout settings.
#' @param tag Tag that the local version of the repo is checked out to.
#'
#' @rdname reposUpdate
#' @export
reposUpdate <- function(client, repo_id, branch = NULL, sparse_checkout = NULL, tag = NULL) {
  body <- list(branch = branch, sparse_checkout = sparse_checkout, tag = tag)
  client$do("PATCH", paste("/api/2.0/repos/", repo_id, sep = ""), body = body)
}

#' Update repo permissions.
#' 
#' Updates the permissions on a repo. Repos can inherit permissions from their
#' root object.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param access_control_list 
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' @rdname reposUpdatePermissions
#' @export
reposUpdatePermissions <- function(client, repo_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/repos/", repo_id, sep = ""), body = body)
}

