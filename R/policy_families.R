# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get policy family information.
#' 
#' Retrieve the information for an policy family based on its identifier.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param policy_family_id Required. This field has no description yet.
#'
#' @rdname get_cluster_policy_family
#' @alias policyFamiliesGet
#' @export
get_cluster_policy_family <- function(client, policy_family_id) {

  client$do("GET", paste("/api/2.0/policy-families/", policy_family_id, sep = ""))
}

#' @rdname get_cluster_policy_family
#' @export 
policyFamiliesGet <- get_cluster_policy_family
#' List policy families.
#' 
#' Retrieve a list of policy families. This API is paginated.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param max_results The max number of policy families to return.
#' @param page_token A token that can be used to get the next page of results.
#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname list_cluster_policy_families
#' @alias policyFamiliesList
#' @export
list_cluster_policy_families <- function(client, max_results = NULL, page_token = NULL) {
  query <- list(max_results = max_results, page_token = page_token)

  results <- data.frame()
  while (TRUE) {
    json <- client$do("GET", "/api/2.0/policy-families", query = query)
    if (is.null(nrow(json$policy_families))) {
      break
    }
    # append this page of results to one results data.frame
    results <- dplyr::bind_rows(results, json$policy_families)
    if (is.null(json$next_page_token)) {
      break
    }
    query$page_token <- json$next_page_token
  }
  return(results)

}

#' @rdname list_cluster_policy_families
#' @export 
policyFamiliesList <- list_cluster_policy_families


