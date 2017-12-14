context("wallet-buys")

with_mock_API({
  test_that("we can get buys for a specific account id", {
    buys <- get_buys("fakeAcct2")
    data <- buys$content$data
    pagination <- buys$content$pagination

    expect_is(buys, "coinbase_api")
    expect_identical(data[[1]]$id, "fakeBuy1")
    expect_identical(data[[1]]$amount, list(amount = "0.05", currency = "BTC"))
    expect_identical(data[[1]]$resource, "buy")
    expect_identical(data[[2]]$id, "fakeBuy2")
    expect_identical(data[[2]]$amount, list(amount = "0.01", currency = "BTC"))
    expect_identical(data[[2]]$resource, "buy")
    expect_identical(pagination$limit, 25L)
  })
})

with_mock_API({
  test_that("we can get a specific buy for a specific account id", {
    buy <- get_buy("fakeAcct2", "fakeBuy1")
    data <- buy$content$data

    expect_is(buy, "coinbase_api")
    expect_identical(data$id, "fakeBuy1")
    expect_identical(data$amount, list(amount = "0.05", currency = "BTC"))
    expect_identical(data$resource, "buy")
    expect_identical(data$instant, FALSE)
  })
})
