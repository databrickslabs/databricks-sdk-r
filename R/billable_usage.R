# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Return billable usage logs.
#' 
#' Returns billable usage logs in CSV format for the specified account and date
#' range. For the data schema, see [CSV file schema]. Note that this method
#' might take multiple seconds to complete.
#' 
#' [CSV file schema]: https://docs.databricks.com/administration-guide/account-settings/usage-analysis.html#schema
#'
#' @param end_month Format: `YYYY-MM`.
#' @param personal_data Specify whether to include personally identifiable information in the billable usage logs, for example the email addresses of cluster creators.
#' @param start_month Format: `YYYY-MM`.
databricks_billable_usage_download <- function(start_month, end_month, personal_data = NULL, 
    ...) {
    query <- list(
        end_month = end_month, 
        personal_data = personal_data, 
        start_month = start_month, ...)
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/usage/download", , sep = ""), query = query)
}

