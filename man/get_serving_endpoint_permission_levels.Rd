% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/serving_endpoints.R
\name{get_serving_endpoint_permission_levels}
\alias{get_serving_endpoint_permission_levels}
\alias{servingEndpointsGetPermissionLevels}
\title{Get serving endpoint permission levels.}
\usage{
get_serving_endpoint_permission_levels(client, serving_endpoint_id)

servingEndpointsGetPermissionLevels(client, serving_endpoint_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{serving_endpoint_id}{Required. The serving endpoint for which to get or manage permissions.

See the \href{https://docs.databricks.com/api/workspace/servingendpoints/getpermissionlevels}{API documentation} for more
information on the request and response field structure.}
}
\description{
Gets the permission levels that a user can have on an object.
}
