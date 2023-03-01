# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

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
#' @param path The absolute path of the notebook or directory.
#' @param recursive The flag that specifies whether to delete the object recursively.
databricks_workspace_delete <- function(path, recursive = NULL, 
    ...) {
    body <- list(
        path = path, 
        recursive = recursive, ...)
    .api$do("POST", "/api/2.0/workspace/delete", body = body)
}

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
#' @param path The absolute path of the notebook or directory.
databricks_workspace_export <- function(path, direct_download = NULL, 
    format = NULL, 
    ...) {
    query <- list(
        direct_download = direct_download, 
        format = format, 
        path = path, ...)
    .api$do("GET", "/api/2.0/workspace/export", query = query)
}

#' Get status.
#' 
#' Gets the status of an object or a directory. If `path` does not exist, this
#' call returns an error `RESOURCE_DOES_NOT_EXIST`.
#'
#' @param path The absolute path of the notebook or directory.
databricks_workspace_get_status <- function(path, ...) {
    query <- list(
        path = path, ...)
    .api$do("GET", "/api/2.0/workspace/get-status", query = query)
}

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
#' @param path The absolute path of the notebook or directory.
databricks_workspace_import <- function(path, content = NULL, 
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

#' List contents.
#' 
#' Lists the contents of a directory, or the object if it is not a directory.If
#' the input path does not exist, this call returns an error
#' `RESOURCE_DOES_NOT_EXIST`.
#'
#' @param notebooks_modified_after <content needed>.
#' @param path The absolute path of the notebook or directory.
databricks_workspace_list <- function(path, notebooks_modified_after = NULL, 
    ...) {
    query <- list(
        notebooks_modified_after = notebooks_modified_after, 
        path = path, ...)
    .api$do("GET", "/api/2.0/workspace/list", query = query)
}

#' Create a directory.
#' 
#' Creates the specified directory (and necessary parent directories if they do
#' not exist). If there is an object (not a directory) at any prefix of the
#' input path, this call returns an error `RESOURCE_ALREADY_EXISTS`.
#' 
#' Note that if this operation fails it may have succeeded in creating some of
#' the necessary\nparrent directories.
#'
#' @param path The absolute path of the directory.
databricks_workspace_mkdirs <- function(path, ...) {
    body <- list(
        path = path, ...)
    .api$do("POST", "/api/2.0/workspace/mkdirs", body = body)
}

