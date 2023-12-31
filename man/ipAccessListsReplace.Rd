% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ip_access_lists.R
\name{ipAccessListsReplace}
\alias{ipAccessListsReplace}
\title{Replace access list.}
\usage{
ipAccessListsReplace(
  client,
  label,
  list_type,
  ip_addresses,
  enabled,
  ip_access_list_id,
  list_id = NULL
)
}
\arguments{
\item{client}{Required. Instance of DatabricksClient()}

\item{label}{Required. Label for the IP access list.}

\item{list_type}{Required. This describes an enum.}

\item{ip_addresses}{Required. Array of IP addresses or CIDR values to be added to the IP access list.}

\item{enabled}{Required. Specifies whether this IP access list is enabled.}

\item{ip_access_list_id}{Required. The ID for the corresponding IP access list to modify.}

\item{list_id}{Universally unique identifier (UUID) of the IP access list.}
}
\description{
Replaces an IP access list, specified by its ID.
}
\details{
A list can include allow lists and block lists. See the top of this file for
a description of how the server treats allow lists and block lists at run
time. When replacing an IP access list: * For all allow lists and block lists
combined, the API supports a maximum of 1000 IP/CIDR values, where one CIDR
counts as a single value. Attempts to exceed that number return error 400
with \code{error_code} value \code{QUOTA_EXCEEDED}. * If the resulting list would block
the calling user's current IP, error 400 is returned with \code{error_code} value
\code{INVALID_STATE}. It can take a few minutes for the changes to take effect.
Note that your resulting IP access list has no effect until you enable the
feature. See :method:workspaceconf/setStatus.
}
