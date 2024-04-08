library(testthat)

skip_if(Sys.getenv("DATABRICKS_HOST") == "", "Not integration test")

test_that("detects current user", {
  client <- databricks::DatabricksClient()
  user <- databricks::me(client)
  expect_false(is.null(user$userName))
})