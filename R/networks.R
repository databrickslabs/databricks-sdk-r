# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create network configuration.
#' 
#' Creates a Databricks network configuration that represents an VPC and its
#' resources. The VPC will be used for new Databricks clusters. This requires a
#' pre-existing VPC and subnets.
#'
#' @param gcp_network_info The Google Cloud specific information for this network (for example, the VPC ID, subnet ID, and secondary IP ranges).
#' @param network_name The human-readable name of the network configuration.
#' @param security_group_ids IDs of one to five security groups associated with this network.
#' @param subnet_ids IDs of at least two subnets associated with this network.
#' @param vpc_endpoints If specified, contains the VPC endpoints used to allow cluster communication from this VPC over [AWS PrivateLink](https://aws.amazon.com/privatelink/).
#' @param vpc_id The ID of the VPC associated with this network.
databricks_networks_create <- function(network_name, gcp_network_info = NULL, 
    security_group_ids = NULL, 
    subnet_ids = NULL, 
    vpc_endpoints = NULL, 
    vpc_id = NULL, 
    ...) {
    body <- list(
        gcp_network_info = gcp_network_info, 
        network_name = network_name, 
        security_group_ids = security_group_ids, 
        subnet_ids = subnet_ids, 
        vpc_endpoints = vpc_endpoints, 
        vpc_id = vpc_id, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/networks", , sep = ""), body = body)
}

#' Delete a network configuration.
#' 
#' Deletes a Databricks network configuration, which represents a cloud VPC and
#' its resources. You cannot delete a network that is associated with a
#' workspace.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform.
#'
#' @param network_id Databricks Account API network configuration ID.
databricks_networks_delete <- function(network_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/networks/", network_id, sep = ""))
}

#' Get a network configuration.
#' 
#' Gets a Databricks network configuration, which represents a cloud VPC and its
#' resources.
#'
#' @param network_id Databricks Account API network configuration ID.
databricks_networks_get <- function(network_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/networks/", network_id, sep = ""))
}

#' Get all network configurations.
#' 
#' Gets a list of all Databricks network configurations for an account,
#' specified by ID.
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform.
databricks_networks_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/networks", , sep = ""))
}

