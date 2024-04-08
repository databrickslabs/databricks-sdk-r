% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/command_execution.R
\name{create_command_execution}
\alias{create_command_execution}
\alias{commandExecutionCreate}
\title{Create an execution context.}
\usage{
create_command_execution(client, cluster_id = NULL, language = NULL)

commandExecutionCreate(client, cluster_id = NULL, language = NULL)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{cluster_id}{Running cluster id.}

\item{language}{This field has no description yet.}
}
\description{
Creates an execution context for running cluster commands.
}
\details{
If successful, this method returns the ID of the new execution context.
}