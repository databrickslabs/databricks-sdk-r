# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' These APIs manage access rules on resources in an account. Currently, only
#' grant rules are supported. A grant rule specifies a role assigned to a set of
#' principals. A list of rules attached to a resource is called a rule set. A
#' workspace must belong to an account for these APIs to work.
#'
#' @section Operations:
#' \tabular{ll}{
#'  \link[=account_access_control_proxy_get_assignable_roles_for_resource]{get_assignable_roles_for_resource} \tab Get assignable roles for a resource.\cr
#'  \link[=account_access_control_proxy_get_rule_set]{get_rule_set} \tab Get a rule set.\cr
#'  \link[=account_access_control_proxy_update_rule_set]{update_rule_set} \tab Update a rule set.\cr
#' }
#'
#' @rdname account_access_control_proxy
#' @export
account_access_control_proxy <- list()

#' Get assignable roles for a resource.
#' 
#' Gets all the roles that can be granted on an account-level resource. A role
#' is grantable if the rule set on the resource can contain an access rule of
#' the role.
#'
#' @param resource Required. The resource name for which assignable roles will be listed.
#'
#' @keywords internal
#'
#' @rdname account_access_control_proxy_get_assignable_roles_for_resource
#'
#' @aliases account_access_control_proxy_get_assignable_roles_for_resource
account_access_control_proxy_get_assignable_roles_for_resource <- function(resource) {
  query <- list(resource = resource)
  .state$api$do("GET", "/api/2.0/preview/accounts/access-control/assignable-roles",
    query = query)
}
account_access_control_proxy$get_assignable_roles_for_resource <- account_access_control_proxy_get_assignable_roles_for_resource

#' Get a rule set.
#' 
#' Get a rule set by its name. A rule set is always attached to a resource and
#' contains a list of access rules on the said resource. Currently only a
#' default rule set for each resource is supported.
#'
#' @param etag Required. Etag used for versioning.
#' @param name Required. The ruleset name associated with the request.
#'
#' @keywords internal
#'
#' @rdname account_access_control_proxy_get_rule_set
#'
#' @aliases account_access_control_proxy_get_rule_set
account_access_control_proxy_get_rule_set <- function(name, etag) {
  query <- list(etag = etag, name = name)
  .state$api$do("GET", "/api/2.0/preview/accounts/access-control/rule-sets", query = query)
}
account_access_control_proxy$get_rule_set <- account_access_control_proxy_get_rule_set

#' Update a rule set.
#' 
#' Replace the rules of a rule set. First, use a GET rule set request to read
#' the current version of the rule set before modifying it. This pattern helps
#' prevent conflicts between concurrent updates.
#'
#' @param name Required. Name of the rule set.
#' @param rule_set Required. 
#'
#' @keywords internal
#'
#' @rdname account_access_control_proxy_update_rule_set
#'
#' @aliases account_access_control_proxy_update_rule_set
account_access_control_proxy_update_rule_set <- function(name, rule_set) {
  body <- list(name = name, rule_set = rule_set)
  .state$api$do("PUT", "/api/2.0/preview/accounts/access-control/rule-sets", body = body)
}
account_access_control_proxy$update_rule_set <- account_access_control_proxy_update_rule_set

