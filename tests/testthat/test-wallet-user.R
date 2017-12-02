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

with_mock_API({
  test_that("we can get a specified user", {
    user <- get_user("200")
    data <- user$content$data

    expect_is(user, "coinbase_api")
    expect_identical(data$id, "200")
    expect_identical(data$name, "fakeuser")
    expect_identical(data$country, list(code = "US", name = "United States of America"))
  })
})

with_mock_API({
  test_that("we can get the current user auth data", {
    user <- get_auth_info()
    data <- user$content$data

    expect_is(user, "coinbase_api")
    expect_identical(data$method, "api_key")
    expect_identical(data$scopes, list("wallet:accounts:fake1","wallet:accounts:fake2"))
  })
})

with_mock_API({
  test_that("we can update the current user", {
    user <- update_current_user(list(name = "alice"))
    data <- user$content$data

    expect_is(user, "coinbase_api")
    expect_identical(data$id, "100")
    expect_identical(data$name, "alice")
    expect_identical(data$country, list(code = "US", name = "United States of America"))
  })
})

