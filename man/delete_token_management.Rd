% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/token_management.R
\name{delete_token_management}
\alias{delete_token_management}
\alias{tokenManagementDelete}
\title{Delete a token.}
\usage{
delete_token_management(client, token_id)

tokenManagementDelete(client, token_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{token_id}{Required. The ID of the token to get.

See the \href{https://docs.databricks.com/api/workspace/tokenmanagement/delete}{API documentation} for more
information on the request and response field structure.}
}
\description{
Deletes a token, specified by its ID.
}
