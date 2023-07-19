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
#' @rdname workspaceDelete
#' @export
workspaceDelete <- function(client, path, recursive=NULL) {
    body <- list(
        path = path
        , recursive = recursive)
    client$do("POST", "/api/2.0/workspace/delete", body = body)
}

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
#' @rdname workspaceExport
#' @export
workspaceExport <- function(client, path, format=NULL) {
    query <- list(
        format = format
        , path = path)
    client$do("GET", "/api/2.0/workspace/export", query = query)
}

#' Get status.
#' 
#' Gets the status of an object or a directory. If `path` does not exist, this
#' call returns an error `RESOURCE_DOES_NOT_EXIST`.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param path Required. The absolute path of the notebook or directory.
#'
#' @rdname workspaceGetStatus
#' @export
workspaceGetStatus <- function(client, path) {
    query <- list(
        path = path)
    client$do("GET", "/api/2.0/workspace/get-status", query = query)
}

#' Import a workspace object.
#' 
#' Imports a workspace object (for example, a notebook or file) or the contents
#' of an entire directory. If `path` already exists and `overwrite` is set to
#' `false`, this call returns an error `RESOURCE_ALREADY_EXISTS`. One can only
#' use `DBC` format to import a directory.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param content The base64-encoded content.
#' @param format This specifies the format of the file to be imported.
#' @param language The language of the object.
#' @param overwrite The flag that specifies whether to overwrite existing object.
#' @param path Required. The absolute path of the object or directory.
#'
#' @rdname workspaceImport
#' @export
workspaceImport <- function(client, path, content=NULL, format=NULL, language=NULL, overwrite=NULL) {
    body <- list(
        content = content
        , format = format
        , language = language
        , overwrite = overwrite
        , path = path)
    client$do("POST", "/api/2.0/workspace/import", body = body)
}

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
#' @rdname workspaceList
#' @export
workspaceList <- function(client, path, notebooks_modified_after=NULL) {
    query <- list(
        notebooks_modified_after = notebooks_modified_after
        , path = path)
    
    json <- client$do("GET", "/api/2.0/workspace/list", query = query)
    return (json$objects)
    
}

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
#' @rdname workspaceMkdirs
#' @export
workspaceMkdirs <- function(client, path) {
    body <- list(
        path = path)
    client$do("POST", "/api/2.0/workspace/mkdirs", body = body)
}

