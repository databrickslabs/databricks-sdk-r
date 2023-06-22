# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' Connections allow for creating a connection to an external data source.
#' 
#' A connection is an abstraction of an external data source that can be
#' connected from Databricks Compute. Creating a connection object is the first
#' step to managing external data sources within Unity Catalog, with the second
#' step being creating a data object (catalog, schema, or table) using the
#' connection. Data objects derived from a connection can be written to or read
#' from similar to other Unity Catalog data objects based on cloud storage.
#' Users may create different types of connections with each connection having a
#' unique set of configuration options to support credential management and
#' other settings.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=connections_create]{create} \tab Create a connection.\cr
#'  \link[=connections_delete]{delete} \tab Delete a connection.\cr
#'  \link[=connections_get]{get} \tab Get a connection.\cr
#'  \link[=connections_list]{list} \tab List connections.\cr
#'  \link[=connections_update]{update} \tab Update a connection.\cr
#' }
#'
#' @rdname connections
#' @export
connections <- list()

#' Create a connection.
#' 
#' Creates a new connection
#' 
#' Creates a new connection to an external data source. It allows users to
#' specify connection details and configurations for interaction with the
#' external server.
#'
#' @param comment User-provided free-form text description.
#' @param connection_type Required. The type of connection.
#' @param name Required. Name of the connection.
#' @param options_kvpairs Required. Object properties as map of string key-value pairs.
#' @param owner Username of current owner of the connection.
#' @param properties_kvpairs An object containing map of key-value properties attached to the connection.
#' @param read_only If the connection is read only.
#'
#' @keywords internal
#'
#' @rdname connections_create
#'
#' @aliases connections_create
connections_create <- function(name, connection_type, options_kvpairs, comment = NULL,
  owner = NULL, properties_kvpairs = NULL, read_only = NULL) {
  body <- list(comment = comment, connection_type = connection_type, name = name,
    options_kvpairs = options_kvpairs, owner = owner, properties_kvpairs = properties_kvpairs,
    read_only = read_only)
  .state$api$do("POST", "/api/2.1/unity-catalog/connections", body = body)
}
connections$create <- connections_create

#' Delete a connection.
#' 
#' Deletes the connection that matches the supplied name.
#'
#' @param name_arg Required. The name of the connection to be deleted.
#'
#' @keywords internal
#'
#' @rdname connections_delete
#'
#' @aliases connections_delete
connections_delete <- function(name_arg) {

  .state$api$do("DELETE", paste("/api/2.1/unity-catalog/connections/", name_arg,
    sep = ""))
}
connections$delete <- connections_delete

#' Get a connection.
#' 
#' Gets a connection from it's name.
#'
#' @param name_arg Required. Name of the connection.
#'
#' @keywords internal
#'
#' @rdname connections_get
#'
#' @aliases connections_get
connections_get <- function(name_arg) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/connections/", name_arg, sep = ""))
}
connections$get <- connections_get

#' List connections.
#' 
#' List all connections.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname connections_list
#'
#' @aliases connections_list
connections_list <- function() {

  json <- .state$api$do("GET", "/api/2.1/unity-catalog/connections")
  return(json$connections)

}
connections$list <- connections_list

#' Update a connection.
#' 
#' Updates the connection that matches the supplied name.
#'
#' @param name Required. Name of the connection.
#' @param name_arg Required. Name of the connection.
#' @param options_kvpairs Required. Object properties as map of string key-value pairs.
#'
#' @keywords internal
#'
#' @rdname connections_update
#'
#' @aliases connections_update
connections_update <- function(name, options_kvpairs, name_arg) {
  body <- list(name = name, options_kvpairs = options_kvpairs)
  .state$api$do("PATCH", paste("/api/2.1/unity-catalog/connections/", name_arg,
    sep = ""), body = body)
}
connections$update <- connections_update

