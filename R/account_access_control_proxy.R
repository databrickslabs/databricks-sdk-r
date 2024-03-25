# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Get assignable roles for a resource.
#' 
#' Gets all the roles that can be granted on an account-level resource. A role
#' is grantable if the rule set on the resource can contain an access rule of
#' the role.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param resource Required. The resource name for which assignable roles will be listed.
#'
#' @rdname get_account_access_control_proxy_assignable_roles_for_resource
#' @export
get_account_access_control_proxy_assignable_roles_for_resource <- function(client,
  resource) {
  query <- list(resource = resource)
  client$do("GET", "/api/2.0/preview/accounts/access-control/assignable-roles",
    query = query)
}
#' Get a rule set.
#' 
#' Get a rule set by its name. A rule set is always attached to a resource and
#' contains a list of access rules on the said resource. Currently only a
#' default rule set for each resource is supported.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param etag Required. Etag used for versioning.
#' @param name Required. The ruleset name associated with the request.
#'
#' @rdname get_account_access_control_proxy_rule_set
#' @export
get_account_access_control_proxy_rule_set <- function(client, name, etag) {
  query <- list(etag = etag, name = name)
  client$do("GET", "/api/2.0/preview/accounts/access-control/rule-sets", query = query)
}
#' Update a rule set.
#' 
#' Replace the rules of a rule set. First, use a GET rule set request to read
#' the current version of the rule set before modifying it. This pattern helps
#' prevent conflicts between concurrent updates.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the rule set.
#' @param rule_set Required. This field has no description yet.
#'
#' @rdname update_account_access_control_proxy_rule_set
#' @export
update_account_access_control_proxy_rule_set <- function(client, name, rule_set) {
  body <- list(name = name, rule_set = rule_set)
  client$do("PUT", "/api/2.0/preview/accounts/access-control/rule-sets", body = body)
}



