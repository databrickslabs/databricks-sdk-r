# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Register an instance profile.
#' 
#' In the UI, you can select the instance profile when launching clusters. This
#' API is only available to admin users.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param iam_role_arn The AWS IAM role ARN of the role associated with the instance profile.
#' @param instance_profile_arn Required. The AWS ARN of the instance profile to register with Databricks.
#' @param is_meta_instance_profile Boolean flag indicating whether the instance profile should only be used in credential passthrough scenarios.
#' @param skip_validation By default, Databricks validates that it has sufficient permissions to launch instances with the instance profile.
#'
#' @rdname instanceProfilesAdd
#' @export
instanceProfilesAdd <- function(client, instance_profile_arn, iam_role_arn = NULL,
  is_meta_instance_profile = NULL, skip_validation = NULL) {
  body <- list(iam_role_arn = iam_role_arn, instance_profile_arn = instance_profile_arn,
    is_meta_instance_profile = is_meta_instance_profile, skip_validation = skip_validation)
  client$do("POST", "/api/2.0/instance-profiles/add", body = body)
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
#' @param client Required. Instance of DatabricksClient()

#'
#' @param iam_role_arn The AWS IAM role ARN of the role associated with the instance profile.
#' @param instance_profile_arn Required. The AWS ARN of the instance profile to register with Databricks.
#' @param is_meta_instance_profile Boolean flag indicating whether the instance profile should only be used in credential passthrough scenarios.
#'
#' @rdname instanceProfilesEdit
#' @export
instanceProfilesEdit <- function(client, instance_profile_arn, iam_role_arn = NULL,
  is_meta_instance_profile = NULL) {
  body <- list(iam_role_arn = iam_role_arn, instance_profile_arn = instance_profile_arn,
    is_meta_instance_profile = is_meta_instance_profile)
  client$do("POST", "/api/2.0/instance-profiles/edit", body = body)
}

#' List available instance profiles.
#' 
#' List the instance profiles that the calling user can use to launch a cluster.
#' 
#' This API is available to all users.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname instanceProfilesList
#' @export
instanceProfilesList <- function(client) {

  json <- client$do("GET", "/api/2.0/instance-profiles/list")
  return(json$instance_profiles)

}

#' Remove the instance profile.
#' 
#' Remove the instance profile with the provided ARN. Existing clusters with
#' this instance profile will continue to function.
#' 
#' This API is only accessible to admin users.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param instance_profile_arn Required. The ARN of the instance profile to remove.
#'
#' @rdname instanceProfilesRemove
#' @export
instanceProfilesRemove <- function(client, instance_profile_arn) {
  body <- list(instance_profile_arn = instance_profile_arn)
  client$do("POST", "/api/2.0/instance-profiles/remove", body = body)
}

