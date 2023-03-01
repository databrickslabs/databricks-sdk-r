# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create new storage configuration.
#' 
#' Creates new storage configuration for an account, specified by ID. Uploads a
#' storage configuration object that represents the root AWS S3 bucket in your
#' account. Databricks stores related workspace assets including DBFS, cluster
#' logs, and job results. For the AWS S3 bucket, you need to configure the
#' required bucket policy.
#' 
#' For information about how to create a new workspace with this API, see
#' [Create a new workspace using the Account API]
#' 
#' [Create a new workspace using the Account API]: http://docs.databricks.com/administration-guide/account-api/new-workspace.html
#'
#' @param root_bucket_info Root S3 bucket information.
#' @param storage_configuration_name The human-readable name of the storage configuration.
databricks_storage_create <- function(storage_configuration_name, root_bucket_info, ...) {
    body <- list(
        root_bucket_info = root_bucket_info, 
        storage_configuration_name = storage_configuration_name, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/storage-configurations", , sep = ""), body = body)
}

#' Delete storage configuration.
#' 
#' Deletes a Databricks storage configuration. You cannot delete a storage
#' configuration that is associated with any workspace.
#'
#' @param storage_configuration_id Databricks Account API storage configuration ID.
databricks_storage_delete <- function(storage_configuration_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/storage-configurations/", storage_configuration_id, sep = ""))
}

#' Get storage configuration.
#' 
#' Gets a Databricks storage configuration for an account, both specified by ID.
#'
#' @param storage_configuration_id Databricks Account API storage configuration ID.
databricks_storage_get <- function(storage_configuration_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/storage-configurations/", storage_configuration_id, sep = ""))
}

#' Get all storage configurations.
#' 
#' Gets a list of all Databricks storage configurations for your account,
#' specified by ID.
databricks_storage_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/storage-configurations", , sep = ""))
}

