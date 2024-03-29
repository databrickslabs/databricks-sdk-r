% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/serving_endpoints.R
\name{update_serving_endpoint_permissions}
\alias{update_serving_endpoint_permissions}
\alias{servingEndpointsUpdatePermissions}
\title{Update serving endpoint permissions.}
\usage{
update_serving_endpoint_permissions(
  client,
  serving_endpoint_id,
  access_control_list = NULL
)

servingEndpointsUpdatePermissions(
  client,
  serving_endpoint_id,
  access_control_list = NULL
)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{serving_endpoint_id}{Required. The serving endpoint for which to get or manage permissions.

See the \href{https://docs.databricks.com/api/workspace/servingendpoints/updatepermissions}{API documentation} for more
information on the request and response field structure.}

\item{access_control_list}{This field has no description yet.}
}
\description{
Updates the permissions on a serving endpoint. Serving endpoints can inherit
permissions from their root object.
}
