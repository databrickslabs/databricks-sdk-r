% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recipients.R
\name{recipientsDelete}
\alias{recipientsDelete}
\title{Delete a share recipient.}
\usage{
recipientsDelete(client, name)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. Name of the recipient.}
}
\description{
Deletes the specified recipient from the metastore. The caller must be the
owner of the recipient.
}
