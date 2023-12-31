% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/serving_endpoints.R
\name{servingEndpointsCreate}
\alias{servingEndpointsCreate}
\title{Create a new serving endpoint.}
\usage{
servingEndpointsCreate(
  client,
  name,
  config,
  timeout = 20,
  callback = cli_reporter
)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. The name of the serving endpoint.}

\item{config}{Required. The core config of the serving endpoint.}
}
\description{
This is a long-running operation, which blocks until Serving Endpoints on Databricks reach
NOT_UPDATING state with the timeout of 20 minutes, that you can change via \code{timeout} parameter.
By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior
by changing the \code{callback} parameter.
}
