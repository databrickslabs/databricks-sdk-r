
test_that("we capture user agent properly", {
  expect_equal(databricks:::.productInfo, R.Version()$version.string)
})

test_that("loads configuration file", {
  expect_true(
    databricks:::.DatabricksClient(config_file = "./data/azurecfg")$is_azure())
  expect_true(
    databricks:::.DatabricksClient(config_file = "./data/awscfg")$is_aws())
  expect_true(
    databricks:::.DatabricksClient(config_file = "./data/gcpcfg")$is_gcp())
})

test_that("always fails", {
		databricks::configure(host="https://demo", token="foo")
		expect_error({
			databricks::clusters$list()
		})
})
