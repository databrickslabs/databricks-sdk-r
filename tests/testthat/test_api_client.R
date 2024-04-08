
test_that("we capture user agent properly", {
  expect_equal(databricks:::.productInfo, c("unknown", "0.0.0"))
})

test_that("loads configuration file", {
  expect_true(
    databricks:::DatabricksClient(config_file = "./data/azurecfg")$is_azure())
  expect_true(
    databricks:::DatabricksClient(config_file = "./data/awscfg")$is_aws())
  expect_true(
    databricks:::DatabricksClient(config_file = "./data/gcpcfg")$is_gcp())
})

test_that("parses configuration profile", {
  client <- databricks:::DatabricksClient(config_file = "./data/awscfg", profile="client-secret")
  expected <- "client_id=xxx, client_secret=***, host=https://another.cloud.databricks.com/"
  expect_equal(expected, client$debug_string())
})

test_that("always fails", {
    client <- databricks:::DatabricksClient(host="https://demo", token="foo")
		expect_error({
			databricks::clustersList(client)
		})
})
