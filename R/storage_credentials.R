# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a storage credential.
#' 
#' Creates a new storage credential.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_managed_identity The Azure managed identity configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param cloudflare_api_token The Cloudflare API token configuration.
#' @param comment Comment associated with the credential.
#' @param databricks_gcp_service_account The <Databricks> managed GCP service account configuration.
#' @param name Required. The credential name.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param skip_validation Supplying true to this argument skips validation of the created credential.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/storagecredentials/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_storage_credential
#' @alias storageCredentialsCreate
#' @export
create_storage_credential <- function(client, name, aws_iam_role = NULL, azure_managed_identity = NULL,
  azure_service_principal = NULL, cloudflare_api_token = NULL, comment = NULL,
  databricks_gcp_service_account = NULL, read_only = NULL, skip_validation = NULL) {
  body <- list(aws_iam_role = aws_iam_role, azure_managed_identity = azure_managed_identity,
    azure_service_principal = azure_service_principal, cloudflare_api_token = cloudflare_api_token,
    comment = comment, databricks_gcp_service_account = databricks_gcp_service_account,
    name = name, read_only = read_only, skip_validation = skip_validation)
  client$do("POST", "/api/2.1/unity-catalog/storage-credentials", body = body)
}

#' @rdname create_storage_credential
#' @export 
storageCredentialsCreate <- create_storage_credential
#' Delete a credential.
#' 
#' Deletes a storage credential from the metastore. The caller must be an owner
#' of the storage credential.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param force Force deletion even if there are dependent external locations or external tables.
#' @param name Required. Name of the storage credential.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/storagecredentials/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_storage_credential
#' @alias storageCredentialsDelete
#' @export
delete_storage_credential <- function(client, name, force = NULL) {
  query <- list(force = force)
  client$do("DELETE", paste("/api/2.1/unity-catalog/storage-credentials/", name,
    sep = ""), query = query)
}

#' @rdname delete_storage_credential
#' @export 
storageCredentialsDelete <- delete_storage_credential
#' Get a credential.
#' 
#' Gets a storage credential from the metastore. The caller must be a metastore
#' admin, the owner of the storage credential, or have some permission on the
#' storage credential.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the storage credential.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/storagecredentials/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_storage_credential
#' @alias storageCredentialsGet
#' @export
get_storage_credential <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/storage-credentials/", name, sep = ""))
}

#' @rdname get_storage_credential
#' @export 
storageCredentialsGet <- get_storage_credential
#' List credentials.
#' 
#' Gets an array of storage credentials (as __StorageCredentialInfo__ objects).
#' The array is limited to only those storage credentials the caller has
#' permission to access. If the caller is a metastore admin, retrieval of
#' credentials is unrestricted. There is no guarantee of a specific ordering of
#' the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param max_results Maximum number of storage credentials to return.
#' @param page_token Opaque pagination token to go to next page based on previous query.
#'
#' @return `data.frame` with all of the response pages.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/storagecredentials/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_storage_credentials
#' @alias storageCredentialsList
#' @export
list_storage_credentials <- function(client, max_results = NULL, page_token = NULL) {
  query <- list(max_results = max_results, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/storage-credentials", query = query)
    if (is.null(nrow(json$storage_credentials))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$storage_credentials)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_storage_credentials
#' @export 
storageCredentialsList <- list_storage_credentials
#' Update a credential.
#' 
#' Updates a storage credential on the metastore.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_managed_identity The Azure managed identity configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param cloudflare_api_token The Cloudflare API token configuration.
#' @param comment Comment associated with the credential.
#' @param databricks_gcp_service_account The <Databricks> managed GCP service account configuration.
#' @param force Force update even if there are dependent external locations or external tables.
#' @param name Required. Name of the storage credential.
#' @param new_name New name for the storage credential.
#' @param owner Username of current owner of credential.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param skip_validation Supplying true to this argument skips validation of the updated credential.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/storagecredentials/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_storage_credential
#' @alias storageCredentialsUpdate
#' @export
update_storage_credential <- function(client, name, aws_iam_role = NULL, azure_managed_identity = NULL,
  azure_service_principal = NULL, cloudflare_api_token = NULL, comment = NULL,
  databricks_gcp_service_account = NULL, force = NULL, new_name = NULL, owner = NULL,
  read_only = NULL, skip_validation = NULL) {
  body <- list(aws_iam_role = aws_iam_role, azure_managed_identity = azure_managed_identity,
    azure_service_principal = azure_service_principal, cloudflare_api_token = cloudflare_api_token,
    comment = comment, databricks_gcp_service_account = databricks_gcp_service_account,
    force = force, new_name = new_name, owner = owner, read_only = read_only,
    skip_validation = skip_validation)
  client$do("PATCH", paste("/api/2.1/unity-catalog/storage-credentials/", name,
    sep = ""), body = body)
}

#' @rdname update_storage_credential
#' @export 
storageCredentialsUpdate <- update_storage_credential
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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_managed_identity The Azure managed identity configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param cloudflare_api_token The Cloudflare API token configuration.
#' @param databricks_gcp_service_account The Databricks created GCP service account configuration.
#' @param external_location_name The name of an existing external location to validate.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param storage_credential_name The name of the storage credential to validate.
#' @param url The external location url to validate.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/storagecredentials/validate) for more 
#' information on the request and response field structure.
#'
#' @rdname validate_storage_credential
#' @alias storageCredentialsValidate
#' @export
validate_storage_credential <- function(client, aws_iam_role = NULL, azure_managed_identity = NULL,
  azure_service_principal = NULL, cloudflare_api_token = NULL, databricks_gcp_service_account = NULL,
  external_location_name = NULL, read_only = NULL, storage_credential_name = NULL,
  url = NULL) {
  body <- list(aws_iam_role = aws_iam_role, azure_managed_identity = azure_managed_identity,
    azure_service_principal = azure_service_principal, cloudflare_api_token = cloudflare_api_token,
    databricks_gcp_service_account = databricks_gcp_service_account, external_location_name = external_location_name,
    read_only = read_only, storage_credential_name = storage_credential_name,
    url = url)
  client$do("POST", "/api/2.1/unity-catalog/validate-storage-credentials", body = body)
}

#' @rdname validate_storage_credential
#' @export 
storageCredentialsValidate <- validate_storage_credential






