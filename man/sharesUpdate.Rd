% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shares.R
\name{sharesUpdate}
\alias{sharesUpdate}
\title{Update a share.}
\usage{
sharesUpdate(client, name, comment = NULL, owner = NULL, updates = NULL)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Name of the share.}

\item{comment}{User-provided free-form text description.}

\item{owner}{Username of current owner of share.}

\item{updates}{Array of shared data object updates.}
}
\description{
Updates the share with the changes and data objects in the request. The
caller must be the owner of the share or a metastore admin.
}
\details{
When the caller is a metastore admin, only the \strong{owner} field can be
updated.

In the case that the share name is changed, \strong{updateShare} requires that the
caller is both the share owner and a metastore admin.

For each table that is added through this method, the share owner must also
have \strong{SELECT} privilege on the table. This privilege must be maintained
indefinitely for recipients to be able to access the table. Typically, you
should use a group as the share owner.

Table removals through \strong{update} do not require additional privileges.
}
