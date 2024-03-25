# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an Online Table.
#' 
#' Create a new Online Table.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Full three-part (catalog, schema, table) name of the table.
#' @param spec Specification of the online table.
#'
#' @rdname create_online_table
#' @export
create_online_table <- function(client, name = NULL, spec = NULL) {
  body <- list(name = name, spec = spec)
  client$do("POST", "/api/2.0/online-tables", body = body)
}
#' Delete an Online Table.
#' 
#' Delete an online table. Warning: This will delete all the data in the online
#' table. If the source Delta table was deleted or modified since this Online
#' Table was created, this will lose the data forever!
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Full three-part (catalog, schema, table) name of the table.
#'
#' @rdname delete_online_table
#' @export
delete_online_table <- function(client, name) {

  client$do("DELETE", paste("/api/2.0/online-tables/", name, sep = ""))
}
#' Get an Online Table.
#' 
#' Get information about an existing online table and its status.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Full three-part (catalog, schema, table) name of the table.
#'
#' @rdname get_online_table
#' @export
get_online_table <- function(client, name) {

  client$do("GET", paste("/api/2.0/online-tables/", name, sep = ""))
}



