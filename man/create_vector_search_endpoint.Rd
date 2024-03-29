% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vector_search_endpoints.R
\name{create_vector_search_endpoint}
\alias{create_vector_search_endpoint}
\alias{vectorSearchEndpointsCreateEndpoint}
\title{Create an endpoint.}
\usage{
create_vector_search_endpoint(client, name, endpoint_type)

vectorSearchEndpointsCreateEndpoint(client, name, endpoint_type)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. Name of endpoint.

See the \href{https://docs.databricks.com/api/workspace/vectorsearchendpoints/createendpoint}{API documentation} for more
information on the request and response field structure.}

\item{endpoint_type}{Required. Type of endpoint.}
}
\description{
Create a new endpoint.
}
