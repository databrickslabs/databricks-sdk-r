# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an index.
#' 
#' Create a new index.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param delta_sync_index_spec Specification for Delta Sync Index.
#' @param direct_access_index_spec Specification for Direct Vector Access Index.
#' @param endpoint_name Required. Name of the endpoint to be used for serving the index.
#' @param index_type Required. There are 2 types of Vector Search indexes: - `DELTA_SYNC`: An index that automatically syncs with a source Delta Table, automatically and incrementally updating the index as the underlying data in the Delta Table changes.
#' @param name Required. Name of the index.
#' @param primary_key Required. Primary key of the index.
#'
#'
#' @rdname create_vector_search_index
#' @alias vectorSearchIndexesCreateIndex
#' @export
create_vector_search_index <- function(client, name, endpoint_name, primary_key,
  index_type, delta_sync_index_spec = NULL, direct_access_index_spec = NULL) {
  body <- list(delta_sync_index_spec = delta_sync_index_spec, direct_access_index_spec = direct_access_index_spec,
    endpoint_name = endpoint_name, index_type = index_type, name = name, primary_key = primary_key)
  client$do("POST", "/api/2.0/vector-search/indexes", body = body)
}

#' @rdname create_vector_search_index
#' @export 
vectorSearchIndexesCreateIndex <- create_vector_search_index
#' Delete data from index.
#' 
#' Handles the deletion of data from a specified vector index.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param index_name Required. Name of the vector index where data is to be deleted.
#' @param primary_keys Required. List of primary keys for the data to be deleted.
#'
#'
#' @rdname delete_vector_search_index_data
#' @alias vectorSearchIndexesDeleteDataVectorIndex
#' @export
delete_vector_search_index_data <- function(client, index_name, primary_keys) {
  body <- list(primary_keys = primary_keys)
  client$do("POST", paste("/api/2.0/vector-search/indexes/", index_name, "/delete-data",
    , sep = ""), body = body)
}

#' @rdname delete_vector_search_index_data
#' @export 
vectorSearchIndexesDeleteDataVectorIndex <- delete_vector_search_index_data
#' Delete an index.
#' 
#' Delete an index.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param index_name Required. Name of the index.
#'
#'
#' @rdname delete_vector_search_index
#' @alias vectorSearchIndexesDeleteIndex
#' @export
delete_vector_search_index <- function(client, index_name) {

  client$do("DELETE", paste("/api/2.0/vector-search/indexes/", index_name, sep = ""))
}

#' @rdname delete_vector_search_index
#' @export 
vectorSearchIndexesDeleteIndex <- delete_vector_search_index
#' Get an index.
#' 
#' Get an index.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param index_name Required. Name of the index.
#'
#'
#' @rdname get_vector_search_index
#' @alias vectorSearchIndexesGetIndex
#' @export
get_vector_search_index <- function(client, index_name) {

  client$do("GET", paste("/api/2.0/vector-search/indexes/", index_name, sep = ""))
}

#' @rdname get_vector_search_index
#' @export 
vectorSearchIndexesGetIndex <- get_vector_search_index
#' List indexes.
#' 
#' List all indexes in the given endpoint.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param endpoint_name Required. Name of the endpoint.
#' @param page_token Token for pagination.
#'
#' @return `data.frame` with all of the response pages.
#'
#'
#' @rdname list_vector_search_index_indexes
#' @alias vectorSearchIndexesListIndexes
#' @export
list_vector_search_index_indexes <- function(client, endpoint_name, page_token = NULL) {
  query <- list(endpoint_name = endpoint_name, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/vector-search/indexes", query = query)
    if (is.null(nrow(json$vector_indexes))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$vector_indexes)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_vector_search_index_indexes
#' @export 
vectorSearchIndexesListIndexes <- list_vector_search_index_indexes
#' Query an index.
#' 
#' Query the specified vector index.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param columns Required. List of column names to include in the response.
#' @param filters_json JSON string representing query filters.
#' @param index_name Required. Name of the vector index to query.
#' @param num_results Number of results to return.
#' @param query_text Query text.
#' @param query_vector Query vector.
#' @param score_threshold Threshold for the approximate nearest neighbor search.
#'
#'
#' @rdname query_vector_search_index
#' @alias vectorSearchIndexesQueryIndex
#' @export
query_vector_search_index <- function(client, index_name, columns, filters_json = NULL,
  num_results = NULL, query_text = NULL, query_vector = NULL, score_threshold = NULL) {
  body <- list(columns = columns, filters_json = filters_json, num_results = num_results,
    query_text = query_text, query_vector = query_vector, score_threshold = score_threshold)
  client$do("POST", paste("/api/2.0/vector-search/indexes/", index_name, "/query",
    , sep = ""), body = body)
}

#' @rdname query_vector_search_index
#' @export 
vectorSearchIndexesQueryIndex <- query_vector_search_index
#' Synchronize an index.
#' 
#' Triggers a synchronization process for a specified vector index.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param index_name Required. Name of the vector index to synchronize.
#'
#'
#' @rdname sync_vector_search_index
#' @alias vectorSearchIndexesSyncIndex
#' @export
sync_vector_search_index <- function(client, index_name) {

  client$do("POST", paste("/api/2.0/vector-search/indexes/", index_name, "/sync",
    , sep = ""))
}

#' @rdname sync_vector_search_index
#' @export 
vectorSearchIndexesSyncIndex <- sync_vector_search_index
#' Upsert data into an index.
#' 
#' Handles the upserting of data into a specified vector index.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param index_name Required. Name of the vector index where data is to be upserted.
#' @param inputs_json Required. JSON string representing the data to be upserted.
#'
#'
#' @rdname upsert_vector_search_index_data
#' @alias vectorSearchIndexesUpsertDataVectorIndex
#' @export
upsert_vector_search_index_data <- function(client, index_name, inputs_json) {
  body <- list(inputs_json = inputs_json)
  client$do("POST", paste("/api/2.0/vector-search/indexes/", index_name, "/upsert-data",
    , sep = ""), body = body)
}

#' @rdname upsert_vector_search_index_data
#' @export 
vectorSearchIndexesUpsertDataVectorIndex <- upsert_vector_search_index_data








