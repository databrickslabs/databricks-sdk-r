# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' View available policy families. A policy family contains a policy definition
#' providing best practices for configuring clusters for a particular use case.
#' 
#' Databricks manages and provides policy families for several common cluster
#' use cases. You cannot create, edit, or delete policy families.
#' 
#' Policy families cannot be used directly to create clusters. Instead, you
#' create cluster policies using a policy family. Cluster policies created using
#' a policy family inherit the policy family's policy definition.
#' 
#' @section Operations:
#' \tabular{ll}{
#'  \link[=policy_families_get]{get} \tab \cr
#'  \link[=policy_families_list]{list} \tab \cr
#' }
#'
#' @rdname policy_families
#' @export
policy_families <- list()


#'
#' @param policy_family_id [required] 
#'
#' @keywords internal
#'
#' @rdname policy_families_get
#'
#' @aliases policy_families_get
policy_families_get <- function(policy_family_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/policy-families/", policy_family_id, sep = ""))
}
policy_families$get <- policy_families_get


#'
#' @param max_results The max number of policy families to return.
#' @param page_token A token that can be used to get the next page of results.
#' 
#' @return `data.frame` with all of the response pages.
#'
#' @keywords internal
#'
#' @rdname policy_families_list
#'
#' @aliases policy_families_list
policy_families_list <- function(max_results = NULL, 
    page_token = NULL, 
    ...) {
    query <- list(
        max_results = max_results, 
        page_token = page_token, ...)
    
    
    
    results <- data.frame()
    while (TRUE) {
        json <- .api$do("GET", "/api/2.0/policy-families", query = query)
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
    return (results)
    
}
policy_families$list <- policy_families_list













