# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' An external location is an object that combines a cloud storage path with a
#' storage credential that authorizes access to the cloud storage path. Each
#' external location is subject to Unity Catalog access-control policies that
#' control which users and groups can access the credential. If a user does not
#' have access to an external location in Unity Catalog, the request fails and
#' Unity Catalog does not attempt to authenticate to your cloud tenant on the
#' user’s behalf.
#' 
#' Databricks recommends using external locations rather than using storage
#' credentials directly.
#' 
#' To create external locations, you must be a metastore admin or a user with
#' the **CREATE_EXTERNAL_LOCATION** privilege.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=external_locations_create]{create} \tab Create an external location.\cr
#'  \link[=external_locations_delete]{delete} \tab Delete an external location.\cr
#'  \link[=external_locations_get]{get} \tab Get an external location.\cr
#'  \link[=external_locations_list]{list} \tab List external locations.\cr
#'  \link[=external_locations_update]{update} \tab Update an external location.\cr
#' }
#'
#' @rdname external_locations
#' @export
external_locations <- list()

#' Create an external location.
#' 
#' Creates a new external location entry in the metastore. The caller must be a
#' metastore admin or have the **CREATE_EXTERNAL_LOCATION** privilege on both
#' the metastore and the associated storage credential.
#'
#' @param comment User-provided free-form text description.
#' @param credential_name Required. Name of the storage credential used with this location.
#' @param name Required. Name of the external location.
#' @param read_only Indicates whether the external location is read-only.
#' @param skip_validation Skips validation of the storage credential associated with the external location.
#' @param url Required. Path URL of the external location.
#'
#' @keywords internal
#'
#' @rdname external_locations_create
#'
#' @aliases external_locations_create
external_locations_create <- function(name, url, credential_name, comment = NULL,
  read_only = NULL, skip_validation = NULL) {
  body <- list(comment = comment, credential_name = credential_name, name = name,
    read_only = read_only, skip_validation = skip_validation, url = url)
  .api$do("POST", "/api/2.1/unity-catalog/external-locations", body = body)
}
external_locations$create <- external_locations_create

#' Delete an external location.
#' 
#' Deletes the specified external location from the metastore. The caller must
#' be the owner of the external location.
#'
#' @param force Force deletion even if there are dependent external tables or mounts.
#' @param name Required. Name of the external location.
#'
#' @keywords internal
#'
#' @rdname external_locations_delete
#'
#' @aliases external_locations_delete
external_locations_delete <- function(name, force = NULL) {
  query <- list(force = force)
  .api$do("DELETE", paste("/api/2.1/unity-catalog/external-locations/", name, sep = ""),
    query = query)
}
external_locations$delete <- external_locations_delete

#' Get an external location.
#' 
#' Gets an external location from the metastore. The caller must be either a
#' metastore admin, the owner of the external location, or a user that has some
#' privilege on the external location.
#'
#' @param name Required. Name of the external location.
#'
#' @keywords internal
#'
#' @rdname external_locations_get
#'
#' @aliases external_locations_get
external_locations_get <- function(name) {

  .api$do("GET", paste("/api/2.1/unity-catalog/external-locations/", name, sep = ""))
}
external_locations$get <- external_locations_get

#' List external locations.
#' 
#' Gets an array of external locations (__ExternalLocationInfo__ objects) from
#' the metastore. The caller must be a metastore admin, the owner of the
#' external location, or a user that has some privilege on the external
#' location. There is no guarantee of a specific ordering of the elements in the
#' array.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname external_locations_list
#'
#' @aliases external_locations_list
external_locations_list <- function() {

  json <- .api$do("GET", "/api/2.1/unity-catalog/external-locations")
  return(json$external_locations)

}
external_locations$list <- external_locations_list

#' Update an external location.
#' 
#' Updates an external location in the metastore. The caller must be the owner
#' of the external location, or be a metastore admin. In the second case, the
#' admin can only update the name of the external location.
#'
#' @param comment User-provided free-form text description.
#' @param credential_name Name of the storage credential used with this location.
#' @param force Force update even if changing url invalidates dependent external tables or mounts.
#' @param name Name of the external location.
#' @param owner The owner of the external location.
#' @param read_only Indicates whether the external location is read-only.
#' @param url Path URL of the external location.
#'
#' @keywords internal
#'
#' @rdname external_locations_update
#'
#' @aliases external_locations_update
external_locations_update <- function(name, comment = NULL, credential_name = NULL,
  force = NULL, owner = NULL, read_only = NULL, url = NULL) {
  body <- list(comment = comment, credential_name = credential_name, force = force,
    name = name, owner = owner, read_only = read_only, url = url)
  .api$do("PATCH", paste("/api/2.1/unity-catalog/external-locations/", name, sep = ""),
    body = body)
}
external_locations$update <- external_locations_update

