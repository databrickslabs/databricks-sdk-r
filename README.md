Try:

```
library(databricks)

# transparent pagination
clusters_list()[1:10,c("cluster_id", "cluster_name", "state")]

# long-running operations
clusters_create(spark_version = "12.x-snapshot-scala2.12", cluster_name = "r-sdk-cluster", num_workers = 1, autotermination_minutes=20, node_type_id=”i3.xlarge”)
```