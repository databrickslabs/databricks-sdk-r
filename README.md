# Databricks SDK for R (Experimental)

## Authentication

It's recommended that you authenticate via the `.Renviron` file using `DATABRICKS_HOST` and `DATABRICKS_TOKEN` environment variables. You can also use [Databricks CLI Configuration Profiles](https://docs.databricks.com/dev-tools/auth.html#databricks-configuration-profiles) and `DATABRICKS_CONFIG_FILE` or `DATABRICKS_CONFIG_PROFILE` environment variables, but only the [PAT Authentication](https://docs.databricks.com/dev-tools/auth.html#databricks-personal-access-token-authentication) works at the moment. If you need more authentication methods, please fork this GitHub repository and send pull request with the feature suggestion.

Example of overriding authentication profile. Look at `databricks auth profiles` to know which ones are working.
```
databricks::configure(profile="your-cli-profile")
```

## Complete with Databricks workspace-level APIs

Databricks SDK for R comes with all public [workspace-level APIs](https://docs.databricks.com/api/workspace/introduction) and is consistent with [Databricks SDK for Python](https://github.com/databricks/databricks-sdk-py), [Databricks SDK for Go](https://github.com/databricks/databricks-sdk-go), and [Databricks SDK for Java](https://github.com/databricks/databricks-sdk-java). Databricks SDK for R does not expose [account-level APIs](https://docs.databricks.com/api/account/introduction) and you're recommended to use Go, Python, or Java SDK to build an account-level automation.

```r
library(dplyr)
running <- databricks::clusters$list() %>% filter(state == 'RUNNING')
context <- databricks::command_execution$create(cluster_id=running$cluster_id, language='python')
res <- databricks::command_execution$execute(cluster_id=running$cluster_id, context_id=context$id, language='sql', command='show tables')
res
```

## Pagination

All `list` methods (and those, which return any list of results), do consistently return a `data.frame` of all entries from all pages, regardless of the underlying implementation.

```r
> databricks::clusters$list()[1:10,c("cluster_id", "cluster_name", "state")]
             cluster_id                                      cluster_name      state
1  1109-110110-kjfoeopq                              DEFAULT Test Cluster TERMINATED
2  0110-221212-oqqpodoa                               GO_SDK Test Cluster TERMINATED
3  1109-012301-qlwlwqpq                               BRICKS Test Cluster TERMINATED
4  1109-110012-qpwoepqq                               VSCODE Test Cluster TERMINATED
5  0110-201022-oqooqpqp                               JS_SDK Test Cluster TERMINATED
```

## Long-running operations

All long-running operations do poll Databricks backend until the entity reaches desired state:

```r
> databricks::clusters$create(spark_version = "12.x-snapshot-scala2.12", cluster_name = "r-sdk-cluster", num_workers = 1, autotermination_minutes=20, node_type_id="i3.xlarge")
PENDING: Finding instances for new nodes, acquiring more instances if necessary
```

## Interface stability

API clients for all services are generated from specification files that are synchronized from the main platform. Databricks may have minor [documented](https://github.com/databricks/databricks-sdk-go/blob/main/CHANGELOG.md) backward-incompatible changes, such as renaming the methods or some type names to bring more consistency. 

## Project Support

Please note that all projects in the `databrickslabs` github space are provided for your exploration only, and are not formally supported by Databricks with Service Level Agreements (SLAs). They are provided AS-IS and we do not make any guarantees of any kind. Please do not submit a support ticket relating to any issues arising from the use of these projects.

Any issues discovered through the use of this project should be [filed as GitHub Issues on the Repo](https://github.com/databrickslabs/databricks-sdk-r/issues). They will be reviewed as time permits, but there are no formal SLAs for support.