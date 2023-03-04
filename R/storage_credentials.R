# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a storage credential.
#' 
#' Creates a new storage credential. The request object is specific to the
#' cloud:
#' 
#' * **AwsIamRole** for AWS credentials * **AzureServicePrincipal** for Azure
#' credentials * **GcpServiceAcountKey** for GCP credentials.
#' 
#' The caller must be a metastore admin and have the
#' **CREATE_STORAGE_CREDENTIAL** privilege on the metastore.
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param comment Comment associated with the credential.
#' @param gcp_service_account_key The GCP service account key configuration.
#' @param metastore_id Databricks Unity Catalog metastore ID.
#' @param name The credential name.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param skip_validation Supplying true to this argument skips validation of the created credential.
storage_credentials_create <- function(name, metastore_id, aws_iam_role = NULL, 
    azure_service_principal = NULL, 
    comment = NULL, 
    gcp_service_account_key = NULL, 
    read_only = NULL, 
    skip_validation = NULL, 
    ...) {
    body <- list(
        aws_iam_role = aws_iam_role, 
        azure_service_principal = azure_service_principal, 
        comment = comment, 
        gcp_service_account_key = gcp_service_account_key, 
        name = name, 
        read_only = read_only, 
        skip_validation = skip_validation, ...)
    
    .api$do("POST", "/api/2.1/unity-catalog/storage-credentials", body = body)
}

#' Delete a credential.
#' 
#' Deletes a storage credential from the metastore. The caller must be an owner
#' of the storage credential.
#'
#' @param force Force deletion even if there are dependent external locations or external tables.
#' @param name Name of the storage credential.
storage_credentials_delete <- function(name, force = NULL, 
    ...) {
    query <- list(
        force = force, ...)
    
    .api$do("DELETE", paste("/api/2.1/unity-catalog/storage-credentials/", name, sep = ""), query = query)
}

#' Get a credential.
#' 
#' Gets a storage credential from the metastore. The caller must be a metastore
#' admin, the owner of the storage credential, or have some permission on the
#' storage credential.
#'
#' @param name Name of the storage credential.
storage_credentials_get <- function(name, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/storage-credentials/", name, sep = ""))
}

#' List credentials.
#' 
#' Gets an array of storage credentials (as __StorageCredentialInfo__ objects).
#' The array is limited to only those storage credentials the caller has
#' permission to access. If the caller is a metastore admin, all storage
#' credentials will be retrieved. There is no guarantee of a specific ordering
#' of the elements in the array.
storage_credentials_list <- function(...) {
    
    .api$do("GET", "/api/2.1/unity-catalog/storage-credentials")
}

#' Update a credential.
#' 
#' Updates a storage credential on the metastore. The caller must be the owner
#' of the storage credential or a metastore admin. If the caller is a metastore
#' admin, only the __owner__ credential can be changed.
#'
#' @param aws_iam_role The AWS IAM role configuration.
#' @param azure_service_principal The Azure service principal configuration.
#' @param comment Comment associated with the credential.
#' @param force Force update even if there are dependent external locations or external tables.
#' @param gcp_service_account_key The GCP service account key configuration.
#' @param name The credential name.
#' @param owner Username of current owner of credential.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param skip_validation Supplying true to this argument skips validation of the updated credential.
storage_credentials_update <- function(name, aws_iam_role = NULL, 
    azure_service_principal = NULL, 
    comment = NULL, 
    force = NULL, 
    gcp_service_account_key = NULL, 
    owner = NULL, 
    read_only = NULL, 
    skip_validation = NULL, 
    ...) {
    body <- list(
        aws_iam_role = aws_iam_role, 
        azure_service_principal = azure_service_principal, 
        comment = comment, 
        force = force, 
        gcp_service_account_key = gcp_service_account_key, 
        name = name, 
        owner = owner, 
        read_only = read_only, 
        skip_validation = skip_validation, ...)
    
    .api$do("PATCH", paste("/api/2.1/unity-catalog/storage-credentials/", name, sep = ""), body = body)
}

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
#' @param azure_service_principal The Azure service principal configuration.
#' @param external_location_name The name of an existing external location to validate.
#' @param gcp_service_account_key The GCP service account key configuration.
#' @param read_only Whether the storage credential is only usable for read operations.
#' @param storage_credential_name The name of the storage credential to validate.
#' @param url The external location url to validate.
storage_credentials_validate <- function(aws_iam_role = NULL, 
    azure_service_principal = NULL, 
    external_location_name = NULL, 
    gcp_service_account_key = NULL, 
    read_only = NULL, 
    storage_credential_name = NULL, 
    url = NULL, 
    ...) {
    body <- list(
        aws_iam_role = aws_iam_role, 
        azure_service_principal = azure_service_principal, 
        external_location_name = external_location_name, 
        gcp_service_account_key = gcp_service_account_key, 
        read_only = read_only, 
        storage_credential_name = storage_credential_name, 
        url = url, ...)
    
    .api$do("POST", "/api/2.1/unity-catalog/validate-storage-credentials", body = body)
}













