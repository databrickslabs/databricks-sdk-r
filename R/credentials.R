# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create credential configuration.
#' 
#' Creates a Databricks credential configuration that represents cloud
#' cross-account credentials for a specified account. Databricks uses this to
#' set up network infrastructure properly to host Databricks clusters. For your
#' AWS IAM role, you need to trust the External ID (the Databricks Account API
#' account ID) in the returned credential object, and configure the required
#' access policy.
#' 
#' Save the response's `credentials_id` field, which is the ID for your new
#' credential configuration object.
#' 
#' For information about how to create a new workspace with this API, see
#' [Create a new workspace using the Account API]
#' 
#' [Create a new workspace using the Account API]: http://docs.databricks.com/administration-guide/account-api/new-workspace.html
#'
#' @param aws_credentials 
#' @param credentials_name The human-readable name of the credential configuration object.
databricks_credentials_create <- function(credentials_name, aws_credentials, ...) {
    body <- list(
        aws_credentials = aws_credentials, 
        credentials_name = credentials_name, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/credentials", , sep = ""), body = body)
}

#' Delete credential configuration.
#' 
#' Deletes a Databricks credential configuration object for an account, both
#' specified by ID. You cannot delete a credential that is associated with any
#' workspace.
#'
#' @param credentials_id Databricks Account API credential configuration ID.
databricks_credentials_delete <- function(credentials_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/credentials/", credentials_id, sep = ""))
}

#' Get credential configuration.
#' 
#' Gets a Databricks credential configuration object for an account, both
#' specified by ID.
#'
#' @param credentials_id Databricks Account API credential configuration ID.
databricks_credentials_get <- function(credentials_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/credentials/", credentials_id, sep = ""))
}

#' Get all credential configurations.
#' 
#' Gets all Databricks credential configurations associated with an account
#' specified by ID.
databricks_credentials_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/credentials", , sep = ""))
}

