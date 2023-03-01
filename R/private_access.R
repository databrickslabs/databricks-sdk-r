# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create private access settings.
#' 
#' Creates a private access settings object, which specifies how your workspace
#' is accessed over [AWS PrivateLink]. To use AWS PrivateLink, a workspace must
#' have a private access settings object referenced by ID in the workspace's
#' `private_access_settings_id` property.
#' 
#' You can share one private access settings with multiple workspaces in a
#' single account. However, private access settings are specific to AWS regions,
#' so only workspaces in the same AWS region can use a given private access
#' settings object.
#' 
#' Before configuring PrivateLink, read the [Databricks article about
#' PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [AWS PrivateLink]: https://aws.amazon.com/privatelink
#' [Databricks article about PrivateLink]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html
#'
#' @param allowed_vpc_endpoint_ids An array of Databricks VPC endpoint IDs.
#' @param private_access_level The private access level controls which VPC endpoints can connect to the UI or API of any workspace that attaches this private access settings object.
#' @param private_access_settings_id Databricks Account API private access settings ID.
#' @param private_access_settings_name The human-readable name of the private access settings object.
#' @param public_access_enabled Determines if the workspace can be accessed over public internet.
#' @param region The AWS region for workspaces associated with this private access settings object.
databricks_private_access_create <- function(private_access_settings_name, region, private_access_settings_id, allowed_vpc_endpoint_ids = NULL, 
    private_access_level = NULL, 
    public_access_enabled = NULL, 
    ...) {
    body <- list(
        allowed_vpc_endpoint_ids = allowed_vpc_endpoint_ids, 
        private_access_level = private_access_level, 
        private_access_settings_name = private_access_settings_name, 
        public_access_enabled = public_access_enabled, 
        region = region, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/private-access-settings", , sep = ""), body = body)
}

#' Delete a private access settings object.
#' 
#' Deletes a private access settings object, which determines how your workspace
#' is accessed over [AWS PrivateLink].
#' 
#' Before configuring PrivateLink, read the [Databricks article about
#' PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [AWS PrivateLink]: https://aws.amazon.com/privatelink
#' [Databricks article about PrivateLink]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html
#'
#' @param private_access_settings_id Databricks Account API private access settings ID.
databricks_private_access_delete <- function(private_access_settings_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/private-access-settings/", private_access_settings_id, sep = ""))
}

#' Get a private access settings object.
#' 
#' Gets a private access settings object, which specifies how your workspace is
#' accessed over [AWS PrivateLink].
#' 
#' Before configuring PrivateLink, read the [Databricks article about
#' PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [AWS PrivateLink]: https://aws.amazon.com/privatelink
#' [Databricks article about PrivateLink]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html
#'
#' @param private_access_settings_id Databricks Account API private access settings ID.
databricks_private_access_get <- function(private_access_settings_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/private-access-settings/", private_access_settings_id, sep = ""))
}

#' Get all private access settings objects.
#' 
#' Gets a list of all private access settings objects for an account, specified
#' by ID.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for AWS PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
databricks_private_access_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/private-access-settings", , sep = ""))
}

#' Replace private access settings.
#' 
#' Updates an existing private access settings object, which specifies how your
#' workspace is accessed over [AWS PrivateLink]. To use AWS PrivateLink, a
#' workspace must have a private access settings object referenced by ID in the
#' workspace's `private_access_settings_id` property.
#' 
#' This operation completely overwrites your existing private access settings
#' object attached to your workspaces. All workspaces attached to the private
#' access settings are affected by any change. If `public_access_enabled`,
#' `private_access_level`, or `allowed_vpc_endpoint_ids` are updated, effects of
#' these changes might take several minutes to propagate to the workspace API.
#' You can share one private access settings object with multiple workspaces in
#' a single account. However, private access settings are specific to AWS
#' regions, so only workspaces in the same AWS region can use a given private
#' access settings object.
#' 
#' Before configuring PrivateLink, read the [Databricks article about
#' PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [AWS PrivateLink]: https://aws.amazon.com/privatelink
#' [Databricks article about PrivateLink]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html
#'
#' @param allowed_vpc_endpoint_ids An array of Databricks VPC endpoint IDs.
#' @param private_access_level The private access level controls which VPC endpoints can connect to the UI or API of any workspace that attaches this private access settings object.
#' @param private_access_settings_id Databricks Account API private access settings ID.
#' @param private_access_settings_name The human-readable name of the private access settings object.
#' @param public_access_enabled Determines if the workspace can be accessed over public internet.
#' @param region The AWS region for workspaces associated with this private access settings object.
databricks_private_access_replace <- function(private_access_settings_name, region, private_access_settings_id, allowed_vpc_endpoint_ids = NULL, 
    private_access_level = NULL, 
    public_access_enabled = NULL, 
    ...) {
    body <- list(
        allowed_vpc_endpoint_ids = allowed_vpc_endpoint_ids, 
        private_access_level = private_access_level, 
        private_access_settings_name = private_access_settings_name, 
        public_access_enabled = public_access_enabled, 
        region = region, ...)
    .api$do("PUT", paste("/api/2.0/accounts/", .api$account_id, "/private-access-settings/", private_access_settings_id, sep = ""), body = body)
}

