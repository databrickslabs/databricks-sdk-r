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
#'
#' @param comment User-provided free-form text description.
#' @param connection_type Required. The type of connection.
#' @param name Required. Name of the connection.
#' @param options Required. A map of key-value properties attached to the securable.
#' @param properties An object containing map of key-value properties attached to the connection.
#' @param read_only If the connection is read only.
#'
#' @rdname connectionsCreate
#' @export
connectionsCreate <- function(client, name, connection_type, options, comment = NULL,
  properties = NULL, read_only = NULL) {
  body <- list(comment = comment, connection_type = connection_type, name = name,
    options = options, properties = properties, read_only = read_only)
  client$do("POST", "/api/2.1/unity-catalog/connections", body = body)
}

#' Delete a connection.
#' 
#' Deletes the connection that matches the supplied name.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param name Required. The name of the connection to be deleted.
#'
#' @rdname connectionsDelete
#' @export
connectionsDelete <- function(client, name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/connections/", name, sep = ""))
}

#' Get a connection.
#' 
#' Gets a connection from it's name.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param name Required. Name of the connection.
#'
#' @rdname connectionsGet
#' @export
connectionsGet <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/connections/", name, sep = ""))
}

#' List connections.
#' 
#' List all connections.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname connectionsList
#' @export
connectionsList <- function(client) {

  json <- client$do("GET", "/api/2.1/unity-catalog/connections")
  return(json$connections)

}

#' Update a connection.
#' 
#' Updates the connection that matches the supplied name.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param name Required. Name of the connection.
#' @param new_name New name for the connection.
#' @param options Required. A map of key-value properties attached to the securable.
#' @param owner Username of current owner of the connection.
#'
#' @rdname connectionsUpdate
#' @export
connectionsUpdate <- function(client, name, options, new_name = NULL, owner = NULL) {
  body <- list(new_name = new_name, options = options, owner = owner)
  client$do("PATCH", paste("/api/2.1/unity-catalog/connections/", name, sep = ""),
    body = body)
}

