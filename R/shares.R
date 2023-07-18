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
#' @rdname sharesCreate
sharesCreate <- function(client, name, comment = NULL) {
  body <- list(comment = comment, name = name)
  client$do("POST", "/api/2.1/unity-catalog/shares", body = body)
}

#' Delete a share.
#' 
#' Deletes a data object share from the metastore. The caller must be an owner
#' of the share.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the share.
#'
#' @rdname sharesDelete
sharesDelete <- function(client, name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/shares/", name, sep = ""))
}

#' Get a share.
#' 
#' Gets a data object share from the metastore. The caller must be a metastore
#' admin or the owner of the share.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_shared_data Query for data to include in the share.
#' @param name Required. The name of the share.
#'
#' @rdname sharesGet
sharesGet <- function(client, name, include_shared_data = NULL) {
  query <- list(include_shared_data = include_shared_data)
  client$do("GET", paste("/api/2.1/unity-catalog/shares/", name, sep = ""), query = query)
}

#' List shares.
#' 
#' Gets an array of data object shares from the metastore. The caller must be a
#' metastore admin or the owner of the share. There is no guarantee of a
#' specific ordering of the elements in the array.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname sharesList
sharesList <- function(client) {

  json <- client$do("GET", "/api/2.1/unity-catalog/shares")
  return(json$shares)

}

#' Get permissions.
#' 
#' Gets the permissions for a data share from the metastore. The caller must be
#' a metastore admin or the owner of the share.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. The name of the share.
#'
#' @rdname sharesSharePermissions
sharesSharePermissions <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/shares/", name, "/permissions",
    , sep = ""))
}

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
#' @param name Name of the share.
#' @param owner Username of current owner of share.
#' @param updates Array of shared data object updates.
#'
#' @rdname sharesUpdate
sharesUpdate <- function(client, name, comment = NULL, owner = NULL, updates = NULL) {
  body <- list(comment = comment, name = name, owner = owner, updates = updates)
  client$do("PATCH", paste("/api/2.1/unity-catalog/shares/", name, sep = ""), body = body)
}

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
#' @rdname sharesUpdatePermissions
sharesUpdatePermissions <- function(client, name, changes = NULL) {
  body <- list(changes = changes)
  client$do("PATCH", paste("/api/2.1/unity-catalog/shares/", name, "/permissions",
    , sep = ""), body = body)
}

