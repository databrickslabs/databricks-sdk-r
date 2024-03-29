% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusters.R
\name{unpin_cluster}
\alias{unpin_cluster}
\alias{clustersUnpin}
\title{Unpin cluster.}
\usage{
unpin_cluster(client, cluster_id)

clustersUnpin(client, cluster_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{cluster_id}{Required. \if{html}{\out{<needs content added>}}.

See the \href{https://docs.databricks.com/api/workspace/clusters/unpin}{API documentation} for more
information on the request and response field structure.}
}
\description{
Unpinning a cluster will allow the cluster to eventually be removed from the
ListClusters API. Unpinning a cluster that is not pinned will have no effect.
This API can only be called by workspace admins.
}
