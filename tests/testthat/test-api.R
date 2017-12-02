context("api")

with_mock_API({
  test_that("api request includes correct headers", {
    resp <- coinbase_api("fake-endpoint")
    actual <- resp$response$request$headers
    expected_names <- c(
      "CB-ACCESS-TIMESTAMP", "CB-ACCESS-KEY", "CB-ACCESS-SIGN", "CB-VERSION",
      "Content-Type", "Accept", "User-Agent")

    expect_true(all(expected_names %in% names(actual)))
    expect_identical(actual[["Content-Type"]], "application/json")
    expect_identical(actual[["Accept"]], "application/json")
    expect_identical(actual[["User-Agent"]], "github.com/zamorarr/rcoinbase")
  })
})

without_internet({
  test_that("api requests use correct verbs", {
    expect_GET(coinbase_get("fake-endpoint"))
    expect_POST(coinbase_post("fake-endpoint"))
    expect_PUT(coinbase_put("fake-endpoint"))
    expect_DELETE(coinbase_delete("fake-endpoint"))
  })
})
