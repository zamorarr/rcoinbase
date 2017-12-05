context("wallet-accounts")

with_mock_API({
  test_that("we can get the current accounts", {
    user <- get_accounts()
    data <- user$content$data
    pagination <- user$content$pagination

    expect_is(user, "coinbase_api")
    expect_identical(data[[1]]$id, "fakeAcct1")
    expect_identical(data[[1]]$name, "USD Wallet")
    expect_identical(data[[1]]$primary, FALSE)
    expect_identical(data[[2]]$id, "fakeAcct2")
    expect_identical(data[[2]]$name, "BTC Wallet")
    expect_identical(data[[2]]$primary, TRUE)
    expect_identical(pagination$limit, 25L)
  })
})

with_mock_API({
  test_that("we can get a specific account", {
    user <- get_account("fakeAcct2")
    data <- user$content$data

    expect_is(user, "coinbase_api")
    expect_identical(data$id, "fakeAcct2")
    expect_identical(data$name, "BTC Wallet")
    expect_identical(data$primary, TRUE)
  })
})
