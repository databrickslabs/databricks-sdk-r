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
#' @export
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
#' @param name Required. The name of the clean room.
#'
#' @rdname cleanRoomsDelete
#' @export
cleanRoomsDelete <- function(client, name) {

  client$do("DELETE", paste("/api/2.1/unity-catalog/clean-rooms/", name, sep = ""))
}

#' Get a clean room.
#' 
#' Gets a data object clean room from the metastore. The caller must be a
#' metastore admin or the owner of the clean room.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param include_remote_details Whether to include remote details (central) on the clean room.
#' @param name Required. The name of the clean room.
#'
#' @rdname cleanRoomsGet
#' @export
cleanRoomsGet <- function(client, name, include_remote_details = NULL) {
  query <- list(include_remote_details = include_remote_details)
  client$do("GET", paste("/api/2.1/unity-catalog/clean-rooms/", name, sep = ""),
    query = query)
}

#' List clean rooms.
#' 
#' Gets an array of data object clean rooms from the metastore. The caller must
#' be a metastore admin or the owner of the clean room. There is no guarantee of
#' a specific ordering of the elements in the array.
#' @param client Required. Instance of DatabricksClient()

#'
#' @param max_results Maximum number of clean rooms to return.
#' @param page_token Opaque pagination token to go to next page based on previous query.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname cleanRoomsList
#' @export
cleanRoomsList <- function(client, max_results = NULL, page_token = NULL) {
  query <- list(max_results = max_results, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.1/unity-catalog/clean-rooms", query = query)
    if (is.null(nrow(json$clean_rooms))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$clean_rooms)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

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
#' @param name Required. The name of the clean room.
#' @param owner Username of current owner of clean room.
#'
#' @rdname cleanRoomsUpdate
#' @export
cleanRoomsUpdate <- function(client, name, catalog_updates = NULL, comment = NULL,
  owner = NULL) {
  body <- list(catalog_updates = catalog_updates, comment = comment, owner = owner)
  client$do("PATCH", paste("/api/2.1/unity-catalog/clean-rooms/", name, sep = ""),
    body = body)
}

