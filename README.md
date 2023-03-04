Try:

## Unified Client Authentication

Example of overriding authentication profile. Look at `bricks auth profiles` to know which ones are working.
```
databricks::configure(profile="your-cli-profile")
```

## All APIs

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