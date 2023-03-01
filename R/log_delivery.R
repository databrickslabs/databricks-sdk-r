# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a new log delivery configuration.
#' 
#' Creates a new Databricks log delivery configuration to enable delivery of the
#' specified type of logs to your storage location. This requires that you
#' already created a [credential object](#operation/create-credential-config)
#' (which encapsulates a cross-account service IAM role) and a [storage
#' configuration object](#operation/create-storage-config) (which encapsulates
#' an S3 bucket).
#' 
#' For full details, including the required IAM role policies and bucket
#' policies, see [Deliver and access billable usage logs] or [Configure audit
#' logging].
#' 
#' **Note**: There is a limit on the number of log delivery configurations
#' available per account (each limit applies separately to each log type
#' including billable usage and audit logs). You can create a maximum of two
#' enabled account-level delivery configurations (configurations without a
#' workspace filter) per type. Additionally, you can create two enabled
#' workspace-level delivery configurations per workspace for each log type,
#' which means that the same workspace ID can occur in the workspace filter for
#' no more than two delivery configurations per log type.
#' 
#' You cannot delete a log delivery configuration, but you can disable it (see
#' [Enable or disable log delivery
#' configuration](#operation/patch-log-delivery-config-status)).
#' 
#' [Configure audit logging]: https://docs.databricks.com/administration-guide/account-settings/audit-logs.html
#' [Deliver and access billable usage logs]: https://docs.databricks.com/administration-guide/account-settings/billable-usage-delivery.html
#'
#' @param log_delivery_configuration 
databricks_log_delivery_create <- function(log_delivery_configuration = NULL, 
    ...) {
    body <- list(
        log_delivery_configuration = log_delivery_configuration, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/log-delivery", , sep = ""), body = body)
}

#' Get log delivery configuration.
#' 
#' Gets a Databricks log delivery configuration object for an account, both
#' specified by ID.
#'
#' @param log_delivery_configuration_id Databricks log delivery configuration ID.
databricks_log_delivery_get <- function(log_delivery_configuration_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/log-delivery/", log_delivery_configuration_id, sep = ""))
}

#' Get all log delivery configurations.
#' 
#' Gets all Databricks log delivery configurations associated with an account
#' specified by ID.
#'
#' @param credentials_id Filter by credential configuration ID.
#' @param status Filter by status `ENABLED` or `DISABLED`.
#' @param storage_configuration_id Filter by storage configuration ID.
databricks_log_delivery_list <- function(credentials_id = NULL, 
    status = NULL, 
    storage_configuration_id = NULL, 
    ...) {
    query <- list(
        credentials_id = credentials_id, 
        status = status, 
        storage_configuration_id = storage_configuration_id, ...)
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/log-delivery", , sep = ""), query = query)
}

#' Enable or disable log delivery configuration.
#' 
#' Enables or disables a log delivery configuration. Deletion of delivery
#' configurations is not supported, so disable log delivery configurations that
#' are no longer needed. Note that you can't re-enable a delivery configuration
#' if this would violate the delivery configuration limits described under
#' [Create log delivery](#operation/create-log-delivery-config).
#'
#' @param log_delivery_configuration_id Databricks log delivery configuration ID.
#' @param status Status of log delivery configuration.
databricks_log_delivery_patch_status <- function(status, log_delivery_configuration_id, ...) {
    body <- list(
        status = status, ...)
    .api$do("PATCH", paste("/api/2.0/accounts/", .api$account_id, "/log-delivery/", log_delivery_configuration_id, sep = ""), body = body)
}

