# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Delete a workspace object.
#' 
#' Deletes an object or a directory (and optionally recursively deletes all
#' objects in the directory). * If `path` does not exist, this call returns an
#' error `RESOURCE_DOES_NOT_EXIST`. * If `path` is a non-empty directory and
#' `recursive` is set to `false`, this call returns an error
#' `DIRECTORY_NOT_EMPTY`.
#' 
#' Object deletion cannot be undone and deleting a directory recursively is not
#' atomic.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param path Required. The absolute path of the notebook or directory.
#' @param recursive The flag that specifies whether to delete the object recursively.
#'
#' @rdname delete_notebook
#' @alias workspaceDelete
#' @export
delete_notebook <- function(client, path, recursive = NULL) {
  body <- list(path = path, recursive = recursive)
  client$do("POST", "/api/2.0/workspace/delete", body = body)
}

#' @rdname delete_notebook
#' @export 
workspaceDelete <- delete_notebook
#' Export a workspace object.
#' 
#' Exports an object or the contents of an entire directory.
#' 
#' If `path` does not exist, this call returns an error
#' `RESOURCE_DOES_NOT_EXIST`.
#' 
#' If the exported data would exceed size limit, this call returns
#' `MAX_NOTEBOOK_SIZE_EXCEEDED`. Currently, this API does not support exporting
#' a library.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param format This specifies the format of the exported file.
#' @param path Required. The absolute path of the object or directory.
#'
#' @rdname export_notebook
#' @alias workspaceExport
#' @export
export_notebook <- function(client, path, format = NULL) {
  query <- list(format = format, path = path)
  client$do("GET", "/api/2.0/workspace/export", query = query)
}

#' @rdname export_notebook
#' @export 
workspaceExport <- export_notebook
#' Get workspace object permission levels.
#' 
#' Gets the permission levels that a user can have on an object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param workspace_object_id Required. The workspace object for which to get or manage permissions.
#' @param workspace_object_type Required. The workspace object type for which to get or manage permissions.
#'
#' @rdname get_notebook_permission_levels
#' @alias workspaceGetPermissionLevels
#' @export
get_notebook_permission_levels <- function(client, workspace_object_type, workspace_object_id) {

  client$do("GET", paste("/api/2.0/permissions/", workspace_object_type, "/", workspace_object_id,
    "/permissionLevels", , sep = ""))
}

#' @rdname get_notebook_permission_levels
#' @export 
workspaceGetPermissionLevels <- get_notebook_permission_levels
#' Get workspace object permissions.
#' 
#' Gets the permissions of a workspace object. Workspace objects can inherit
#' permissions from their parent objects or root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param workspace_object_id Required. The workspace object for which to get or manage permissions.
#' @param workspace_object_type Required. The workspace object type for which to get or manage permissions.
#'
#' @rdname get_notebook_permissions
#' @alias workspaceGetPermissions
#' @export
get_notebook_permissions <- function(client, workspace_object_type, workspace_object_id) {

  client$do("GET", paste("/api/2.0/permissions/", workspace_object_type, "/", workspace_object_id,
    sep = ""))
}

#' @rdname get_notebook_permissions
#' @export 
workspaceGetPermissions <- get_notebook_permissions
#' Get status.
#' 
#' Gets the status of an object or a directory. If `path` does not exist, this
#' call returns an error `RESOURCE_DOES_NOT_EXIST`.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param path Required. The absolute path of the notebook or directory.
#'
#' @rdname get_notebook_status
#' @alias workspaceGetStatus
#' @export
get_notebook_status <- function(client, path) {
  query <- list(path = path)
  client$do("GET", "/api/2.0/workspace/get-status", query = query)
}

#' @rdname get_notebook_status
#' @export 
workspaceGetStatus <- get_notebook_status
#' Import a workspace object.
#' 
#' Imports a workspace object (for example, a notebook or file) or the contents
#' of an entire directory. If `path` already exists and `overwrite` is set to
#' `false`, this call returns an error `RESOURCE_ALREADY_EXISTS`. To import a
#' directory, you can use either the `DBC` format or the `SOURCE` format with
#' the `language` field unset. To import a single file as `SOURCE`, you must set
#' the `language` field.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param content The base64-encoded content.
#' @param format This specifies the format of the file to be imported.
#' @param language The language of the object.
#' @param overwrite The flag that specifies whether to overwrite existing object.
#' @param path Required. The absolute path of the object or directory.
#'
#' @rdname import_notebook
#' @alias workspaceImport
#' @export
import_notebook <- function(client, path, content = NULL, format = NULL, language = NULL,
  overwrite = NULL) {
  body <- list(content = content, format = format, language = language, overwrite = overwrite,
    path = path)
  client$do("POST", "/api/2.0/workspace/import", body = body)
}

#' @rdname import_notebook
#' @export 
workspaceImport <- import_notebook
#' List contents.
#' 
#' Lists the contents of a directory, or the object if it is not a directory. If
#' the input path does not exist, this call returns an error
#' `RESOURCE_DOES_NOT_EXIST`.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param notebooks_modified_after UTC timestamp in milliseconds.
#' @param path Required. The absolute path of the notebook or directory.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_notebooks
#' @alias workspaceList
#' @export
list_notebooks <- function(client, path, notebooks_modified_after = NULL) {
  query <- list(notebooks_modified_after = notebooks_modified_after, path = path)

  json <- client$do("GET", "/api/2.0/workspace/list", query = query)
  return(json$objects)

}

#' @rdname list_notebooks
#' @export 
workspaceList <- list_notebooks
#' Create a directory.
#' 
#' Creates the specified directory (and necessary parent directories if they do
#' not exist). If there is an object (not a directory) at any prefix of the
#' input path, this call returns an error `RESOURCE_ALREADY_EXISTS`.
#' 
#' Note that if this operation fails it may have succeeded in creating some of
#' the necessary parent directories.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param path Required. The absolute path of the directory.
#'
#' @rdname mkdirs_notebook
#' @alias workspaceMkdirs
#' @export
mkdirs_notebook <- function(client, path) {
  body <- list(path = path)
  client$do("POST", "/api/2.0/workspace/mkdirs", body = body)
}

#' @rdname mkdirs_notebook
#' @export 
workspaceMkdirs <- mkdirs_notebook
#' Set workspace object permissions.
#' 
#' Sets permissions on a workspace object. Workspace objects can inherit
#' permissions from their parent objects or root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param workspace_object_id Required. The workspace object for which to get or manage permissions.
#' @param workspace_object_type Required. The workspace object type for which to get or manage permissions.
#'
#' @rdname set_notebook_permissions
#' @alias workspaceSetPermissions
#' @export
set_notebook_permissions <- function(client, workspace_object_type, workspace_object_id,
  access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PUT", paste("/api/2.0/permissions/", workspace_object_type, "/", workspace_object_id,
    sep = ""), body = body)
}

#' @rdname set_notebook_permissions
#' @export 
workspaceSetPermissions <- set_notebook_permissions
#' Update workspace object permissions.
#' 
#' Updates the permissions on a workspace object. Workspace objects can inherit
#' permissions from their parent objects or root object.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_control_list This field has no description yet.
#' @param workspace_object_id Required. The workspace object for which to get or manage permissions.
#' @param workspace_object_type Required. The workspace object type for which to get or manage permissions.
#'
#' @rdname update_notebook_permissions
#' @alias workspaceUpdatePermissions
#' @export
update_notebook_permissions <- function(client, workspace_object_type, workspace_object_id,
  access_control_list = NULL) {
  body <- list(access_control_list = access_control_list)
  client$do("PATCH", paste("/api/2.0/permissions/", workspace_object_type, "/",
    workspace_object_id, sep = ""), body = body)
}

#' @rdname update_notebook_permissions
#' @export 
workspaceUpdatePermissions <- update_notebook_permissions










