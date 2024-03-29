% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/users.R
\name{get_user_permission_levels}
\alias{get_user_permission_levels}
\alias{usersGetPermissionLevels}
\title{Get password permission levels.}
\usage{
get_user_permission_levels(client)

usersGetPermissionLevels(client)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()

See the \href{https://docs.databricks.com/api/workspace/users/getpermissionlevels}{API documentation} for more
information on the request and response field structure.}
}
\description{
Gets the permission levels that a user can have on an object.
}
