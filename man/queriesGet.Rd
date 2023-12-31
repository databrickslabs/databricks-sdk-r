% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/queries.R
\name{queriesGet}
\alias{queriesGet}
\title{Get a query definition.}
\usage{
queriesGet(client, query_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{query_id}{Required.}
}
\description{
Retrieve a query object definition along with contextual permissions
information about the currently authenticated user.
}
