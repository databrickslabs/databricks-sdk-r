% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jobs.R
\name{jobsSetJobPermissions}
\alias{jobsSetJobPermissions}
\title{Set job permissions.}
\usage{
jobsSetJobPermissions(client, job_id, access_control_list = NULL)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{job_id}{Required. The job for which to get or manage permissions.}

\item{access_control_list}{}
}
\description{
Sets permissions on a job. Jobs can inherit permissions from their root
object.
}
