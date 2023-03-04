# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' DBFS API makes it simple to interact with various data sources without having
#' to include a users credentials every time to read a file.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=dbfs_add_block]{add_block} \tab Append data block.\cr
#'  \link[=dbfs_close]{close} \tab Close the stream.\cr
#'  \link[=dbfs_create]{create} \tab Open a stream.\cr
#'  \link[=dbfs_delete]{delete} \tab Delete a file/directory.\cr
#'  \link[=dbfs_get_status]{get_status} \tab Get the information of a file or directory.\cr
#'  \link[=dbfs_list]{list} \tab List directory contents or file details.\cr
#'  \link[=dbfs_mkdirs]{mkdirs} \tab Create a directory.\cr
#'  \link[=dbfs_move]{move} \tab Move a file.\cr
#'  \link[=dbfs_put]{put} \tab Upload a file.\cr
#'  \link[=dbfs_read]{read} \tab Get the contents of a file.\cr
#' }
#'
#' @rdname dbfs
#' @export
dbfs <- list()

#' Append data block.
#' 
#' Appends a block of data to the stream specified by the input handle. If the
#' handle does not exist, this call will throw an exception with
#' `RESOURCE_DOES_NOT_EXIST`.
#' 
#' If the block of data exceeds 1 MB, this call will throw an exception with
#' `MAX_BLOCK_SIZE_EXCEEDED`.
#'
#' @param data [required] The base64-encoded data to append to the stream.
#' @param handle [required] The handle on an open stream.
#'
#' @keywords internal
#'
#' @rdname dbfs_add_block
#'
#' @aliases dbfs_add_block
dbfs_add_block <- function(handle, data, ...) {
  body <- list(data = data, handle = handle, ...)

  .api$do("POST", "/api/2.0/dbfs/add-block", body = body)
}
dbfs$add_block <- dbfs_add_block

#' Close the stream.
#' 
#' Closes the stream specified by the input handle. If the handle does not
#' exist, this call throws an exception with `RESOURCE_DOES_NOT_EXIST`.
#'
#' @param handle [required] The handle on an open stream.
#'
#' @keywords internal
#'
#' @rdname dbfs_close
#'
#' @aliases dbfs_close
dbfs_close <- function(handle, ...) {
  body <- list(handle = handle, ...)

  .api$do("POST", "/api/2.0/dbfs/close", body = body)
}
dbfs$close <- dbfs_close

#' Open a stream.
#' 
#' 'Opens a stream to write to a file and returns a handle to this stream. There
#' is a 10 minute idle timeout on this handle. If a file or directory already
#' exists on the given path and __overwrite__ is set to `false`, this call
#' throws an exception with `RESOURCE_ALREADY_EXISTS`.
#' 
#' A typical workflow for file upload would be:
#' 
#' 1. Issue a `create` call and get a handle. 2. Issue one or more `add-block`
#' calls with the handle you have. 3. Issue a `close` call with the handle you
#' have.
#'
#' @param overwrite The flag that specifies whether to overwrite existing file/files.
#' @param path [required] The path of the new file.
#'
#' @keywords internal
#'
#' @rdname dbfs_create
#'
#' @aliases dbfs_create
dbfs_create <- function(path, overwrite = NULL, ...) {
  body <- list(overwrite = overwrite, path = path, ...)

  .api$do("POST", "/api/2.0/dbfs/create", body = body)
}
dbfs$create <- dbfs_create

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
#'
#' @param path [required] The path of the file or directory to delete.
#' @param recursive Whether or not to recursively delete the directory's contents.
#'
#' @keywords internal
#'
#' @rdname dbfs_delete
#'
#' @aliases dbfs_delete
dbfs_delete <- function(path, recursive = NULL, ...) {
  body <- list(path = path, recursive = recursive, ...)

  .api$do("POST", "/api/2.0/dbfs/delete", body = body)
}
dbfs$delete <- dbfs_delete

#' Get the information of a file or directory.
#' 
#' Gets the file information for a file or directory. If the file or directory
#' does not exist, this call throws an exception with `RESOURCE_DOES_NOT_EXIST`.
#'
#' @param path [required] The path of the file or directory.
#'
#' @keywords internal
#'
#' @rdname dbfs_get_status
#'
#' @aliases dbfs_get_status
dbfs_get_status <- function(path, ...) {
  query <- list(path = path, ...)

  .api$do("GET", "/api/2.0/dbfs/get-status", query = query)
}
dbfs$get_status <- dbfs_get_status

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
#'
#' @param path [required] The path of the file or directory.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname dbfs_list
#'
#' @aliases dbfs_list
dbfs_list <- function(path, ...) {
  query <- list(path = path, ...)


  json <- .api$do("GET", "/api/2.0/dbfs/list", query = query)
  return(json$files)

}
dbfs$list <- dbfs_list

#' Create a directory.
#' 
#' Creates the given directory and necessary parent directories if they do not
#' exist. If a file (not a directory) exists at any prefix of the input path,
#' this call throws an exception with `RESOURCE_ALREADY_EXISTS`. **Note**: If
#' this operation fails, it might have succeeded in creating some of the
#' necessary parent directories.
#'
#' @param path [required] The path of the new directory.
#'
#' @keywords internal
#'
#' @rdname dbfs_mkdirs
#'
#' @aliases dbfs_mkdirs
dbfs_mkdirs <- function(path, ...) {
  body <- list(path = path, ...)

  .api$do("POST", "/api/2.0/dbfs/mkdirs", body = body)
}
dbfs$mkdirs <- dbfs_mkdirs

#' Move a file.
#' 
#' Moves a file from one location to another location within DBFS. If the source
#' file does not exist, this call throws an exception with
#' `RESOURCE_DOES_NOT_EXIST`. If a file already exists in the destination path,
#' this call throws an exception with `RESOURCE_ALREADY_EXISTS`. If the given
#' source path is a directory, this call always recursively moves all files.',
#'
#' @param destination_path [required] The destination path of the file or directory.
#' @param source_path [required] The source path of the file or directory.
#'
#' @keywords internal
#'
#' @rdname dbfs_move
#'
#' @aliases dbfs_move
dbfs_move <- function(source_path, destination_path, ...) {
  body <- list(destination_path = destination_path, source_path = source_path,
    ...)

  .api$do("POST", "/api/2.0/dbfs/move", body = body)
}
dbfs$move <- dbfs_move

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
#'
#' @param contents This parameter might be absent, and instead a posted file will be used.
#' @param overwrite The flag that specifies whether to overwrite existing file/files.
#' @param path [required] The path of the new file.
#'
#' @keywords internal
#'
#' @rdname dbfs_put
#'
#' @aliases dbfs_put
dbfs_put <- function(path, contents = NULL, overwrite = NULL, ...) {
  body <- list(contents = contents, overwrite = overwrite, path = path, ...)

  .api$do("POST", "/api/2.0/dbfs/put", body = body)
}
dbfs$put <- dbfs_put

#' Get the contents of a file.
#' 
#' 'Returns the contents of a file. If the file does not exist, this call throws
#' an exception with `RESOURCE_DOES_NOT_EXIST`. If the path is a directory, the
#' read length is negative, or if the offset is negative, this call throws an
#' exception with `INVALID_PARAMETER_VALUE`. If the read length exceeds 1 MB,
#' this call throws an\nexception with `MAX_READ_SIZE_EXCEEDED`.
#' 
#' If `offset + length` exceeds the number of bytes in a file, it reads the
#' contents until the end of file.',
#'
#' @param length The number of bytes to read starting from the offset.
#' @param offset The offset to read from in bytes.
#' @param path [required] The path of the file to read.
#'
#' @keywords internal
#'
#' @rdname dbfs_read
#'
#' @aliases dbfs_read
dbfs_read <- function(path, length = NULL, offset = NULL, ...) {
  query <- list(length = length, offset = offset, path = path, ...)

  .api$do("GET", "/api/2.0/dbfs/read", query = query)
}
dbfs$read <- dbfs_read













