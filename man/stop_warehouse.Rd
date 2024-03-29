% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/warehouses.R
\name{stop_warehouse}
\alias{stop_warehouse}
\alias{warehousesStop}
\title{Stop a warehouse.}
\usage{
stop_warehouse(client, id)

warehousesStop(client, id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{id}{Required. Required.

See the \href{https://docs.databricks.com/api/workspace/warehouses/stop}{API documentation} for more
information on the request and response field structure.}
}
\description{
Stops a SQL warehouse.
}
