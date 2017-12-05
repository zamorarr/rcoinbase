context("wallet-addresses")

with_mock_API({
  test_that("we can get addresses for a specific account id", {
    addrs <- get_addresses("fakeAcct2")
    data <- addrs$content$data
    pagination <- addrs$content$pagination

    expect_is(addrs, "coinbase_api")
    expect_identical(data[[1]]$id, "fakeAddr1")
    expect_identical(data[[1]]$address, "123456")
    expect_identical(data[[1]]$name, "New receive address")
    expect_identical(data[[2]]$id, "fakeAddr2")
    expect_identical(data[[2]]$address, "123457")
    expect_identical(data[[2]]$name, "Old receive address")
    expect_identical(pagination$limit, 25L)
  })
})

with_mock_API({
  test_that("we can get a specific address for a specific account id", {
    addr <- get_address("fakeAcct2", "fakeAddr1")
    data <- addr$content$data

    expect_is(addr, "coinbase_api")
    expect_identical(data$id, "fakeAddr1")
    expect_identical(data$address, "123456")
    expect_identical(data$name, "New receive address")
  })
})
