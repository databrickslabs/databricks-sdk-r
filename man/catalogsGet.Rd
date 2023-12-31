% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/catalogs.R
\name{catalogsGet}
\alias{catalogsGet}
\title{Get a catalog.}
\usage{
catalogsGet(client, name)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. The name of the catalog.}
}
\description{
Gets the specified catalog in a metastore. The caller must be a metastore
admin, the owner of the catalog, or a user that has the \strong{USE_CATALOG}
privilege set for their account.
}
