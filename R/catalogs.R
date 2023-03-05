# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @include api_client.R
#' @importFrom stats runif
NULL

#' A catalog is the first layer of Unity Catalog’s three-level namespace.
#' It’s used to organize your data assets. Users can see all catalogs on which
#' they have been assigned the USE_CATALOG data permission.
#' 
#' In Unity Catalog, admins and data stewards manage users and their access to
#' data centrally across all of the workspaces in a Databricks account. Users in
#' different workspaces can share access to the same data, depending on
#' privileges granted centrally in Unity Catalog.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=catalogs_create]{create} \tab Create a catalog.\cr
#'  \link[=catalogs_delete]{delete} \tab Delete a catalog.\cr
#'  \link[=catalogs_get]{get} \tab Get a catalog.\cr
#'  \link[=catalogs_list]{list} \tab List catalogs.\cr
#'  \link[=catalogs_update]{update} \tab Update a catalog.\cr
#' }
#'
#' @rdname catalogs
#' @export
catalogs <- list()

#' Create a catalog.
#' 
#' Creates a new catalog instance in the parent metastore if the caller is a
#' metastore admin or has the **CREATE_CATALOG** privilege.
#'
#' @param comment User-provided free-form text description.
#' @param name Required. Name of catalog.
#' @param properties A map of key-value properties attached to the securable.
#' @param provider_name The name of delta sharing provider.
#' @param share_name The name of the share under the share provider.
#' @param storage_root Storage root URL for managed tables within catalog.
#'
#' @keywords internal
#'
#' @rdname catalogs_create
#'
#' @aliases catalogs_create
catalogs_create <- function(name, comment = NULL, properties = NULL, provider_name = NULL,
  share_name = NULL, storage_root = NULL) {
  body <- list(comment = comment, name = name, properties = properties, provider_name = provider_name,
    share_name = share_name, storage_root = storage_root)
  .state$api$do("POST", "/api/2.1/unity-catalog/catalogs", body = body)
}
catalogs$create <- catalogs_create

#' Delete a catalog.
#' 
#' Deletes the catalog that matches the supplied name. The caller must be a
#' metastore admin or the owner of the catalog.
#'
#' @param force Force deletion even if the catalog is not empty.
#' @param name Required. The name of the catalog.
#'
#' @keywords internal
#'
#' @rdname catalogs_delete
#'
#' @aliases catalogs_delete
catalogs_delete <- function(name, force = NULL) {
  query <- list(force = force)
  .state$api$do("DELETE", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""),
    query = query)
}
catalogs$delete <- catalogs_delete

#' Get a catalog.
#' 
#' Gets the specified catalog in a metastore. The caller must be a metastore
#' admin, the owner of the catalog, or a user that has the **USE_CATALOG**
#' privilege set for their account.
#'
#' @param name Required. The name of the catalog.
#'
#' @keywords internal
#'
#' @rdname catalogs_get
#'
#' @aliases catalogs_get
catalogs_get <- function(name) {

  .state$api$do("GET", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""))
}
catalogs$get <- catalogs_get

#' List catalogs.
#' 
#' Gets an array of catalogs in the metastore. If the caller is the metastore
#' admin, all catalogs will be retrieved. Otherwise, only catalogs owned by the
#' caller (or for which the caller has the **USE_CATALOG** privilege) will be
#' retrieved. There is no guarantee of a specific ordering of the elements in
#' the array.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname catalogs_list
#'
#' @aliases catalogs_list
catalogs_list <- function() {

  json <- .state$api$do("GET", "/api/2.1/unity-catalog/catalogs")
  return(json$catalogs)

}
catalogs$list <- catalogs_list

#' Update a catalog.
#' 
#' Updates the catalog that matches the supplied name. The caller must be either
#' the owner of the catalog, or a metastore admin (when changing the owner field
#' of the catalog).
#'
#' @param comment User-provided free-form text description.
#' @param name Name of catalog.
#' @param owner Username of current owner of catalog.
#' @param properties A map of key-value properties attached to the securable.
#'
#' @keywords internal
#'
#' @rdname catalogs_update
#'
#' @aliases catalogs_update
catalogs_update <- function(name, comment = NULL, owner = NULL, properties = NULL) {
  body <- list(comment = comment, name = name, owner = owner, properties = properties)
  .state$api$do("PATCH", paste("/api/2.1/unity-catalog/catalogs/", name, sep = ""),
    body = body)
}
catalogs$update <- catalogs_update

