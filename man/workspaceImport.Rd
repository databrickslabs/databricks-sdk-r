% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workspace.R
\name{workspaceImport}
\alias{workspaceImport}
\title{Import a workspace object.}
\usage{
workspaceImport(
  client,
  path,
  content = NULL,
  format = NULL,
  language = NULL,
  overwrite = NULL
)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{path}{Required. The absolute path of the object or directory.}

\item{content}{The base64-encoded content.}

\item{format}{This specifies the format of the file to be imported.}

\item{language}{The language of the object.}

\item{overwrite}{The flag that specifies whether to overwrite existing object.}
}
\description{
Imports a workspace object (for example, a notebook or file) or the contents
of an entire directory. If \code{path} already exists and \code{overwrite} is set to
\code{false}, this call returns an error \code{RESOURCE_ALREADY_EXISTS}. One can only
use \code{DBC} format to import a directory.
}
