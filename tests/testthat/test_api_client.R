test_that("always fails", {
		databricks::configure(host="https://demo", token="foo")
		expect_error({
			databricks::clusters$list()
		})
})