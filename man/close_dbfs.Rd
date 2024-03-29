% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dbfs.R
\name{close_dbfs}
\alias{close_dbfs}
\alias{dbfsClose}
\title{Close the stream.}
\usage{
close_dbfs(client, handle)

dbfsClose(client, handle)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{handle}{Required. The handle on an open stream.

See the \href{https://docs.databricks.com/api/workspace/dbfs/close}{API documentation} for more
information on the request and response field structure.}
}
\description{
Closes the stream specified by the input handle. If the handle does not
exist, this call throws an exception with \code{RESOURCE_DOES_NOT_EXIST}.
}
