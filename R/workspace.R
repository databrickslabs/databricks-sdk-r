# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' The Workspace API allows you to list, import, export, and delete notebooks
#' and folders.
#' 
#' A notebook is a web-based interface to a document that contains runnable
#' code, visualizations, and explanatory text.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=workspace_delete]{delete} \tab Delete a workspace object.\cr
#'  \link[=workspace_export]{export} \tab Export a notebook.\cr
#'  \link[=workspace_get_status]{get_status} \tab Get status.\cr
#'  \link[=workspace_import]{import} \tab Import a notebook.\cr
#'  \link[=workspace_list]{list} \tab List contents.\cr
#'  \link[=workspace_mkdirs]{mkdirs} \tab Create a directory.\cr
#' }
#'
#' @rdname workspace
#' @export
workspace <- list()

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
#'
#' @param path [required] The absolute path of the notebook or directory.
#' @param recursive The flag that specifies whether to delete the object recursively.
#'
#' @keywords internal
#'
#' @rdname workspace_delete
#'
#' @aliases workspace_delete
workspace_delete <- function(path, recursive = NULL, 
    ...) {
    body <- list(
        path = path, 
        recursive = recursive, ...)
    
    .api$do("POST", "/api/2.0/workspace/delete", body = body)
}
workspace$delete <- workspace_delete

#' Export a notebook.
#' 
#' Exports a notebook or the contents of an entire directory.
#' 
#' If `path` does not exist, this call returns an error
#' `RESOURCE_DOES_NOT_EXIST`.
#' 
#' One can only export a directory in `DBC` format. If the exported data would
#' exceed size limit, this call returns `MAX_NOTEBOOK_SIZE_EXCEEDED`. Currently,
#' this API does not support exporting a library.
#'
#' @param direct_download Flag to enable direct download.
#' @param format This specifies the format of the exported file.
#' @param path [required] The absolute path of the notebook or directory.
#'
#' @keywords internal
#'
#' @rdname workspace_export
#'
#' @aliases workspace_export
workspace_export <- function(path, direct_download = NULL, 
    format = NULL, 
    ...) {
    query <- list(
        direct_download = direct_download, 
        format = format, 
        path = path, ...)
    
    .api$do("GET", "/api/2.0/workspace/export", query = query)
}
workspace$export <- workspace_export

#' Get status.
#' 
#' Gets the status of an object or a directory. If `path` does not exist, this
#' call returns an error `RESOURCE_DOES_NOT_EXIST`.
#'
#' @param path [required] The absolute path of the notebook or directory.
#'
#' @keywords internal
#'
#' @rdname workspace_get_status
#'
#' @aliases workspace_get_status
workspace_get_status <- function(path, ...) {
    query <- list(
        path = path, ...)
    
    .api$do("GET", "/api/2.0/workspace/get-status", query = query)
}
workspace$get_status <- workspace_get_status

#' Import a notebook.
#' 
#' Imports a notebook or the contents of an entire directory. If `path` already
#' exists and `overwrite` is set to `false`, this call returns an error
#' `RESOURCE_ALREADY_EXISTS`. One can only use `DBC` format to import a
#' directory.
#'
#' @param content The base64-encoded content.
#' @param format This specifies the format of the file to be imported.
#' @param language The language of the object.
#' @param overwrite The flag that specifies whether to overwrite existing object.
#' @param path [required] The absolute path of the notebook or directory.
#'
#' @keywords internal
#'
#' @rdname workspace_import
#'
#' @aliases workspace_import
workspace_import <- function(path, content = NULL, 
    format = NULL, 
    language = NULL, 
    overwrite = NULL, 
    ...) {
    body <- list(
        content = content, 
        format = format, 
        language = language, 
        overwrite = overwrite, 
        path = path, ...)
    
    .api$do("POST", "/api/2.0/workspace/import", body = body)
}
workspace$import <- workspace_import

#' List contents.
#' 
#' Lists the contents of a directory, or the object if it is not a directory.If
#' the input path does not exist, this call returns an error
#' `RESOURCE_DOES_NOT_EXIST`.
#'
#' @param notebooks_modified_after <content needed>.
#' @param path [required] The absolute path of the notebook or directory.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname workspace_list
#'
#' @aliases workspace_list
workspace_list <- function(path, notebooks_modified_after = NULL, 
    ...) {
    query <- list(
        notebooks_modified_after = notebooks_modified_after, 
        path = path, ...)
    
    
    json <- .api$do("GET", "/api/2.0/workspace/list", query = query)
    return (json$objects)
    
}
workspace$list <- workspace_list

#' Create a directory.
#' 
#' Creates the specified directory (and necessary parent directories if they do
#' not exist). If there is an object (not a directory) at any prefix of the
#' input path, this call returns an error `RESOURCE_ALREADY_EXISTS`.
#' 
#' Note that if this operation fails it may have succeeded in creating some of
#' the necessary\nparrent directories.
#'
#' @param path [required] The absolute path of the directory.
#'
#' @keywords internal
#'
#' @rdname workspace_mkdirs
#'
#' @aliases workspace_mkdirs
workspace_mkdirs <- function(path, ...) {
    body <- list(
        path = path, ...)
    
    .api$do("POST", "/api/2.0/workspace/mkdirs", body = body)
}
workspace$mkdirs <- workspace_mkdirs













