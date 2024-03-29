% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lakeview.R
\name{get_lakeview_published}
\alias{get_lakeview_published}
\alias{lakeviewGetPublished}
\title{Get published dashboard.}
\usage{
get_lakeview_published(client, dashboard_id)

lakeviewGetPublished(client, dashboard_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{dashboard_id}{Required. UUID identifying the dashboard to be published.

See the \href{https://docs.databricks.com/api/workspace/lakeview/getpublished}{API documentation} for more
information on the request and response field structure.}
}
\description{
Get the current published dashboard.
}
