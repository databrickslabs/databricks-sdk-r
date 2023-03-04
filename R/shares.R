# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Databricks Delta Sharing: Shares REST API
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=shares_create]{create} \tab Create a share.\cr
#'  \link[=shares_delete]{delete} \tab Delete a share.\cr
#'  \link[=shares_get]{get} \tab Get a share.\cr
#'  \link[=shares_list]{list} \tab List shares.\cr
#'  \link[=shares_share_permissions]{share_permissions} \tab Get permissions.\cr
#'  \link[=shares_update]{update} \tab Update a share.\cr
#'  \link[=shares_update_permissions]{update_permissions} \tab Update permissions.\cr
#' }
#'
#' @rdname shares
#' @export
shares <- list()

#' Create a share.
#' 
#' Creates a new share for data objects. Data objects can be added at this time
#' or after creation with **update**. The caller must be a metastore admin or
#' have the **CREATE_SHARE** privilege on the metastore.
#'
#' @param comment User-provided free-form text description.
#' @param name [required] Name of the share.
#'
#' @keywords internal
#'
#' @rdname shares_create
#'
#' @aliases shares_create
shares_create <- function(name, comment = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, ...)
    
    .api$do("POST", "/api/2.1/unity-catalog/shares", body = body)
}
shares$create <- shares_create

#' Delete a share.
#' 
#' Deletes a data object share from the metastore. The caller must be an owner
#' of the share.
#'
#' @param name [required] The name of the share.
#'
#' @keywords internal
#'
#' @rdname shares_delete
#'
#' @aliases shares_delete
shares_delete <- function(name, ...) {
    
    
    .api$do("DELETE", paste("/api/2.1/unity-catalog/shares/", name, sep = ""))
}
shares$delete <- shares_delete

#' Get a share.
#' 
#' Gets a data object share from the metastore. The caller must be a metastore
#' admin or the owner of the share.
#'
#' @param include_shared_data Query for data to include in the share.
#' @param name [required] The name of the share.
#'
#' @keywords internal
#'
#' @rdname shares_get
#'
#' @aliases shares_get
shares_get <- function(name, include_shared_data = NULL, 
    ...) {
    query <- list(
        include_shared_data = include_shared_data, ...)
    
    .api$do("GET", paste("/api/2.1/unity-catalog/shares/", name, sep = ""), query = query)
}
shares$get <- shares_get

#' List shares.
#' 
#' Gets an array of data object shares from the metastore. The caller must be a
#' metastore admin or the owner of the share. There is no guarantee of a
#' specific ordering of the elements in the array.#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname shares_list
#'
#' @aliases shares_list
shares_list <- function(...) {
    
    
    json <- .api$do("GET", "/api/2.1/unity-catalog/shares")
    return (json$shares)
    
}
shares$list <- shares_list

#' Get permissions.
#' 
#' Gets the permissions for a data share from the metastore. The caller must be
#' a metastore admin or the owner of the share.
#'
#' @param name [required] The name of the share.
#'
#' @keywords internal
#'
#' @rdname shares_share_permissions
#'
#' @aliases shares_share_permissions
shares_share_permissions <- function(name, ...) {
    
    
    .api$do("GET", paste("/api/2.1/unity-catalog/shares/", name, "/permissions", , sep = ""))
}
shares$share_permissions <- shares_share_permissions

#' Update a share.
#' 
#' Updates the share with the changes and data objects in the request. The
#' caller must be the owner of the share or a metastore admin.
#' 
#' When the caller is a metastore admin, only the __owner__ field can be
#' updated.
#' 
#' In the case that the share name is changed, **updateShare** requires that the
#' caller is both the share owner and a metastore admin.
#' 
#' For each table that is added through this method, the share owner must also
#' have **SELECT** privilege on the table. This privilege must be maintained
#' indefinitely for recipients to be able to access the table. Typically, you
#' should use a group as the share owner.
#' 
#' Table removals through **update** do not require additional privileges.
#'
#' @param comment User-provided free-form text description.
#' @param name Name of the share.
#' @param owner Username of current owner of share.
#' @param updates Array of shared data object updates.
#'
#' @keywords internal
#'
#' @rdname shares_update
#'
#' @aliases shares_update
shares_update <- function(name, comment = NULL, 
    owner = NULL, 
    updates = NULL, 
    ...) {
    body <- list(
        comment = comment, 
        name = name, 
        owner = owner, 
        updates = updates, ...)
    
    .api$do("PATCH", paste("/api/2.1/unity-catalog/shares/", name, sep = ""), body = body)
}
shares$update <- shares_update

#' Update permissions.
#' 
#' Updates the permissions for a data share in the metastore. The caller must be
#' a metastore admin or an owner of the share.
#' 
#' For new recipient grants, the user must also be the owner of the recipients.
#' recipient revocations do not require additional privileges.
#'
#' @param changes Array of permission changes.
#' @param name [required] The name of the share.
#'
#' @keywords internal
#'
#' @rdname shares_update_permissions
#'
#' @aliases shares_update_permissions
shares_update_permissions <- function(name, changes = NULL, 
    ...) {
    body <- list(
        changes = changes, ...)
    
    .api$do("PATCH", paste("/api/2.1/unity-catalog/shares/", name, "/permissions", , sep = ""), body = body)
}
shares$update_permissions <- shares_update_permissions













