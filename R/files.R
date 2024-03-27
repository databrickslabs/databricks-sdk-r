# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a directory.
#' 
#' Creates an empty directory. If necessary, also creates any parent directories
#' of the new, empty directory (like the shell command `mkdir -p`). If called on
#' an existing directory, returns a success response; this method is idempotent
#' (it will succeed if the directory already exists).
#' @param client Required. Instance of DatabricksClient()
#'
#' @param directory_path Required. The absolute path of a directory.
#'
#' @rdname create_file_directory
#' @alias filesCreateDirectory
#' @export
create_file_directory <- function(client, directory_path) {

  client$do("PUT", paste("/api/2.0/fs/directories", directory_path, sep = ""))
}

#' @rdname create_file_directory
#' @export 
filesCreateDirectory <- create_file_directory
#' Delete a file.
#' 
#' Deletes a file. If the request is successful, there is no response body.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param file_path Required. The absolute path of the file.
#'
#' @rdname delete_file
#' @alias filesDelete
#' @export
delete_file <- function(client, file_path) {

  client$do("DELETE", paste("/api/2.0/fs/files", file_path, sep = ""))
}

#' @rdname delete_file
#' @export 
filesDelete <- delete_file
#' Delete a directory.
#' 
#' Deletes an empty directory.
#' 
#' To delete a non-empty directory, first delete all of its contents. This can
#' be done by listing the directory contents and deleting each file and
#' subdirectory recursively.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param directory_path Required. The absolute path of a directory.
#'
#' @rdname delete_file_directory
#' @alias filesDeleteDirectory
#' @export
delete_file_directory <- function(client, directory_path) {

  client$do("DELETE", paste("/api/2.0/fs/directories", directory_path, sep = ""))
}

#' @rdname delete_file_directory
#' @export 
filesDeleteDirectory <- delete_file_directory
#' Download a file.
#' 
#' Downloads a file of up to 5 GiB. The file contents are the response body.
#' This is a standard HTTP file download, not a JSON RPC.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param file_path Required. The absolute path of the file.
#'
#' @rdname download_file
#' @alias filesDownload
#' @export
download_file <- function(client, file_path) {

  client$do("GET", paste("/api/2.0/fs/files", file_path, sep = ""))
}

#' @rdname download_file
#' @export 
filesDownload <- download_file
#' Get directory metadata.
#' 
#' Get the metadata of a directory. The response HTTP headers contain the
#' metadata. There is no response body.
#' 
#' This method is useful to check if a directory exists and the caller has
#' access to it.
#' 
#' If you wish to ensure the directory exists, you can instead use `PUT`, which
#' will create the directory if it does not exist, and is idempotent (it will
#' succeed if the directory already exists).
#' @param client Required. Instance of DatabricksClient()
#'
#' @param directory_path Required. The absolute path of a directory.
#'
#' @rdname get_file_directory_metadata
#' @alias filesGetDirectoryMetadata
#' @export
get_file_directory_metadata <- function(client, directory_path) {

  client$do("HEAD", paste("/api/2.0/fs/directories", directory_path, sep = ""))
}

#' @rdname get_file_directory_metadata
#' @export 
filesGetDirectoryMetadata <- get_file_directory_metadata
#' Get file metadata.
#' 
#' Get the metadata of a file. The response HTTP headers contain the metadata.
#' There is no response body.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param file_path Required. The absolute path of the file.
#'
#' @rdname get_file_metadata
#' @alias filesGetMetadata
#' @export
get_file_metadata <- function(client, file_path) {

  client$do("HEAD", paste("/api/2.0/fs/files", file_path, sep = ""))
}

#' @rdname get_file_metadata
#' @export 
filesGetMetadata <- get_file_metadata
#' List directory contents.
#' 
#' Returns the contents of a directory. If there is no directory at the
#' specified path, the API returns a HTTP 404 error.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param directory_path Required. The absolute path of a directory.
#' @param page_size The maximum number of directory entries to return.
#' @param page_token An opaque page token which was the `next_page_token` in the response of the previous request to list the contents of this directory.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_file_directory_contents
#' @alias filesListDirectoryContents
#' @export
list_file_directory_contents <- function(client, directory_path, page_size = NULL,
  page_token = NULL) {
  query <- list(page_size = page_size, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", paste("/api/2.0/fs/directories", directory_path,
      sep = ""), query = query)
    if (is.null(nrow(json$contents))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$contents)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_file_directory_contents
#' @export 
filesListDirectoryContents <- list_file_directory_contents
#' Upload a file.
#' 
#' Uploads a file of up to 5 GiB. The file contents should be sent as the
#' request body as raw bytes (an octet stream); do not encode or otherwise
#' modify the bytes before sending. The contents of the resulting file will be
#' exactly the bytes sent in the request body. If the request is successful,
#' there is no response body.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param contents This field has no description yet.
#' @param file_path Required. The absolute path of the file.
#' @param overwrite If true, an existing file will be overwritten.
#'
#' @rdname upload_file
#' @alias filesUpload
#' @export
upload_file <- function(client, file_path, contents, overwrite = NULL) {
  query <- list(overwrite = overwrite)
  client$do("PUT", paste("/api/2.0/fs/files", file_path, sep = ""), query = query)
}

#' @rdname upload_file
#' @export 
filesUpload <- upload_file








