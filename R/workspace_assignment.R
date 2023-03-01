# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create permission assignments.
#' 
#' Create new permission assignments for the specified account and workspace.
#'
#' @param permission_assignments Array of permissions assignments to apply to a workspace.
#' @param workspace_id The workspace ID for the account.
databricks_workspace_assignment_create <- function(permission_assignments, workspace_id, ...) {
    body <- list(
        permission_assignments = permission_assignments, ...)
    .api$do("POST", paste("/api/2.0/preview/accounts/", .api$account_id, "/workspaces/", workspace_id, "/permissionassignments", , sep = ""), body = body)
}

#' Delete permissions assignment.
#' 
#' Deletes the workspace permissions assignment for a given account and
#' workspace using the specified service principal.
#'
#' @param principal_id The ID of the service principal.
#' @param workspace_id The workspace ID.
databricks_workspace_assignment_delete <- function(workspace_id, principal_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/preview/accounts/", .api$account_id, "/workspaces/", workspace_id, "/permissionassignments/principals/", principal_id, sep = ""))
}

#' List workspace permissions.
#' 
#' Get an array of workspace permissions for the specified account and
#' workspace.
#'
#' @param workspace_id The workspace ID.
databricks_workspace_assignment_get <- function(workspace_id, ...) {
    
    .api$do("GET", paste("/api/2.0/preview/accounts/", .api$account_id, "/workspaces/", workspace_id, "/permissionassignments/permissions", , sep = ""))
}

#' Get permission assignments.
#' 
#' Get the permission assignments for the specified Databricks Account and
#' Databricks Workspace.
#'
#' @param workspace_id The workspace ID for the account.
databricks_workspace_assignment_list <- function(workspace_id, ...) {
    
    .api$do("GET", paste("/api/2.0/preview/accounts/", .api$account_id, "/workspaces/", workspace_id, "/permissionassignments", , sep = ""))
}

#' Update permissions assignment.
#' 
#' Updates the workspace permissions assignment for a given account and
#' workspace using the specified service principal.
#'
#' @param permissions Array of permissions assignments to update on the workspace.
#' @param principal_id The ID of the service principal.
#' @param workspace_id The workspace ID.
databricks_workspace_assignment_update <- function(permissions, workspace_id, principal_id, ...) {
    body <- list(
        permissions = permissions, ...)
    .api$do("PUT", paste("/api/2.0/preview/accounts/", .api$account_id, "/workspaces/", workspace_id, "/permissionassignments/principals/", principal_id, sep = ""), body = body)
}

