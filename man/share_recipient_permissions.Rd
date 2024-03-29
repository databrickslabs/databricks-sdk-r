% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recipients.R
\name{share_recipient_permissions}
\alias{share_recipient_permissions}
\alias{recipientsSharePermissions}
\title{Get recipient share permissions.}
\usage{
share_recipient_permissions(client, name)

recipientsSharePermissions(client, name)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. The name of the Recipient.

See the \href{https://docs.databricks.com/api/workspace/recipients/sharepermissions}{API documentation} for more
information on the request and response field structure.}
}
\description{
Gets the share permissions for the specified Recipient. The caller must be a
metastore admin or the owner of the Recipient.
}
