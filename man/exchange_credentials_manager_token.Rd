% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/credentials_manager.R
\name{exchange_credentials_manager_token}
\alias{exchange_credentials_manager_token}
\alias{credentialsManagerExchangeToken}
\title{Exchange token.}
\usage{
exchange_credentials_manager_token(client, partition_id, token_type, scopes)

credentialsManagerExchangeToken(client, partition_id, token_type, scopes)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{partition_id}{Required. The partition of Credentials store.}

\item{token_type}{Required. A list of token types being requested.

See the \href{https://docs.databricks.com/api/workspace/credentialsmanager/exchangetoken}{API documentation} for more
information on the request and response field structure.}

\item{scopes}{Required. Array of scopes for the token request.}
}
\description{
Exchange tokens with an Identity Provider to get a new access token. It
allows specifying scopes to determine token permissions.
}
