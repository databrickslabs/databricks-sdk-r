# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a new workspace.
#' 
#' Creates a new workspace.
#' 
#' **Important**: This operation is asynchronous. A response with HTTP status
#' code 200 means the request has been accepted and is in progress, but does not
#' mean that the workspace deployed successfully and is running. The initial
#' workspace status is typically `PROVISIONING`. Use the workspace ID
#' (`workspace_id`) field in the response to identify the new workspace and make
#' repeated `GET` requests with the workspace ID and check its status. The
#' workspace becomes available when the status changes to `RUNNING`.
#'
#' @param aws_region The AWS region of the workspace's data plane.
#' @param cloud The cloud provider which the workspace uses.
#' @param cloud_resource_container The general workspace configurations that are specific to cloud providers.
#' @param credentials_id ID of the workspace's credential configuration object.
#' @param deployment_name The deployment name defines part of the subdomain for the workspace.
#' @param location The Google Cloud region of the workspace data plane in your Google account.
#' @param managed_services_customer_managed_key_id The ID of the workspace's managed services encryption key configuration object.
#' @param network_id 
#' @param pricing_tier The pricing tier of the workspace.
#' @param private_access_settings_id ID of the workspace's private access settings object.
#' @param storage_configuration_id The ID of the workspace's storage configuration object.
#' @param storage_customer_managed_key_id The ID of the workspace's storage encryption key configuration object.
#' @param workspace_name The workspace's human-readable name.
databricks_workspaces_create <- function(workspace_name, aws_region = NULL, 
    cloud = NULL, 
    cloud_resource_container = NULL, 
    credentials_id = NULL, 
    deployment_name = NULL, 
    location = NULL, 
    managed_services_customer_managed_key_id = NULL, 
    network_id = NULL, 
    pricing_tier = NULL, 
    private_access_settings_id = NULL, 
    storage_configuration_id = NULL, 
    storage_customer_managed_key_id = NULL, 
    ...) {
    body <- list(
        aws_region = aws_region, 
        cloud = cloud, 
        cloud_resource_container = cloud_resource_container, 
        credentials_id = credentials_id, 
        deployment_name = deployment_name, 
        location = location, 
        managed_services_customer_managed_key_id = managed_services_customer_managed_key_id, 
        network_id = network_id, 
        pricing_tier = pricing_tier, 
        private_access_settings_id = private_access_settings_id, 
        storage_configuration_id = storage_configuration_id, 
        storage_customer_managed_key_id = storage_customer_managed_key_id, 
        workspace_name = workspace_name, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/workspaces", , sep = ""), body = body)
}

#' Delete a workspace.
#' 
#' Terminates and deletes a Databricks workspace. From an API perspective,
#' deletion is immediate. However, it might take a few minutes for all
#' workspaces resources to be deleted, depending on the size and number of
#' workspace resources.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform or on a select custom plan that allows multiple workspaces per
#' account.
#'
#' @param workspace_id Workspace ID.
databricks_workspaces_delete <- function(workspace_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/workspaces/", workspace_id, sep = ""))
}

#' Get a workspace.
#' 
#' Gets information including status for a Databricks workspace, specified by
#' ID. In the response, the `workspace_status` field indicates the current
#' status. After initial workspace creation (which is asynchronous), make
#' repeated `GET` requests with the workspace ID and check its status. The
#' workspace becomes available when the status changes to `RUNNING`.
#' 
#' For information about how to create a new workspace with this API **including
#' error handling**, see [Create a new workspace using the Account API].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform or on a select custom plan that allows multiple workspaces per
#' account.
#' 
#' [Create a new workspace using the Account API]: http://docs.databricks.com/administration-guide/account-api/new-workspace.html
#'
#' @param workspace_id Workspace ID.
databricks_workspaces_get <- function(workspace_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/workspaces/", workspace_id, sep = ""))
}

#' Get all workspaces.
#' 
#' Gets a list of all workspaces associated with an account, specified by ID.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform or on a select custom plan that allows multiple workspaces per
#' account.
databricks_workspaces_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/workspaces", , sep = ""))
}

#' Update workspace configuration.
#' 
#' Updates a workspace configuration for either a running workspace or a failed
#' workspace. The elements that can be updated varies between these two use
#' cases.
#' 
#' ### Update a failed workspace You can update a Databricks workspace
#' configuration for failed workspace deployment for some fields, but not all
#' fields. For a failed workspace, this request supports updates to the
#' following fields only: - Credential configuration ID - Storage configuration
#' ID - Network configuration ID. Used only if you use customer-managed VPC. -
#' Key configuration ID for managed services (control plane storage, such as
#' notebook source and Databricks SQL queries). Used only if you use
#' customer-managed keys for managed services. - Key configuration ID for
#' workspace storage (root S3 bucket and, optionally, EBS volumes). Used only if
#' you use customer-managed keys for workspace storage. **Important**: If the
#' workspace was ever in the running state, even if briefly before becoming a
#' failed workspace, you cannot add a new key configuration ID for workspace
#' storage.
#' 
#' After calling the `PATCH` operation to update the workspace configuration,
#' make repeated `GET` requests with the workspace ID and check the workspace
#' status. The workspace is successful if the status changes to `RUNNING`.
#' 
#' For information about how to create a new workspace with this API **including
#' error handling**, see [Create a new workspace using the Account API].
#' 
#' ### Update a running workspace You can update a Databricks workspace
#' configuration for running workspaces for some fields, but not all fields. For
#' a running workspace, this request supports updating the following fields
#' only: - Credential configuration ID
#' 
#' - Network configuration ID. Used only if you already use use customer-managed
#' VPC. This change is supported only if you specified a network configuration
#' ID in your original workspace creation. In other words, you cannot switch
#' from a Databricks-managed VPC to a customer-managed VPC. **Note**: You cannot
#' use a network configuration update in this API to add support for PrivateLink
#' (in Public Preview). To add PrivateLink to an existing workspace, contact
#' your Databricks representative.
#' 
#' - Key configuration ID for managed services (control plane storage, such as
#' notebook source and Databricks SQL queries). Databricks does not directly
#' encrypt the data with the customer-managed key (CMK). Databricks uses both
#' the CMK and the Databricks managed key (DMK) that is unique to your workspace
#' to encrypt the Data Encryption Key (DEK). Databricks uses the DEK to encrypt
#' your workspace's managed services persisted data. If the workspace does not
#' already have a CMK for managed services, adding this ID enables managed
#' services encryption for new or updated data. Existing managed services data
#' that existed before adding the key remains not encrypted with the DEK until
#' it is modified. If the workspace already has customer-managed keys for
#' managed services, this request rotates (changes) the CMK keys and the DEK is
#' re-encrypted with the DMK and the new CMK. - Key configuration ID for
#' workspace storage (root S3 bucket and, optionally, EBS volumes). You can set
#' this only if the workspace does not already have a customer-managed key
#' configuration for workspace storage.
#' 
#' **Important**: For updating running workspaces, this API is unavailable on
#' Mondays, Tuesdays, and Thursdays from 4:30pm-7:30pm PST due to routine
#' maintenance. Plan your workspace updates accordingly. For questions about
#' this schedule, contact your Databricks representative.
#' 
#' **Important**: To update a running workspace, your workspace must have no
#' running cluster instances, which includes all-purpose clusters, job clusters,
#' and pools that might have running clusters. Terminate all cluster instances
#' in the workspace before calling this API.
#' 
#' ### Wait until changes take effect. After calling the `PATCH` operation to
#' update the workspace configuration, make repeated `GET` requests with the
#' workspace ID and check the workspace status and the status of the fields. *
#' For workspaces with a Databricks-managed VPC, the workspace status becomes
#' `PROVISIONING` temporarily (typically under 20 minutes). If the workspace
#' update is successful, the workspace status changes to `RUNNING`. Note that
#' you can also check the workspace status in the [Account Console]. However,
#' you cannot use or create clusters for another 20 minutes after that status
#' change. This results in a total of up to 40 minutes in which you cannot
#' create clusters. If you create or use clusters before this time interval
#' elapses, clusters do not launch successfully, fail, or could cause other
#' unexpected behavior.
#' 
#' * For workspaces with a customer-managed VPC, the workspace status stays at
#' status `RUNNING` and the VPC change happens immediately. A change to the
#' storage customer-managed key configuration ID might take a few minutes to
#' update, so continue to check the workspace until you observe that it has been
#' updated. If the update fails, the workspace might revert silently to its
#' original configuration. After the workspace has been updated, you cannot use
#' or create clusters for another 20 minutes. If you create or use clusters
#' before this time interval elapses, clusters do not launch successfully, fail,
#' or could cause other unexpected behavior.
#' 
#' If you update the _storage_ customer-managed key configurations, it takes 20
#' minutes for the changes to fully take effect. During the 20 minute wait, it
#' is important that you stop all REST API calls to the DBFS API. If you are
#' modifying _only the managed services key configuration_, you can omit the 20
#' minute wait.
#' 
#' **Important**: Customer-managed keys and customer-managed VPCs are supported
#' by only some deployment types and subscription types. If you have questions
#' about availability, contact your Databricks representative.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform or on a select custom plan that allows multiple workspaces per
#' account.
#' 
#' [Account Console]: https://docs.databricks.com/administration-guide/account-settings-e2/account-console-e2.html
#' [Create a new workspace using the Account API]: http://docs.databricks.com/administration-guide/account-api/new-workspace.html
#'
#' @param aws_region The AWS region of the workspace's data plane (for example, `us-west-2`).
#' @param credentials_id ID of the workspace's credential configuration object.
#' @param managed_services_customer_managed_key_id The ID of the workspace's managed services encryption key configuration object.
#' @param network_id The ID of the workspace's network configuration object.
#' @param storage_configuration_id The ID of the workspace's storage configuration object.
#' @param storage_customer_managed_key_id The ID of the key configuration object for workspace storage.
#' @param workspace_id Workspace ID.
databricks_workspaces_update <- function(workspace_id, aws_region = NULL, 
    credentials_id = NULL, 
    managed_services_customer_managed_key_id = NULL, 
    network_id = NULL, 
    storage_configuration_id = NULL, 
    storage_customer_managed_key_id = NULL, 
    ...) {
    body <- list(
        aws_region = aws_region, 
        credentials_id = credentials_id, 
        managed_services_customer_managed_key_id = managed_services_customer_managed_key_id, 
        network_id = network_id, 
        storage_configuration_id = storage_configuration_id, 
        storage_customer_managed_key_id = storage_customer_managed_key_id, ...)
    .api$do("PATCH", paste("/api/2.0/accounts/", .api$account_id, "/workspaces/", workspace_id, sep = ""), body = body)
}

