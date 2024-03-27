# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get an artifact allowlist.
#' 
#' Get the artifact allowlist of a certain artifact type. The caller must be a
#' metastore admin or have the **MANAGE ALLOWLIST** privilege on the metastore.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param artifact_type Required. The artifact type of the allowlist.
#'
#' @rdname get_artifact_allowlist
#' @alias artifactAllowlistsGet
#' @export
get_artifact_allowlist <- function(client, artifact_type) {

  client$do("GET", paste("/api/2.1/unity-catalog/artifact-allowlists/", artifact_type,
    sep = ""))
}

#' @rdname get_artifact_allowlist
#' @export 
artifactAllowlistsGet <- get_artifact_allowlist
#' Set an artifact allowlist.
#' 
#' Set the artifact allowlist of a certain artifact type. The whole artifact
#' allowlist is replaced with the new allowlist. The caller must be a metastore
#' admin or have the **MANAGE ALLOWLIST** privilege on the metastore.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param artifact_matchers Required. A list of allowed artifact match patterns.
#' @param artifact_type Required. The artifact type of the allowlist.
#'
#' @rdname update_artifact_allowlist
#' @alias artifactAllowlistsUpdate
#' @export
update_artifact_allowlist <- function(client, artifact_type, artifact_matchers) {
  body <- list(artifact_matchers = artifact_matchers)
  client$do("PUT", paste("/api/2.1/unity-catalog/artifact-allowlists/", artifact_type,
    sep = ""), body = body)
}

#' @rdname update_artifact_allowlist
#' @export 
artifactAllowlistsUpdate <- update_artifact_allowlist


