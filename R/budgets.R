# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create a new budget.
#' 
#' Creates a new budget in the specified account.
#'
#' @param budget Budget configuration to be created.
#' @param budget_id Budget ID.
databricks_budgets_create <- function(budget, budget_id, ...) {
    body <- list(
        budget = budget, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/budget", , sep = ""), body = body)
}

#' Delete budget.
#' 
#' Deletes the budget specified by its UUID.
#'
#' @param budget_id Budget ID.
databricks_budgets_delete <- function(budget_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/budget/", budget_id, sep = ""))
}

#' Get budget and its status.
#' 
#' Gets the budget specified by its UUID, including noncumulative status for
#' each day that the budget is configured to include.
#'
#' @param budget_id Budget ID.
databricks_budgets_get <- function(budget_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/budget/", budget_id, sep = ""))
}

#' Get all budgets.
#' 
#' Gets all budgets associated with this account, including noncumulative status
#' for each day that the budget is configured to include.
databricks_budgets_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/budget", , sep = ""))
}

#' Modify budget.
#' 
#' Modifies a budget in this account. Budget properties are completely
#' overwritten.
#'
#' @param budget Budget configuration to be created.
#' @param budget_id Budget ID.
databricks_budgets_update <- function(budget, budget_id, ...) {
    body <- list(
        budget = budget, ...)
    .api$do("PATCH", paste("/api/2.0/accounts/", .api$account_id, "/budget/", budget_id, sep = ""), body = body)
}

