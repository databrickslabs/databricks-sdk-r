% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/serving_endpoints.R
\name{servingEndpointsUpdateConfig}
\alias{servingEndpointsUpdateConfig}
\title{Update a serving endpoint with a new config.}
\usage{
servingEndpointsUpdateConfig(
  client,
  served_models,
  name,
  traffic_config = NULL,
  timeout = 20,
  callback = cli_reporter
)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{served_models}{Required. A list of served models for the endpoint to serve.}

\item{name}{Required. The name of the serving endpoint to update.}

\item{traffic_config}{The traffic config defining how invocations to the serving endpoint should be routed.}
}
\description{
This is a long-running operation, which blocks until Serving Endpoints on Databricks reach
NOT_UPDATING state with the timeout of 20 minutes, that you can change via \code{timeout} parameter.
By default, the state of Databricks Serving Endpoints is reported to console. You can change this behavior
by changing the \code{callback} parameter.
}
\details{
Updates any combination of the serving endpoint's served models, the compute
configuration of those served models, and the endpoint's traffic config. An
endpoint that already has an update in progress can not be updated until the
current update completes or fails.
}
