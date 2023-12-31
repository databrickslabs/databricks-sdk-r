% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusters.R
\name{clustersPermanentDelete}
\alias{clustersPermanentDelete}
\title{Permanently delete cluster.}
\usage{
clustersPermanentDelete(client, cluster_id)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{cluster_id}{Required. The cluster to be deleted.}
}
\description{
Permanently deletes a Spark cluster. This cluster is terminated and resources
are asynchronously removed.
}
\details{
In addition, users will no longer see permanently deleted clusters in the
cluster list, and API users can no longer perform any action on permanently
deleted clusters.
}
