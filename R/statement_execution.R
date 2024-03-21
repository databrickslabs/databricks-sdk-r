# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Cancel statement execution.
#' 
#' Requests that an executing statement be canceled. Callers must poll for
#' status to see the terminal state.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param statement_id Required. Statement ID is returned upon successfully submitting a SQL statement, and is a required reference for all subsequent calls.
#'
#' @rdname statementExecutionCancelExecution
#' @export
statementExecutionCancelExecution <- function(client, statement_id) {

  client$do("POST", paste("/api/2.0/sql/statements/", statement_id, "/cancel",
    , sep = ""))
}

#' Execute a SQL statement.
#' 
#' Execute a SQL statement, and if flagged as such, await its result for a
#' specified time.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param byte_limit Applies the given byte limit to the statement's result size.
#' @param catalog Sets default catalog for statement execution, similar to [`USE CATALOG`](https://docs.databricks.com/sql/language-manual/sql-ref-syntax-ddl-use-catalog.html) in SQL.
#' @param disposition The fetch disposition provides two modes of fetching results: `INLINE` and `EXTERNAL_LINKS`.
#' @param format Statement execution supports three result formats: `JSON_ARRAY` (default), `ARROW_STREAM`, and `CSV`.
#' @param on_wait_timeout When in synchronous mode with `wait_timeout > 0s` it determines the action taken when the timeout is reached: `CONTINUE` → the statement execution continues asynchronously and the call returns a statement ID immediately.
#' @param schema Sets default schema for statement execution, similar to [`USE SCHEMA`](https://docs.databricks.com/sql/language-manual/sql-ref-syntax-ddl-use-schema.html) in SQL.
#' @param statement SQL statement to execute.
#' @param wait_timeout The time in seconds the API service will wait for the statement's result set as `Ns`, where `N` can be set to 0 or to a value between 5 and 50.
#' @param warehouse_id Warehouse upon which to execute a statement.
#'
#' @rdname statementExecutionExecuteStatement
#' @export
statementExecutionExecuteStatement <- function(client, byte_limit = NULL, catalog = NULL,
  disposition = NULL, format = NULL, on_wait_timeout = NULL, schema = NULL, statement = NULL,
  wait_timeout = NULL, warehouse_id = NULL) {
  body <- list(byte_limit = byte_limit, catalog = catalog, disposition = disposition,
    format = format, on_wait_timeout = on_wait_timeout, schema = schema, statement = statement,
    wait_timeout = wait_timeout, warehouse_id = warehouse_id)
  client$do("POST", "/api/2.0/sql/statements/", body = body)
}

#' Get status, manifest, and result first chunk.
#' 
#' This request can be used to poll for the statement's status. When the
#' `status.state` field is `SUCCEEDED` it will also return the result manifest
#' and the first chunk of the result data. When the statement is in the terminal
#' states `CANCELED`, `CLOSED` or `FAILED`, it returns HTTP 200 with the state
#' set. After at least 12 hours in terminal state, the statement is removed from
#' the warehouse and further calls will receive an HTTP 404 response.
#' 
#' **NOTE** This call currently may take up to 5 seconds to get the latest
#' status and result.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param statement_id Required. Statement ID is returned upon successfully submitting a SQL statement, and is a required reference for all subsequent calls.
#'
#' @rdname statementExecutionGetStatement
#' @export
statementExecutionGetStatement <- function(client, statement_id) {

  client$do("GET", paste("/api/2.0/sql/statements/", statement_id, sep = ""))
}

#' Get result chunk by index.
#' 
#' After the statement execution has `SUCCEEDED`, the result data can be fetched
#' by chunks. Whereas the first chuck with `chunk_index=0` is typically fetched
#' through a `get status` request, subsequent chunks can be fetched using a `get
#' result` request. The response structure is identical to the nested `result`
#' element described in the `get status` request, and similarly includes the
#' `next_chunk_index` and `next_chunk_internal_link` fields for simple iteration
#' through the result set.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param chunk_index Required. 
#' @param statement_id Required. Statement ID is returned upon successfully submitting a SQL statement, and is a required reference for all subsequent calls.
#'
#' @rdname statementExecutionGetStatementResultChunkN
#' @export
statementExecutionGetStatementResultChunkN <- function(client, statement_id, chunk_index) {

  client$do("GET", paste("/api/2.0/sql/statements/", statement_id, "/result/chunks/",
    chunk_index, sep = ""))
}

