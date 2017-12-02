context("api")

with_mock_API({
  test_that("api request includes headers", {
    resp <- coinbase_api("fake-endpoint")
    actual <- names(resp$response$request$headers)
    expected <- c("CB-ACCESS-TIMESTAMP", "CB-ACCESS-KEY", "CB-ACCESS-SIGN",
                 "CB-VERSION", "Content-Type", "Accept", "User-Agent")

    expect_true(all(expected %in% actual))
  })
})

without_internet({
  test_that("api requests use correct verbs", {
    expect_GET(coinbase_get("fakeendpoint"))
    expect_POST(coinbase_post("fakeendpoint"))
    expect_PUT(coinbase_put("fakeendpoint"))
    expect_DELETE(coinbase_delete("fakeendpoint"))
  })
})
