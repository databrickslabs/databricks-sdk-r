# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create a clean room.
#' 
#' Creates a new clean room with specified colaborators. The caller must be a
#' metastore admin or have the **CREATE_CLEAN_ROOM** privilege on the metastore.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param name Required. Name of the clean room.
#' @param remote_detailed_info Required. Central clean room details.
#'
#' @rdname cleanRoomsCreate
cleanRoomsCreate <- function(client, name, remote_detailed_info, comment = NULL) {
  body <- list(comment = comment, name = name, remote_detailed_info = remote_detailed_info)
  client$do("POST", "/api/2.1/unity-catalog/clean-rooms", body = body)
}

#' Delete a clean room.
#' 
#' Deletes a data object clean room from the metastore. The caller must be an
#' owner of the clean room.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name_arg Required. The name of the clean room.
#'
#' @rdname cleanRoomsDelete
cleanRoomsDelete <- function(client, name_arg) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/clean-rooms/", name_arg, sep = ""))
}

#' Get a clean room.
#' 
#' Gets a data object clean room from the metastore. The caller must be a
#' metastore admin or the owner of the clean room.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param include_remote_details Whether to include remote details (central) on the clean room.
#' @param name_arg Required. The name of the clean room.
#'
#' @rdname cleanRoomsGet
cleanRoomsGet <- function(client, name_arg, include_remote_details = NULL) {
  query <- list(include_remote_details = include_remote_details)
  client$do("GET", paste("/api/2.1/unity-catalog/clean-rooms/", name_arg, sep = ""),
    query = query)
}

#' List clean rooms.
#' 
#' Gets an array of data object clean rooms from the metastore. The caller must
#' be a metastore admin or the owner of the clean room. There is no guarantee of
#' a specific ordering of the elements in the array.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname cleanRoomsList
cleanRoomsList <- function(client) {

  json <- client$do("GET", "/api/2.1/unity-catalog/clean-rooms")
  return(json$clean_rooms)

}

#' Update a clean room.
#' 
#' Updates the clean room with the changes and data objects in the request. The
#' caller must be the owner of the clean room or a metastore admin.
#' 
#' When the caller is a metastore admin, only the __owner__ field can be
#' updated.
#' 
#' In the case that the clean room name is changed **updateCleanRoom** requires
#' that the caller is both the clean room owner and a metastore admin.
#' 
#' For each table that is added through this method, the clean room owner must
#' also have **SELECT** privilege on the table. The privilege must be maintained
#' indefinitely for recipients to be able to access the table. Typically, you
#' should use a group as the clean room owner.
#' 
#' Table removals through **update** do not require additional privileges.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param catalog_updates Array of shared data object updates.
#' @param comment User-provided free-form text description.
#' @param name Name of the clean room.
#' @param name_arg Required. The name of the clean room.
#' @param owner Username of current owner of clean room.
#'
#' @rdname cleanRoomsUpdate
cleanRoomsUpdate <- function(client, name_arg, catalog_updates = NULL, comment = NULL,
  name = NULL, owner = NULL) {
  body <- list(catalog_updates = catalog_updates, comment = comment, name = name,
    owner = owner)
  client$do("PATCH", paste("/api/2.1/unity-catalog/clean-rooms/", name_arg, sep = ""),
    body = body)
}

