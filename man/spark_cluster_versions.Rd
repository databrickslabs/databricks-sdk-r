% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusters.R
\name{spark_cluster_versions}
\alias{spark_cluster_versions}
\alias{clustersSparkVersions}
\title{List available Spark versions.}
\usage{
spark_cluster_versions(client)

clustersSparkVersions(client)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()

See the \href{https://docs.databricks.com/api/workspace/clusters/sparkversions}{API documentation} for more
information on the request and response field structure.}
}
\description{
Returns the list of available Spark versions. These versions can be used to
launch a cluster.
}
