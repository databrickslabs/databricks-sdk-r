# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' The Instance Profiles API allows admins to add, list, and remove instance
#' profiles that users can launch clusters with. Regular users can list the
#' instance profiles available to them. See [Secure access to S3 buckets] using
#' instance profiles for more information.
#' 
#' [Secure access to S3 buckets]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/instance-profiles.html
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=instance_profiles_add]{add} \tab Register an instance profile.\cr
#'  \link[=instance_profiles_edit]{edit} \tab Edit an instance profile.\cr
#'  \link[=instance_profiles_list]{list} \tab List available instance profiles.\cr
#'  \link[=instance_profiles_remove]{remove} \tab Remove the instance profile.\cr
#' }
#'
#' @rdname instance_profiles
#' @export
instance_profiles <- list()

#' Register an instance profile.
#' 
#' In the UI, you can select the instance profile when launching clusters. This
#' API is only available to admin users.
#'
#' @param iam_role_arn The AWS IAM role ARN of the role associated with the instance profile.
#' @param instance_profile_arn Required. The AWS ARN of the instance profile to register with Databricks.
#' @param is_meta_instance_profile By default, Databricks validates that it has sufficient permissions to launch instances with the instance profile.
#' @param skip_validation By default, Databricks validates that it has sufficient permissions to launch instances with the instance profile.
#'
#' @keywords internal
#'
#' @rdname instance_profiles_add
#'
#' @aliases instance_profiles_add
instance_profiles_add <- function(instance_profile_arn, iam_role_arn = NULL, is_meta_instance_profile = NULL,
  skip_validation = NULL, ...) {
  body <- list(iam_role_arn = iam_role_arn, instance_profile_arn = instance_profile_arn,
    is_meta_instance_profile = is_meta_instance_profile, skip_validation = skip_validation,
    ...)

  .api$do("POST", "/api/2.0/instance-profiles/add", body = body)
}
instance_profiles$add <- instance_profiles_add

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
#' @param instance_profile_arn Required. The AWS ARN of the instance profile to register with Databricks.
#' @param is_meta_instance_profile By default, Databricks validates that it has sufficient permissions to launch instances with the instance profile.
#'
#' @keywords internal
#'
#' @rdname instance_profiles_edit
#'
#' @aliases instance_profiles_edit
instance_profiles_edit <- function(instance_profile_arn, iam_role_arn = NULL, is_meta_instance_profile = NULL,
  ...) {
  body <- list(iam_role_arn = iam_role_arn, instance_profile_arn = instance_profile_arn,
    is_meta_instance_profile = is_meta_instance_profile, ...)

  .api$do("POST", "/api/2.0/instance-profiles/edit", body = body)
}
instance_profiles$edit <- instance_profiles_edit

#' List available instance profiles.
#' 
#' List the instance profiles that the calling user can use to launch a cluster.
#' 
#' This API is available to all users.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname instance_profiles_list
#'
#' @aliases instance_profiles_list
instance_profiles_list <- function(...) {


  json <- .api$do("GET", "/api/2.0/instance-profiles/list")
  return(json$instance_profiles)

}
instance_profiles$list <- instance_profiles_list

#' Remove the instance profile.
#' 
#' Remove the instance profile with the provided ARN. Existing clusters with
#' this instance profile will continue to function.
#' 
#' This API is only accessible to admin users.
#'
#' @param instance_profile_arn Required. The ARN of the instance profile to remove.
#'
#' @keywords internal
#'
#' @rdname instance_profiles_remove
#'
#' @aliases instance_profiles_remove
instance_profiles_remove <- function(instance_profile_arn, ...) {
  body <- list(instance_profile_arn = instance_profile_arn, ...)

  .api$do("POST", "/api/2.0/instance-profiles/remove", body = body)
}
instance_profiles$remove <- instance_profiles_remove

