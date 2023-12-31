% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tokens.R
\name{tokensCreate}
\alias{tokensCreate}
\title{Create a user token.}
\usage{
tokensCreate(client, comment = NULL, lifetime_seconds = NULL)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{comment}{Optional description to attach to the token.}

\item{lifetime_seconds}{The lifetime of the token, in seconds.}
}
\description{
Creates and returns a token for a user. If this call is made through token
authentication, it creates a token with the same client ID as the
authenticated token. If the user's token quota is exceeded, this call returns
an error \strong{QUOTA_EXCEEDED}.
}
