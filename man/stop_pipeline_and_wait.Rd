% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pipelines.R
\name{stop_pipeline_and_wait}
\alias{stop_pipeline_and_wait}
\title{Stop a pipeline.}
\usage{
stop_pipeline_and_wait(
  client,
  pipeline_id,
  timeout = 20,
  callback = cli_reporter
)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{pipeline_id}{Required. This field has no description yet.}

\item{timeout}{Time to wait for the operation to complete in minutes.}

\item{callback}{Function to report the status of the operation. By default, it reports to console.}
}
\description{
This is a long-running operation, which blocks until Pipelines on Databricks reach
IDLE state with the timeout of 20 minutes, that you can change via \code{timeout} parameter.
By default, the state of Databricks Pipelines is reported to console. You can change this behavior
by changing the \code{callback} parameter.
}
\details{
Stops the pipeline by canceling the active update. If there is no active
update for the pipeline, this request is a no-op.
}
