% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dashboard_widgets.R
\name{delete_dashboard_widget}
\alias{delete_dashboard_widget}
\alias{dashboardWidgetsDelete}
\title{Remove widget.}
\usage{
delete_dashboard_widget(client, id)

dashboardWidgetsDelete(client, id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{id}{Required. Widget ID returned by :method:dashboardwidgets/create.

See the \href{https://docs.databricks.com/api/workspace/dashboardwidgets/delete}{API documentation} for more
information on the request and response field structure.}
}
\description{
Remove widget.
}
