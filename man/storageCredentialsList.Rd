% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/storage_credentials.R
\name{storageCredentialsList}
\alias{storageCredentialsList}
\title{List credentials.}
\usage{
storageCredentialsList(client)
}
\value{
\code{data.frame} with all of the response pages.
}
\description{
Gets an array of storage credentials (as \strong{StorageCredentialInfo} objects).
The array is limited to only those storage credentials the caller has
permission to access. If the caller is a metastore admin, all storage
credentials will be retrieved. There is no guarantee of a specific ordering
of the elements in the array.#'
}
