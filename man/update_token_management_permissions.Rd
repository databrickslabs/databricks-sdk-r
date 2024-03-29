% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/token_management.R
\name{update_token_management_permissions}
\alias{update_token_management_permissions}
\alias{tokenManagementUpdatePermissions}
\title{Update token permissions.}
\usage{
update_token_management_permissions(client, access_control_list = NULL)

tokenManagementUpdatePermissions(client, access_control_list = NULL)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{access_control_list}{This field has no description yet.

See the \href{https://docs.databricks.com/api/workspace/tokenmanagement/updatepermissions}{API documentation} for more
information on the request and response field structure.}
}
\description{
Updates the permissions on all tokens. Tokens can inherit permissions from
their root object.
}
