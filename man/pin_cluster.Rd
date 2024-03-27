% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusters.R
\name{pin_cluster}
\alias{pin_cluster}
\alias{clustersPin}
\title{Pin cluster.}
\usage{
pin_cluster(client, cluster_id)

clustersPin(client, cluster_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{cluster_id}{Required. \if{html}{\out{<needs content added>}}.}
}
\description{
Pinning a cluster ensures that the cluster will always be returned by the
ListClusters API. Pinning a cluster that is already pinned will have no
effect. This API can only be called by workspace admins.
}