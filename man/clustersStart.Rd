% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusters.R
\name{clustersStart}
\alias{clustersStart}
\title{Start terminated cluster.}
\usage{
clustersStart(client, cluster_id, timeout = 20, callback = cli_reporter)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{cluster_id}{Required. The cluster to be started.}
}
\description{
This is a long-running operation, which blocks until Clusters on Databricks reach
RUNNING state with the timeout of 20 minutes, that you can change via \code{timeout} parameter.
By default, the state of Databricks Clusters is reported to console. You can change this behavior
by changing the \code{callback} parameter.
}
\details{
Starts a terminated Spark cluster with the supplied ID. This works similar to
\code{createCluster} except:
\itemize{
\item The previous cluster id and attributes are preserved. * The cluster starts
with the last specified cluster size. * If the previous cluster was an
autoscaling cluster, the current cluster starts with the minimum number of
nodes. * If the cluster is not currently in a \code{TERMINATED} state, nothing
will happen. * Clusters launched to run a job cannot be started.
}
}
