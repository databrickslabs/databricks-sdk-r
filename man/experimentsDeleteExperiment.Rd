% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/experiments.R
\name{experimentsDeleteExperiment}
\alias{experimentsDeleteExperiment}
\title{Delete an experiment.}
\usage{
experimentsDeleteExperiment(client, experiment_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{experiment_id}{Required. ID of the associated experiment.}
}
\description{
Marks an experiment and associated metadata, runs, metrics, params, and tags
for deletion. If the experiment uses FileStore, artifacts associated with
experiment are also deleted.
}
