# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Cancel statement execution.
#' 
#' Requests that an executing statement be canceled. Callers must poll for
#' status to see the terminal state.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param statement_id Required. The statement ID is returned upon successfully submitting a SQL statement, and is a required reference for all subsequent calls.
#'
#' @rdname statementExecutionCancelExecution
#' @export
statementExecutionCancelExecution <- function(client, statement_id) {

  client$do("POST", paste("/api/2.0/sql/statements/", statement_id, "/cancel",
    , sep = ""))
}

#' Execute a SQL statement.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param byte_limit Applies the given byte limit to the statement's result size.
#' @param catalog Sets default catalog for statement execution, similar to [`USE CATALOG`](https://docs.databricks.com/sql/language-manual/sql-ref-syntax-ddl-use-catalog.html) in SQL.
#' @param disposition The fetch disposition provides two modes of fetching results: `INLINE` and `EXTERNAL_LINKS`.
#' @param format Statement execution supports three result formats: `JSON_ARRAY` (default), `ARROW_STREAM`, and `CSV`.
#' @param on_wait_timeout When `wait_timeout > 0s`, the call will block up to the specified time.
#' @param parameters A list of parameters to pass into a SQL statement containing parameter markers.
#' @param row_limit Applies the given row limit to the statement's result set, but unlike the `LIMIT` clause in SQL, it also sets the `truncated` field in the response to indicate whether the result was trimmed due to the limit or not.
#' @param schema Sets default schema for statement execution, similar to [`USE SCHEMA`](https://docs.databricks.com/sql/language-manual/sql-ref-syntax-ddl-use-schema.html) in SQL.
#' @param statement Required. The SQL statement to execute.
#' @param wait_timeout The time in seconds the call will wait for the statement's result set as `Ns`, where `N` can be set to 0 or to a value between 5 and 50.
#' @param warehouse_id Required. Warehouse upon which to execute a statement.
#'
#' @rdname statementExecutionExecuteStatement
#' @export
statementExecutionExecuteStatement <- function(client, statement, warehouse_id, byte_limit = NULL,
  catalog = NULL, disposition = NULL, format = NULL, on_wait_timeout = NULL, parameters = NULL,
  row_limit = NULL, schema = NULL, wait_timeout = NULL) {
  body <- list(byte_limit = byte_limit, catalog = catalog, disposition = disposition,
    format = format, on_wait_timeout = on_wait_timeout, parameters = parameters,
    row_limit = row_limit, schema = schema, statement = statement, wait_timeout = wait_timeout,
    warehouse_id = warehouse_id)
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
#' **NOTE** This call currently might take up to 5 seconds to get the latest
#' status and result.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param statement_id Required. The statement ID is returned upon successfully submitting a SQL statement, and is a required reference for all subsequent calls.
#'
#' @rdname statementExecutionGetStatement
#' @export
statementExecutionGetStatement <- function(client, statement_id) {

  client$do("GET", paste("/api/2.0/sql/statements/", statement_id, sep = ""))
}

#' Get result chunk by index.
#' 
#' After the statement execution has `SUCCEEDED`, this request can be used to
#' fetch any chunk by index. Whereas the first chunk with `chunk_index=0` is
#' typically fetched with :method:statementexecution/executeStatement or
#' :method:statementexecution/getStatement, this request can be used to fetch
#' subsequent chunks. The response structure is identical to the nested `result`
#' element described in the :method:statementexecution/getStatement request, and
#' similarly includes the `next_chunk_index` and `next_chunk_internal_link`
#' fields for simple iteration through the result set.
#' @param client Required. Instance of DatabricksClient()


#'
#'
#' @param chunk_index Required. 
#' @param statement_id Required. The statement ID is returned upon successfully submitting a SQL statement, and is a required reference for all subsequent calls.
#'
#' @rdname statementExecutionGetStatementResultChunkN
#' @export
statementExecutionGetStatementResultChunkN <- function(client, statement_id, chunk_index) {

  client$do("GET", paste("/api/2.0/sql/statements/", statement_id, "/result/chunks/",
    chunk_index, sep = ""))
}

