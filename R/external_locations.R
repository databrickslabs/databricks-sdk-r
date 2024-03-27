# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an external location.
#' 
#' Creates a new external location entry in the metastore. The caller must be a
#' metastore admin or have the **CREATE_EXTERNAL_LOCATION** privilege on both
#' the metastore and the associated storage credential.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_point The AWS access point to use when accesing s3 for this external location.
#' @param comment User-provided free-form text description.
#' @param credential_name Required. Name of the storage credential used with this location.
#' @param encryption_details Encryption options that apply to clients connecting to cloud storage.
#' @param name Required. Name of the external location.
#' @param read_only Indicates whether the external location is read-only.
#' @param skip_validation Skips validation of the storage credential associated with the external location.
#' @param url Required. Path URL of the external location.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/externallocations/create) for more 
#' information on the request and response field structure.
#'
#' @rdname create_external_location
#' @alias externalLocationsCreate
#' @export
create_external_location <- function(client, name, url, credential_name, access_point = NULL,
  comment = NULL, encryption_details = NULL, read_only = NULL, skip_validation = NULL) {
  body <- list(access_point = access_point, comment = comment, credential_name = credential_name,
    encryption_details = encryption_details, name = name, read_only = read_only,
    skip_validation = skip_validation, url = url)
  client$do("POST", "/api/2.1/unity-catalog/external-locations", body = body)
}

#' @rdname create_external_location
#' @export 
externalLocationsCreate <- create_external_location
#' Delete an external location.
#' 
#' Deletes the specified external location from the metastore. The caller must
#' be the owner of the external location.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param force Force deletion even if there are dependent external tables or mounts.
#' @param name Required. Name of the external location.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/externallocations/delete) for more 
#' information on the request and response field structure.
#'
#' @rdname delete_external_location
#' @alias externalLocationsDelete
#' @export
delete_external_location <- function(client, name, force = NULL) {
  query <- list(force = force)
  client$do("DELETE", paste("/api/2.1/unity-catalog/external-locations/", name,
    sep = ""), query = query)
}

#' @rdname delete_external_location
#' @export 
externalLocationsDelete <- delete_external_location
#' Get an external location.
#' 
#' Gets an external location from the metastore. The caller must be either a
#' metastore admin, the owner of the external location, or a user that has some
#' privilege on the external location.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_browse Whether to include external locations in the response for which the principal can only access selective metadata for.
#' @param name Required. Name of the external location.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/externallocations/get) for more 
#' information on the request and response field structure.
#'
#' @rdname get_external_location
#' @alias externalLocationsGet
#' @export
get_external_location <- function(client, name, include_browse = NULL) {
  query <- list(include_browse = include_browse)
  client$do("GET", paste("/api/2.1/unity-catalog/external-locations/", name, sep = ""),
    query = query)
}

#' @rdname get_external_location
#' @export 
externalLocationsGet <- get_external_location
#' List external locations.
#' 
#' Gets an array of external locations (__ExternalLocationInfo__ objects) from
#' the metastore. The caller must be a metastore admin, the owner of the
#' external location, or a user that has some privilege on the external
#' location. There is no guarantee of a specific ordering of the elements in the
#' array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_browse Whether to include external locations in the response for which the principal can only access selective metadata for.
#' @param max_results Maximum number of external locations to return.
#' @param page_token Opaque pagination token to go to next page based on previous query.
#'
#' @return `data.frame` with all of the response pages.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/externallocations/list) for more 
#' information on the request and response field structure.
#'
#' @rdname list_external_locations
#' @alias externalLocationsList
#' @export
list_external_locations <- function(client, include_browse = NULL, max_results = NULL,
  page_token = NULL) {
  query <- list(include_browse = include_browse, max_results = max_results, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/external-locations", query = query)
    if (is.null(nrow(json$external_locations))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$external_locations)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_external_locations
#' @export 
externalLocationsList <- list_external_locations
#' Update an external location.
#' 
#' Updates an external location in the metastore. The caller must be the owner
#' of the external location, or be a metastore admin. In the second case, the
#' admin can only update the name of the external location.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param access_point The AWS access point to use when accesing s3 for this external location.
#' @param comment User-provided free-form text description.
#' @param credential_name Name of the storage credential used with this location.
#' @param encryption_details Encryption options that apply to clients connecting to cloud storage.
#' @param force Force update even if changing url invalidates dependent external tables or mounts.
#' @param name Required. Name of the external location.
#' @param new_name New name for the external location.
#' @param owner The owner of the external location.
#' @param read_only Indicates whether the external location is read-only.
#' @param skip_validation Skips validation of the storage credential associated with the external location.
#' @param url Path URL of the external location.
#'
#' See the [API documentation](https://docs.databricks.com/api/workspace/externallocations/update) for more 
#' information on the request and response field structure.
#'
#' @rdname update_external_location
#' @alias externalLocationsUpdate
#' @export
update_external_location <- function(client, name, access_point = NULL, comment = NULL,
  credential_name = NULL, encryption_details = NULL, force = NULL, new_name = NULL,
  owner = NULL, read_only = NULL, skip_validation = NULL, url = NULL) {
  body <- list(access_point = access_point, comment = comment, credential_name = credential_name,
    encryption_details = encryption_details, force = force, new_name = new_name,
    owner = owner, read_only = read_only, skip_validation = skip_validation,
    url = url)
  client$do("PATCH", paste("/api/2.1/unity-catalog/external-locations/", name,
    sep = ""), body = body)
}

#' @rdname update_external_location
#' @export 
externalLocationsUpdate <- update_external_location





