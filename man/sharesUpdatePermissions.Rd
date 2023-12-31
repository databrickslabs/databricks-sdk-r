% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shares.R
\name{sharesUpdatePermissions}
\alias{sharesUpdatePermissions}
\title{Update permissions.}
\usage{
sharesUpdatePermissions(client, name, changes = NULL)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. The name of the share.}

\item{changes}{Array of permission changes.}
}
\description{
Updates the permissions for a data share in the metastore. The caller must be
a metastore admin or an owner of the share.
}
\details{
For new recipient grants, the user must also be the owner of the recipients.
recipient revocations do not require additional privileges.
}
