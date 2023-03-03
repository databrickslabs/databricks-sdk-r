# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.


#'
#' @param policy_family_id 
databricks_policy_families_get <- function(policy_family_id, ...) {
    
    
    .api$do("GET", paste("/api/2.0/policy-families/", policy_family_id, sep = ""))
}


#'
#' @param max_results The max number of policy families to return.
#' @param page_token A token that can be used to get the next page of results.
databricks_policy_families_list <- function(max_results = NULL, 
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











