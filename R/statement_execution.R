# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Cancel statement execution.
#' 
#' Requests that an executing statement be canceled. Callers must poll for
#' status to see the terminal state.
#'
#' @param statement_id 
databricks_statement_execution_cancel_execution <- function(statement_id, ...) {
    
    
    .api$do("POST", paste("/api/2.0/sql/statements/", statement_id, "/cancel", , sep = ""))
}

#' Execute an SQL statement.
#' 
#' Execute an SQL statement, and if flagged as such, await its result for a
#' specified time.
#'
#' @param byte_limit Applies given byte limit to execution and result size; byte counts based upon internal representations, and may not match measureable sizes in requested `format`.
#' @param catalog Sets default catalog for statement execution, similar to [`USE CATALOG`](https://docs.databricks.com/sql/language-manual/sql-ref-syntax-ddl-use-catalog.html) in SQL.
#' @param disposition The fetch disposition provides for two modes of fetching results: `INLINE`, and `EXTERNAL_LINKS`.
#' @param format Statement execution supports two result formats: `JSON_ARRAY` (default), and `ARROW_STREAM`.
#' @param on_wait_timeout When called in synchronous mode (`wait_timeout > 0s`), determines action when timeout reached: `CONTINUE` → statement execution continues asynchronously; the call returns a statement ID immediately.
#' @param row_limit Applies given row limit to execution and result set, identical in semantics to SQL term `LIMIT $N`.
#' @param schema Sets default schema for statement execution, similar to [`USE SCHEMA`](https://docs.databricks.com/sql/language-manual/sql-ref-syntax-ddl-use-schema.html) in SQL.
#' @param statement SQL statement to execute.
#' @param wait_timeout Time that the API service will wait for the statement result, in format '{N}s'.
#' @param warehouse_id Warehouse upon which to execute a statement.
databricks_statement_execution_execute_statement <- function(byte_limit = NULL, 
    catalog = NULL, 
    disposition = NULL, 
    format = NULL, 
    on_wait_timeout = NULL, 
    row_limit = NULL, 
    schema = NULL, 
    statement = NULL, 
    wait_timeout = NULL, 
    warehouse_id = NULL, 
    ...) {
    body <- list(
        byte_limit = byte_limit, 
        catalog = catalog, 
        disposition = disposition, 
        format = format, 
        on_wait_timeout = on_wait_timeout, 
        row_limit = row_limit, 
        schema = schema, 
        statement = statement, 
        wait_timeout = wait_timeout, 
        warehouse_id = warehouse_id, ...)
    
    .api$do("POST", "/api/2.0/sql/statements/", body = body)
}

#' Get status, manifest, and result first chunk.
#' 
#' Polls for statement status; when status.state=SUCCEEDED will also return the
#' result manifest, and the first chunk of result data.
#' 
#' **NOTE** This call currently may take up to 5 seconds to get the latest
#' status and result.
#'
#' @param statement_id 
databricks_statement_execution_get_statement <- function(statement_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/sql/statements/", statement_id, sep = ""))
}

#' Get result chunk by index.
#' 
#' After statement execution has SUCCEEDED, result data can be fetched by
#' chunks.
#' 
#' The first chunk (`chunk_index=0`) is typically fetched through
#' `getStatementResult`, and subsequent chunks with this call. The response
#' structure is identical to the nested `result` element described in
#' getStatementResult, and similarly includes `next_chunk_index` and
#' `next_chunk_internal_link` for simple iteration through the result set.
#'
#' @param chunk_index 
#' @param statement_id 
databricks_statement_execution_get_statement_result_chunk_n <- function(statement_id, chunk_index, ...) {
    
    
    .api$do("GET", paste("/api/2.0/sql/statements/", statement_id, "/result/chunks/", chunk_index, sep = ""))
}











