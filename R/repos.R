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
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_repo
#' @alias reposCreate
#' @export
create_repo <- function(client, url, provider, path = NULL, sparse_checkout = NULL) {
  body <- list(path = path, provider = provider, sparse_checkout = sparse_checkout,
    url = url)
  client$do("POST", "/api/2.0/repos", body = body)
}

#' @rdname create_repo
#' @export 
reposCreate <- create_repo
#' Delete a repo.
#' 
#' Deletes the specified repo.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param repo_id Required. The ID for the corresponding repo to access.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_repo
#' @alias reposDelete
#' @export
delete_repo <- function(client, repo_id) {

  client$do("DELETE", paste("/api/2.0/repos/", repo_id, sep = ""))
}

#' @rdname delete_repo
#' @export 
reposDelete <- delete_repo
#' Get a repo.
#' 
#' Returns the repo with the given repo ID.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param repo_id Required. The ID for the corresponding repo to access.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_repo
#' @alias reposGet
#' @export
get_repo <- function(client, repo_id) {

  client$do("GET", paste("/api/2.0/repos/", repo_id, sep = ""))
}

#' @rdname get_repo
#' @export 
reposGet <- get_repo
#' Get repo permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/getpermissionlevels) for more 
#' information on the request and response field structure.
#'
#' @rdname get_repo_permission_levels
#' @alias reposGetPermissionLevels
#' @export
get_repo_permission_levels <- function(client, repo_id) {

  client$do("GET", paste("/api/2.0/permissions/repos/", repo_id, "/permissionLevels",
    , sep = ""))
}

#' @rdname get_repo_permission_levels
#' @export 
reposGetPermissionLevels <- get_repo_permission_levels
#' Get repo permissions.
#' 
#' Gets the permissions of a repo. Repos can inherit permissions from their root
#' object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/getpermissions) for more 
#' information on the request and response field structure.
#'
#' @rdname get_repo_permissions
#' @alias reposGetPermissions
#' @export
get_repo_permissions <- function(client, repo_id) {

  client$do("GET", paste("/api/2.0/permissions/repos/", repo_id, sep = ""))
}

#' @rdname get_repo_permissions
#' @export 
reposGetPermissions <- get_repo_permissions
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
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_repos
#' @alias reposList
#' @export
list_repos <- function(client, next_page_token = NULL, path_prefix = NULL) {
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

#' @rdname list_repos
#' @export 
reposList <- list_repos
#' Set repo permissions.
#' 
#' Sets permissions on a repo. Repos can inherit permissions from their root
#' object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/setpermissions) for more 
#' information on the request and response field structure.
#'
#' @rdname set_repo_permissions
#' @alias reposSetPermissions
#' @export
set_repo_permissions <- function(client, repo_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/repos/", repo_id, sep = ""), body = body)
}

#' @rdname set_repo_permissions
#' @export 
reposSetPermissions <- set_repo_permissions
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
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_repo
#' @alias reposUpdate
#' @export
update_repo <- function(client, repo_id, branch = NULL, sparse_checkout = NULL, tag = NULL) {
  body <- list(branch = branch, sparse_checkout = sparse_checkout, tag = tag)
  client$do("PATCH", paste("/api/2.0/repos/", repo_id, sep = ""), body = body)
}

#' @rdname update_repo
#' @export 
reposUpdate <- update_repo
#' Update repo permissions.
#' 
#' Updates the permissions on a repo. Repos can inherit permissions from their
#' root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param repo_id Required. The repo for which to get or manage permissions.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/repos/updatepermissions) for more 
#' information on the request and response field structure.
#'
#' @rdname update_repo_permissions
#' @alias reposUpdatePermissions
#' @export
update_repo_permissions <- function(client, repo_id, access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/repos/", repo_id, sep = ""), body = body)
}

#' @rdname update_repo_permissions
#' @export 
reposUpdatePermissions <- update_repo_permissions









