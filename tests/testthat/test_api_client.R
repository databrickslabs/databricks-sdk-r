
test_that("we capture user agent properly", {
  expect_equal(databricks:::.productInfo, c("unknown", "0.0.0"))
})

test_that("loads configuration file", {
  expect_true(
    databricks:::.DatabricksClient(config_file = "./data/azurecfg")$is_azure())
  expect_true(
    databricks:::.DatabricksClient(config_file = "./data/awscfg")$is_aws())
  expect_true(
    databricks:::.DatabricksClient(config_file = "./data/gcpcfg")$is_gcp())
})

test_that("parses configuration profile", {
  client <- databricks:::.DatabricksClient(config_file = "./data/awscfg", profile="client-secret")
  expected <- "host=https://another.cloud.databricks.com/, client_id=xxx, client_secret=***"
  expect_equal(expected, client$debug_string())
})

test_that("always fails", {
		databricks::configure(host="https://demo", token="foo")
		expect_error({
			databricks::clusters$list()
		})
})
