context("wallet-user")

with_mock_API({
  test_that("we can get the current user", {
    user <- get_current_user()
    data <- user$content$data
    expect_is(user, "coinbase_api")
    expect_identical(data$id, "100")
    expect_identical(data$name, "fakeuser")
    expect_identical(data$country, list(code = "US", name = "United States of America"))
  })
})

