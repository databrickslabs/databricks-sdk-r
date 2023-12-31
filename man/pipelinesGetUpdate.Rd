% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pipelines.R
\name{pipelinesGetUpdate}
\alias{pipelinesGetUpdate}
\title{Get a pipeline update.}
\usage{
pipelinesGetUpdate(client, pipeline_id, update_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{pipeline_id}{Required. The ID of the pipeline.}

\item{update_id}{Required. The ID of the update.}
}
\description{
Gets an update from an active pipeline.
}
