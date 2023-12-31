% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/catalogs.R
\name{catalogsUpdate}
\alias{catalogsUpdate}
\title{Update a catalog.}
\usage{
catalogsUpdate(
  client,
  name,
  comment = NULL,
  isolation_mode = NULL,
  owner = NULL,
  properties = NULL
)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{name}{Name of catalog.}

\item{comment}{User-provided free-form text description.}

\item{isolation_mode}{Whether the current securable is accessible from all workspaces or a specific set of workspaces.}

\item{owner}{Username of current owner of catalog.}

\item{properties}{A map of key-value properties attached to the securable.}
}
\description{
Updates the catalog that matches the supplied name. The caller must be either
the owner of the catalog, or a metastore admin (when changing the owner field
of the catalog).
}
