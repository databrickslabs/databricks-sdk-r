% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/providers.R
\name{list_provider_shares}
\alias{list_provider_shares}
\alias{providersListShares}
\title{List shares by Provider.}
\usage{
list_provider_shares(client, name)

providersListShares(client, name)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. Name of the provider in which to list shares.}
}
\value{
\code{data.frame} with all of the response pages.

See the \href{https://docs.databricks.com/api/workspace/providers/listshares}{API documentation} for more
information on the request and response field structure.
}
\description{
Gets an array of a specified provider's shares within the metastore where:
}
\details{
\itemize{
\item the caller is a metastore admin, or * the caller is the owner.
}
}
