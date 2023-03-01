# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' Create VPC endpoint configuration.
#' 
#' Creates a VPC endpoint configuration, which represents a [VPC endpoint]
#' object in AWS used to communicate privately with Databricks over [AWS
#' PrivateLink].
#' 
#' **Important**: When you register a VPC endpoint to the Databricks workspace
#' VPC endpoint service for any workspace, **in this release Databricks enables
#' front-end (web application and REST API) access from the source network of
#' the VPC endpoint to all workspaces in that AWS region in your Databricks
#' account if the workspaces have any PrivateLink connections in their workspace
#' configuration**. If you have questions about this behavior, contact your
#' Databricks representative.
#' 
#' Within AWS, your VPC endpoint stays in `pendingAcceptance` state until you
#' register it in a VPC endpoint configuration through the Account API. After
#' you register the VPC endpoint configuration, the Databricks [endpoint
#' service] automatically accepts the VPC endpoint and it eventually transitions
#' to the `available` state.
#' 
#' Before configuring PrivateLink, read the [Databricks article about
#' PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [AWS PrivateLink]: https://aws.amazon.com/privatelink
#' [Databricks article about PrivateLink]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html
#' [VPC endpoint]: https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints.html
#' [endpoint service]: https://docs.aws.amazon.com/vpc/latest/privatelink/privatelink-share-your-services.html
#'
#' @param aws_vpc_endpoint_id The ID of the VPC endpoint object in AWS.
#' @param region The AWS region in which this VPC endpoint object exists.
#' @param vpc_endpoint_name The human-readable name of the storage configuration.
databricks_vpc_endpoints_create <- function(vpc_endpoint_name, aws_vpc_endpoint_id, region, ...) {
    body <- list(
        aws_vpc_endpoint_id = aws_vpc_endpoint_id, 
        region = region, 
        vpc_endpoint_name = vpc_endpoint_name, ...)
    .api$do("POST", paste("/api/2.0/accounts/", .api$account_id, "/vpc-endpoints", , sep = ""), body = body)
}

#' Delete VPC endpoint configuration.
#' 
#' Deletes a VPC endpoint configuration, which represents an [AWS VPC endpoint]
#' that can communicate privately with Databricks over [AWS PrivateLink].
#' 
#' Upon deleting a VPC endpoint configuration, the VPC endpoint in AWS changes
#' its state from `accepted` to `rejected`, which means that it is no longer
#' usable from your VPC.
#' 
#' Before configuring PrivateLink, read the [Databricks article about
#' PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [AWS PrivateLink]: https://aws.amazon.com/privatelink
#' [AWS VPC endpoint]: https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html
#' [Databricks article about PrivateLink]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html
#'
#' @param vpc_endpoint_id Databricks VPC endpoint ID.
databricks_vpc_endpoints_delete <- function(vpc_endpoint_id, ...) {
    
    .api$do("DELETE", paste("/api/2.0/accounts/", .api$account_id, "/vpc-endpoints/", vpc_endpoint_id, sep = ""))
}

#' Get a VPC endpoint configuration.
#' 
#' Gets a VPC endpoint configuration, which represents a [VPC endpoint] object
#' in AWS used to communicate privately with Databricks over [AWS PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [AWS PrivateLink]: https://aws.amazon.com/privatelink
#' [VPC endpoint]: https://docs.aws.amazon.com/vpc/latest/privatelink/concepts.html
#'
#' @param vpc_endpoint_id Databricks VPC endpoint ID.
databricks_vpc_endpoints_get <- function(vpc_endpoint_id, ...) {
    
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/vpc-endpoints/", vpc_endpoint_id, sep = ""))
}

#' Get all VPC endpoint configurations.
#' 
#' Gets a list of all VPC endpoints for an account, specified by ID.
#' 
#' Before configuring PrivateLink, read the [Databricks article about
#' PrivateLink].
#' 
#' This operation is available only if your account is on the E2 version of the
#' platform and your Databricks account is enabled for PrivateLink (Public
#' Preview). Contact your Databricks representative to enable your account for
#' PrivateLink.
#' 
#' [Databricks article about PrivateLink]: https://docs.databricks.com/administration-guide/cloud-configurations/aws/privatelink.html
databricks_vpc_endpoints_list <- function(...) {
    .api$do("GET", paste("/api/2.0/accounts/", .api$account_id, "/vpc-endpoints", , sep = ""))
}

