# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a share.
#' 
#' Creates a new share for data objects. Data objects can be added after
#' creation with **update**. The caller must be a metastore admin or have the
#' **CREATE_SHARE** privilege on the metastore.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param name Required. Name of the share.
#'
#'
#' @rdname create_share
#' @alias sharesCreate
#' @export
create_share <- function(client, name, comment = NULL) {
  body <- list(comment = comment, name = name)
  client$do("POST", "/api/2.1/unity-catalog/shares", body = body)
}

#' @rdname create_share
#' @export 
sharesCreate <- create_share
#' Delete a share.
#' 
#' Deletes a data object share from the metastore. The caller must be an owner
#' of the share.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the share.
#'
#'
#' @rdname delete_share
#' @alias sharesDelete
#' @export
delete_share <- function(client, name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/shares/", name, sep = ""))
}

#' @rdname delete_share
#' @export 
sharesDelete <- delete_share
#' Get a share.
#' 
#' Gets a data object share from the metastore. The caller must be a metastore
#' admin or the owner of the share.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_shared_data Query for data to include in the share.
#' @param name Required. The name of the share.
#'
#'
#' @rdname get_share
#' @alias sharesGet
#' @export
get_share <- function(client, name, include_shared_data = NULL) {
  query <- list(include_shared_data = include_shared_data)
  client$do("GET", paste("/api/2.1/unity-catalog/shares/", name, sep = ""), query = query)
}

#' @rdname get_share
#' @export 
sharesGet <- get_share
#' List shares.
#' 
#' Gets an array of data object shares from the metastore. The caller must be a
#' metastore admin or the owner of the share. There is no guarantee of a
#' specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname list_shares
#' @alias sharesList
#' @export
list_shares <- function(client) {

  json <- client$do("GET", "/api/2.1/unity-catalog/shares")
  return(json$shares)

}

#' @rdname list_shares
#' @export 
sharesList <- list_shares
#' Get permissions.
#' 
#' Gets the permissions for a data share from the metastore. The caller must be
#' a metastore admin or the owner of the share.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the share.
#'
#'
#' @rdname share_permissions
#' @alias sharesSharePermissions
#' @export
share_permissions <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/shares/", name, "/permissions",
    , sep = ""))
}

#' @rdname share_permissions
#' @export 
sharesSharePermissions <- share_permissions
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
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param name Required. The name of the share.
#' @param new_name New name for the share.
#' @param owner Username of current owner of share.
#' @param updates Array of shared data object updates.
#'
#'
#' @rdname update_share
#' @alias sharesUpdate
#' @export
update_share <- function(client, name, comment = NULL, new_name = NULL, owner = NULL,
  updates = NULL) {
  body <- list(comment = comment, new_name = new_name, owner = owner, updates = updates)
  client$do("PATCH", paste("/api/2.1/unity-catalog/shares/", name, sep = ""), body = body)
}

#' @rdname update_share
#' @export 
sharesUpdate <- update_share
#' Update permissions.
#' 
#' Updates the permissions for a data share in the metastore. The caller must be
#' a metastore admin or an owner of the share.
#' 
#' For new recipient grants, the user must also be the owner of the recipients.
#' recipient revocations do not require additional privileges.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param changes Array of permission changes.
#' @param name Required. The name of the share.
#'
#'
#' @rdname update_share_permissions
#' @alias sharesUpdatePermissions
#' @export
update_share_permissions <- function(client, name, changes = NULL) {
  body <- list(changes = changes)
  client$do("PATCH", paste("/api/2.1/unity-catalog/shares/", name, "/permissions",
    , sep = ""), body = body)
}

#' @rdname update_share_permissions
#' @export 
sharesUpdatePermissions <- update_share_permissions







