% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/external_locations.R
\name{externalLocationsGet}
\alias{externalLocationsGet}
\title{Get an external location.}
\usage{
externalLocationsGet(client, name)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Required. Name of the external location.}
}
\description{
Gets an external location from the metastore. The caller must be either a
metastore admin, the owner of the external location, or a user that has some
privilege on the external location.
}
