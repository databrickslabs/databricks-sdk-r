# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create encryption key configuration.
#' 
#' Creates a customer-managed key configuration object for an account, specified
#' by ID. This operation uploads a reference to a customer-managed key to
#' Databricks. If the key is assigned as a workspace's customer-managed key for
#' managed services, Databricks uses the key to encrypt the workspaces notebooks
#' and secrets in the control plane, in addition to Databricks SQL queries and
#' query history. If it is specified as a workspace's customer-managed key for
#' workspace storage, the key encrypts the workspace's root S3 bucket (which
#' contains the workspace's root DBFS and system data) and, optionally, cluster
#' EBS volume data.
#' 
#' **Important**: Customer-managed keys are supported only for some deployment
#' types, subscription types, and AWS regions.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform or on a select custom plan that allows multiple workspaces per
#' account.
#'
#' @param aws_key_info 
#' @param use_cases The cases that the key can be used for.
databricks_encryption_keys_create <- function(aws_key_info, use_cases, ...) {
    body <- list(
        aws_key_info = aws_key_info, 
        use_cases = use_cases, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/customer-managed-keys", , sep = ""), body = body)
}

#' Delete encryption key configuration.
#' 
#' Deletes a customer-managed key configuration object for an account. You
#' cannot delete a configuration that is associated with a running workspace.
#'
#' @param customer_managed_key_id Databricks encryption key configuration ID.
databricks_encryption_keys_delete <- function(customer_managed_key_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/customer-managed-keys/", customer_managed_key_id, sep = ""))
}

#' Get encryption key configuration.
#' 
#' Gets a customer-managed key configuration object for an account, specified by
#' ID. This operation uploads a reference to a customer-managed key to
#' Databricks. If assigned as a workspace's customer-managed key for managed
#' services, Databricks uses the key to encrypt the workspaces notebooks and
#' secrets in the control plane, in addition to Databricks SQL queries and query
#' history. If it is specified as a workspace's customer-managed key for
#' storage, the key encrypts the workspace's root S3 bucket (which contains the
#' workspace's root DBFS and system data) and, optionally, cluster EBS volume
#' data.
#' 
#' **Important**: Customer-managed keys are supported only for some deployment
#' types, subscription types, and AWS regions.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform.
#'
#' @param customer_managed_key_id Databricks encryption key configuration ID.
databricks_encryption_keys_get <- function(customer_managed_key_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/customer-managed-keys/", customer_managed_key_id, sep = ""))
}

#' Get all encryption key configurations.
#' 
#' Gets all customer-managed key configuration objects for an account. If the
#' key is specified as a workspace's managed services customer-managed key,
#' Databricks uses the key to encrypt the workspace's notebooks and secrets in
#' the control plane, in addition to Databricks SQL queries and query history.
#' If the key is specified as a workspace's storage customer-managed key, the
#' key is used to encrypt the workspace's root S3 bucket and optionally can
#' encrypt cluster EBS volumes data in the data plane.
#' 
#' **Important**: Customer-managed keys are supported only for some deployment
#' types, subscription types, and AWS regions.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform.
databricks_encryption_keys_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/customer-managed-keys", , sep = ""))
}

