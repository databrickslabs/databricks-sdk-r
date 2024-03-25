# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Append data block.
#' 
#' Appends a block of data to the stream specified by the input handle. If the
#' handle does not exist, this call will throw an exception with
#' ``RESOURCE_DOES_NOT_EXIST``.
#' 
#' If the block of data exceeds 1 MB, this call will throw an exception with
#' ``MAX_BLOCK_SIZE_EXCEEDED``.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param data Required. The base64-encoded data to append to the stream.
#' @param handle Required. The handle on an open stream.
#'
#' @rdname dbfsAddBlock
#' @export
dbfsAddBlock <- function(client, handle, data) {
  body <- list(data = data, handle = handle)
  client$do("POST", "/api/2.0/dbfs/add-block", body = body)
}

#' Close the stream.
#' 
#' Closes the stream specified by the input handle. If the handle does not
#' exist, this call throws an exception with ``RESOURCE_DOES_NOT_EXIST``.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param handle Required. The handle on an open stream.
#'
#' @rdname dbfsClose
#' @export
dbfsClose <- function(client, handle) {
  body <- list(handle = handle)
  client$do("POST", "/api/2.0/dbfs/close", body = body)
}

#' Open a stream.
#' 
#' Opens a stream to write to a file and returns a handle to this stream. There
#' is a 10 minute idle timeout on this handle. If a file or directory already
#' exists on the given path and __overwrite__ is set to false, this call will
#' throw an exception with ``RESOURCE_ALREADY_EXISTS``.
#' 
#' A typical workflow for file upload would be:
#' 
#' 1. Issue a ``create`` call and get a handle. 2. Issue one or more
#' ``add-block`` calls with the handle you have. 3. Issue a ``close`` call with
#' the handle you have.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param overwrite The flag that specifies whether to overwrite existing file/files.
#' @param path Required. The path of the new file.
#'
#' @rdname dbfsCreate
#' @export
dbfsCreate <- function(client, path, overwrite = NULL) {
  body <- list(overwrite = overwrite, path = path)
  client$do("POST", "/api/2.0/dbfs/create", body = body)
}

#' Delete a file/directory.
#' 
#' Delete the file or directory (optionally recursively delete all files in the
#' directory). This call throws an exception with `IO_ERROR` if the path is a
#' non-empty directory and `recursive` is set to `false` or on other similar
#' errors.
#' 
#' When you delete a large number of files, the delete operation is done in
#' increments. The call returns a response after approximately 45 seconds with
#' an error message (503 Service Unavailable) asking you to re-invoke the delete
#' operation until the directory structure is fully deleted.
#' 
#' For operations that delete more than 10K files, we discourage using the DBFS
#' REST API, but advise you to perform such operations in the context of a
#' cluster, using the [File system utility
#' (dbutils.fs)](/dev-tools/databricks-utils.html#dbutils-fs). `dbutils.fs`
#' covers the functional scope of the DBFS REST API, but from notebooks. Running
#' such operations using notebooks provides better control and manageability,
#' such as selective deletes, and the possibility to automate periodic delete
#' jobs.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param path Required. The path of the file or directory to delete.
#' @param recursive Whether or not to recursively delete the directory's contents.
#'
#' @rdname dbfsDelete
#' @export
dbfsDelete <- function(client, path, recursive = NULL) {
  body <- list(path = path, recursive = recursive)
  client$do("POST", "/api/2.0/dbfs/delete", body = body)
}

#' Get the information of a file or directory.
#' 
#' Gets the file information for a file or directory. If the file or directory
#' does not exist, this call throws an exception with `RESOURCE_DOES_NOT_EXIST`.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param path Required. The path of the file or directory.
#'
#' @rdname dbfsGetStatus
#' @export
dbfsGetStatus <- function(client, path) {
  query <- list(path = path)
  client$do("GET", "/api/2.0/dbfs/get-status", query = query)
}

#' List directory contents or file details.
#' 
#' List the contents of a directory, or details of the file. If the file or
#' directory does not exist, this call throws an exception with
#' `RESOURCE_DOES_NOT_EXIST`.
#' 
#' When calling list on a large directory, the list operation will time out
#' after approximately 60 seconds. We strongly recommend using list only on
#' directories containing less than 10K files and discourage using the DBFS REST
#' API for operations that list more than 10K files. Instead, we recommend that
#' you perform such operations in the context of a cluster, using the [File
#' system utility (dbutils.fs)](/dev-tools/databricks-utils.html#dbutils-fs),
#' which provides the same functionality without timing out.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param path Required. The path of the file or directory.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname dbfsList
#' @export
dbfsList <- function(client, path) {
  query <- list(path = path)

  json <- client$do("GET", "/api/2.0/dbfs/list", query = query)
  return(json$files)

}

#' Create a directory.
#' 
#' Creates the given directory and necessary parent directories if they do not
#' exist. If a file (not a directory) exists at any prefix of the input path,
#' this call throws an exception with `RESOURCE_ALREADY_EXISTS`. **Note**: If
#' this operation fails, it might have succeeded in creating some of the
#' necessary parent directories.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param path Required. The path of the new directory.
#'
#' @rdname dbfsMkdirs
#' @export
dbfsMkdirs <- function(client, path) {
  body <- list(path = path)
  client$do("POST", "/api/2.0/dbfs/mkdirs", body = body)
}

#' Move a file.
#' 
#' Moves a file from one location to another location within DBFS. If the source
#' file does not exist, this call throws an exception with
#' `RESOURCE_DOES_NOT_EXIST`. If a file already exists in the destination path,
#' this call throws an exception with `RESOURCE_ALREADY_EXISTS`. If the given
#' source path is a directory, this call always recursively moves all files.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param destination_path Required. The destination path of the file or directory.
#' @param source_path Required. The source path of the file or directory.
#'
#' @rdname dbfsMove
#' @export
dbfsMove <- function(client, source_path, destination_path) {
  body <- list(destination_path = destination_path, source_path = source_path)
  client$do("POST", "/api/2.0/dbfs/move", body = body)
}

#' Upload a file.
#' 
#' Uploads a file through the use of multipart form post. It is mainly used for
#' streaming uploads, but can also be used as a convenient single call for data
#' upload.
#' 
#' Alternatively you can pass contents as base64 string.
#' 
#' The amount of data that can be passed (when not streaming) using the
#' __contents__ parameter is limited to 1 MB. `MAX_BLOCK_SIZE_EXCEEDED` will be
#' thrown if this limit is exceeded.
#' 
#' If you want to upload large files, use the streaming upload. For details, see
#' :method:dbfs/create, :method:dbfs/addBlock, :method:dbfs/close.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param contents This parameter might be absent, and instead a posted file will be used.
#' @param overwrite The flag that specifies whether to overwrite existing file/files.
#' @param path Required. The path of the new file.
#'
#' @rdname dbfsPut
#' @export
dbfsPut <- function(client, path, contents = NULL, overwrite = NULL) {
  body <- list(contents = contents, overwrite = overwrite, path = path)
  client$do("POST", "/api/2.0/dbfs/put", body = body)
}

#' Get the contents of a file.
#' 
#' Returns the contents of a file. If the file does not exist, this call throws
#' an exception with `RESOURCE_DOES_NOT_EXIST`. If the path is a directory, the
#' read length is negative, or if the offset is negative, this call throws an
#' exception with `INVALID_PARAMETER_VALUE`. If the read length exceeds 1 MB,
#' this call throws an exception with `MAX_READ_SIZE_EXCEEDED`.
#' 
#' If `offset + length` exceeds the number of bytes in a file, it reads the
#' contents until the end of file.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param length The number of bytes to read starting from the offset.
#' @param offset The offset to read from in bytes.
#' @param path Required. The path of the file to read.
#'
#' @rdname dbfsRead
#' @export
dbfsRead <- function(client, path, length = NULL, offset = NULL) {
  query <- list(length = length, offset = offset, path = path)
  client$do("GET", "/api/2.0/dbfs/read", query = query)
}

