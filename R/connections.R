# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a connection.
#' 
#' Creates a new connection
#' 
#' Creates a new connection to an external data source. It allows users to
#' specify connection details and configurations for interaction with the
#' external server.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param connection_type Required. The type of connection.
#' @param name Required. Name of the connection.
#' @param options_kvpairs Required. A map of key-value properties attached to the securable.
#' @param owner Username of current owner of the connection.
#' @param properties_kvpairs An object containing map of key-value properties attached to the connection.
#' @param read_only If the connection is read only.
#'
#' @rdname connectionsCreate
connectionsCreate <- function(client, name, connection_type, options_kvpairs, comment = NULL,
  owner = NULL, properties_kvpairs = NULL, read_only = NULL) {
  body <- list(comment = comment, connection_type = connection_type, name = name,
    options_kvpairs = options_kvpairs, owner = owner, properties_kvpairs = properties_kvpairs,
    read_only = read_only)
  client$do("POST", "/api/2.1/unity-catalog/connections", body = body)
}

#' Delete a connection.
#' 
#' Deletes the connection that matches the supplied name.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name_arg Required. The name of the connection to be deleted.
#'
#' @rdname connectionsDelete
connectionsDelete <- function(client, name_arg) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/connections/", name_arg, sep = ""))
}

#' Get a connection.
#' 
#' Gets a connection from it's name.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name_arg Required. Name of the connection.
#'
#' @rdname connectionsGet
connectionsGet <- function(client, name_arg) {

  client$do("GET", paste("/api/2.1/unity-catalog/connections/", name_arg, sep = ""))
}

#' List connections.
#' 
#' List all connections.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname connectionsList
connectionsList <- function(client) {

  json <- client$do("GET", "/api/2.1/unity-catalog/connections")
  return(json$connections)

}

#' Update a connection.
#' 
#' Updates the connection that matches the supplied name.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the connection.
#' @param name_arg Required. Name of the connection.
#' @param options_kvpairs Required. A map of key-value properties attached to the securable.
#'
#' @rdname connectionsUpdate
connectionsUpdate <- function(client, name, options_kvpairs, name_arg) {
  body <- list(name = name, options_kvpairs = options_kvpairs)
  client$do("PATCH", paste("/api/2.1/unity-catalog/connections/", name_arg, sep = ""),
    body = body)
}

