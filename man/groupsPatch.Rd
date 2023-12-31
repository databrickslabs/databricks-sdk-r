% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/groups.R
\name{groupsPatch}
\alias{groupsPatch}
\title{Update group details.}
\usage{
groupsPatch(client, id, operations = NULL, schema = NULL)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{id}{Required. Unique ID for a group in the Databricks workspace.}

\item{operations}{}

\item{schema}{The schema of the patch request.}
}
\description{
Partially updates the details of a group.
}
