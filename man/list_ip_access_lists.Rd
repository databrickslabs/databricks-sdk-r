% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ip_access_lists.R
\name{list_ip_access_lists}
\alias{list_ip_access_lists}
\alias{ipAccessListsList}
\title{Get access lists.}
\usage{
list_ip_access_lists(client)

ipAccessListsList(client)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}
}
\value{
\code{data.frame} with all of the response pages.

See the \href{https://docs.databricks.com/api/workspace/ipaccesslists/list}{API documentation} for more
information on the request and response field structure.
}
\description{
Gets all IP access lists for the specified workspace.
}
