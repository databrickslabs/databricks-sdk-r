# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' A storage credential represents an authentication and authorization mechanism
#' for accessing data stored on your cloud tenant. Each storage credential is
#' subject to Unity Catalog access-control policies that control which users and
#' groups can access the credential. If a user does not have access to a storage
#' credential in Unity Catalog, the request fails and Unity Catalog does not
#' attempt to authenticate to your cloud tenant on the user’s behalf.
#' 
#' Databricks recommends using external locations rather than using storage
#' credentials directly.
#' 
#' To create storage credentials, you must be a Databricks account admin. The
#' account admin who creates the storage credential can delegate ownership to
#' another user or group to manage permissions on it.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=storage_credentials_create]{create} \tab Create a storage credential.\cr
#'  \link[=storage_credentials_delete]{delete} \tab Delete a credential.\cr
#'  \link[=storage_credentials_get]{get} \tab Get a credential.\cr
#'  \link[=storage_credentials_list]{list} \tab List credentials.\cr
#'  \link[=storage_credentials_update]{update} \tab Update a credential.\cr
#'  \link[=storage_credentials_validate]{validate} \tab Validate a storage credential.\cr
#' }
#'
#' @rdname storage_credentials
#' @export
storage_credentials <- list()

#' Create a storage credential.
#' 
#' Creates a new storage credential. The request object is specific to the
#' cloud:
#' 
#' * **AwsIamRole** for AWS credentials. * **AzureServicePrincipal** for Azure
#' credentials. * **AzureManagedIdentity** for Azure managed credentials. *
#' **DatabricksGcpServiceAccount** for GCP managed credentials.
#' 
#' The caller must be a metastore admin and have the
#' **CREATE_STORAGE_CREDENTIAL** privilege on the metastore.
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_managed_identity The Azure managed identity configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param comment Comment associated with the credential.
#' @param databricks_gcp_service_account The <Databricks> managed GCP service account configuration.
#' @param name Required. The credential name.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param skip_validation Supplying true to this argument skips validation of the created credential.
#'
#' @keywords internal
#'
#' @rdname storage_credentials_create
#'
#' @aliases storage_credentials_create
storage_credentials_create <- function(name, aws_iam_role = NULL, azure_managed_identity = NULL,
  azure_service_principal = NULL, comment = NULL, databricks_gcp_service_account = NULL,
  read_only = NULL, skip_validation = NULL) {
  body <- list(aws_iam_role = aws_iam_role, azure_managed_identity = azure_managed_identity,
    azure_service_principal = azure_service_principal, comment = comment, databricks_gcp_service_account = databricks_gcp_service_account,
    name = name, read_only = read_only, skip_validation = skip_validation)
  .state$api$do("POST", "/api/2.1/unity-catalog/storage-credentials", body = body)
}
storage_credentials$create <- storage_credentials_create

#' Delete a credential.
#' 
#' Deletes a storage credential from the metastore. The caller must be an owner
#' of the storage credential.
#'
#' @param force Force deletion even if there are dependent external locations or external tables.
#' @param name Required. Name of the storage credential.
#'
#' @keywords internal
#'
#' @rdname storage_credentials_delete
#'
#' @aliases storage_credentials_delete
storage_credentials_delete <- function(name, force = NULL) {
  query <- list(force = force)
  .state$api$do("DELETE", paste("/api/2.1/unity-catalog/storage-credentials/",
    name, sep = ""), query = query)
}
storage_credentials$delete <- storage_credentials_delete

#' Get a credential.
#' 
#' Gets a storage credential from the metastore. The caller must be a metastore
#' admin, the owner of the storage credential, or have some permission on the
#' storage credential.
#'
#' @param name Required. Name of the storage credential.
#'
#' @keywords internal
#'
#' @rdname storage_credentials_get
#'
#' @aliases storage_credentials_get
storage_credentials_get <- function(name) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/storage-credentials/", name,
    sep = ""))
}
storage_credentials$get <- storage_credentials_get

#' List credentials.
#' 
#' Gets an array of storage credentials (as __StorageCredentialInfo__ objects).
#' The array is limited to only those storage credentials the caller has
#' permission to access. If the caller is a metastore admin, all storage
#' credentials will be retrieved. There is no guarantee of a specific ordering
#' of the elements in the array.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname storage_credentials_list
#'
#' @aliases storage_credentials_list
storage_credentials_list <- function() {

  json <- .state$api$do("GET", "/api/2.1/unity-catalog/storage-credentials")
  return(json$storage_credentials)

}
storage_credentials$list <- storage_credentials_list

#' Update a credential.
#' 
#' Updates a storage credential on the metastore. The caller must be the owner
#' of the storage credential or a metastore admin. If the caller is a metastore
#' admin, only the __owner__ credential can be changed.
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_managed_identity The Azure managed identity configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param comment Comment associated with the credential.
#' @param databricks_gcp_service_account The <Databricks> managed GCP service account configuration.
#' @param force Force update even if there are dependent external locations or external tables.
#' @param name The credential name.
#' @param owner Username of current owner of credential.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param skip_validation Supplying true to this argument skips validation of the updated credential.
#'
#' @keywords internal
#'
#' @rdname storage_credentials_update
#'
#' @aliases storage_credentials_update
storage_credentials_update <- function(name, aws_iam_role = NULL, azure_managed_identity = NULL,
  azure_service_principal = NULL, comment = NULL, databricks_gcp_service_account = NULL,
  force = NULL, owner = NULL, read_only = NULL, skip_validation = NULL) {
  body <- list(aws_iam_role = aws_iam_role, azure_managed_identity = azure_managed_identity,
    azure_service_principal = azure_service_principal, comment = comment, databricks_gcp_service_account = databricks_gcp_service_account,
    force = force, name = name, owner = owner, read_only = read_only, skip_validation = skip_validation)
  .state$api$do("PATCH", paste("/api/2.1/unity-catalog/storage-credentials/", name,
    sep = ""), body = body)
}
storage_credentials$update <- storage_credentials_update

#' Validate a storage credential.
#' 
#' Validates a storage credential. At least one of __external_location_name__
#' and __url__ need to be provided. If only one of them is provided, it will be
#' used for validation. And if both are provided, the __url__ will be used for
#' validation, and __external_location_name__ will be ignored when checking
#' overlapping urls.
#' 
#' Either the __storage_credential_name__ or the cloud-specific credential must
#' be provided.
#' 
#' The caller must be a metastore admin or the storage credential owner or have
#' the **CREATE_EXTERNAL_LOCATION** privilege on the metastore and the storage
#' credential.
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_managed_identity The Azure managed identity configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param databricks_gcp_service_account The Databricks created GCP service account configuration.
#' @param external_location_name The name of an existing external location to validate.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param storage_credential_name The name of the storage credential to validate.
#' @param url The external location url to validate.
#'
#' @keywords internal
#'
#' @rdname storage_credentials_validate
#'
#' @aliases storage_credentials_validate
storage_credentials_validate <- function(aws_iam_role = NULL, azure_managed_identity = NULL,
  azure_service_principal = NULL, databricks_gcp_service_account = NULL, external_location_name = NULL,
  read_only = NULL, storage_credential_name = NULL, url = NULL) {
  body <- list(aws_iam_role = aws_iam_role, azure_managed_identity = azure_managed_identity,
    azure_service_principal = azure_service_principal, databricks_gcp_service_account = databricks_gcp_service_account,
    external_location_name = external_location_name, read_only = read_only, storage_credential_name = storage_credential_name,
    url = url)
  .state$api$do("POST", "/api/2.1/unity-catalog/validate-storage-credentials",
    body = body)
}
storage_credentials$validate <- storage_credentials_validate

