# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Migrate Permissions.
#' 
#' Migrate a batch of permissions from a workspace local group to an account
#' group.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param from_workspace_group_name Required. The name of the workspace group that permissions will be migrated from.
#' @param size The maximum number of permissions that will be migrated.
#' @param to_account_group_name Required. The name of the account group that permissions will be migrated to.
#' @param workspace_id Required. WorkspaceId of the associated workspace where the permission migration will occur.
#'
#' @rdname permissionMigrationMigratePermissions
#' @export
permissionMigrationMigratePermissions <- function(client, workspace_id, from_workspace_group_name,
  to_account_group_name, size = NULL) {
  body <- list(from_workspace_group_name = from_workspace_group_name, size = size,
    to_account_group_name = to_account_group_name, workspace_id = workspace_id)
  client$do("POST", "/api/2.0/permissionmigration", body = body)
}

