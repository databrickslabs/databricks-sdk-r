# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Register an instance profile.
#' 
#' In the UI, you can select the instance profile when launching clusters. This
#' API is only available to admin users.
#'
#' @param iam_role_arn The AWS IAM role ARN of the role associated with the instance profile.
#' @param instance_profile_arn The AWS ARN of the instance profile to register with Databricks.
#' @param is_meta_instance_profile By default, Databricks validates that it has sufficient permissions to launch instances with the instance profile.
#' @param skip_validation By default, Databricks validates that it has sufficient permissions to launch instances with the instance profile.
instance_profiles_add <- function(instance_profile_arn, iam_role_arn = NULL, 
    is_meta_instance_profile = NULL, 
    skip_validation = NULL, 
    ...) {
    body <- list(
        iam_role_arn = iam_role_arn, 
        instance_profile_arn = instance_profile_arn, 
        is_meta_instance_profile = is_meta_instance_profile, 
        skip_validation = skip_validation, ...)
    
    .api$do("POST", "/api/2.0/instance-profiles/add", body = body)
}

#' Edit an instance profile.
#' 
#' The only supported field to change is the optional IAM role ARN associated
#' with the instance profile. It is required to specify the IAM role ARN if both
#' of the following are true:
#' 
#' * Your role name and instance profile name do not match. The name is the part
#' after the last slash in each ARN. * You want to use the instance profile with
#' [Databricks SQL Serverless].
#' 
#' To understand where these fields are in the AWS console, see [Enable
#' serverless SQL warehouses].
#' 
#' This API is only available to admin users.
#' 
#' [Databricks SQL Serverless]: https://docs.databricks.com/sql/admin/serverless.html
#' [Enable serverless SQL warehouses]: https://docs.databricks.com/sql/admin/serverless.html
#'
#' @param iam_role_arn The AWS IAM role ARN of the role associated with the instance profile.
#' @param instance_profile_arn The AWS ARN of the instance profile to register with Databricks.
#' @param is_meta_instance_profile By default, Databricks validates that it has sufficient permissions to launch instances with the instance profile.
instance_profiles_edit <- function(instance_profile_arn, iam_role_arn = NULL, 
    is_meta_instance_profile = NULL, 
    ...) {
    body <- list(
        iam_role_arn = iam_role_arn, 
        instance_profile_arn = instance_profile_arn, 
        is_meta_instance_profile = is_meta_instance_profile, ...)
    
    .api$do("POST", "/api/2.0/instance-profiles/edit", body = body)
}

#' List available instance profiles.
#' 
#' List the instance profiles that the calling user can use to launch a cluster.
#' 
#' This API is available to all users.
instance_profiles_list <- function(...) {
    
    
    json <- .api$do("GET", "/api/2.0/instance-profiles/list")
    return (json$instance_profiles)
    
}

#' Remove the instance profile.
#' 
#' Remove the instance profile with the provided ARN. Existing clusters with
#' this instance profile will continue to function.
#' 
#' This API is only accessible to admin users.
#'
#' @param instance_profile_arn The ARN of the instance profile to remove.
instance_profiles_remove <- function(instance_profile_arn, ...) {
    body <- list(
        instance_profile_arn = instance_profile_arn, ...)
    
    .api$do("POST", "/api/2.0/instance-profiles/remove", body = body)
}













