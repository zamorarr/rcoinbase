context("wallet-transactions")

with_mock_API({
  test_that("we can get transactions for a specific account id", {
    trans <- get_transactions("fakeAcct2")
    data <- trans$content$data
    pagination <- trans$content$pagination

    expect_is(trans, "coinbase_api")
    expect_identical(data[[1]]$id, "fakeTrans1")
    expect_identical(data[[1]]$amount, list(amount = "0.03", currency = "BTC"))
    expect_identical(data[[1]]$type, "buy")
    expect_identical(data[[2]]$id, "fakeTrans2")
    expect_identical(data[[2]]$amount, list(amount = "0.01", currency = "BTC"))
    expect_identical(data[[2]]$type, "buy")
    expect_identical(pagination$limit, 25L)
  })
})

with_mock_API({
  test_that("we can get a specific transaction for a specific account id", {
    trans <- get_transaction("fakeAcct2", "fakeTrans1")
    data <- trans$content$data

    expect_is(trans, "coinbase_api")
    expect_identical(data$id, "fakeTrans1")
    expect_identical(data$amount, list(amount = "0.03", currency = "BTC"))
    expect_identical(data$type, "buy")
    expect_identical(data$instant_exchange, FALSE)
  })
})
