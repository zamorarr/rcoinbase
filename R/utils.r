#' Write json pretty
#'
#' Re-write existing json file with pretty formatting
#'
#' @param path path to json file on disk
#' @keywords internal
#' @examples
#' \dontrun{
#' pretty_json("tests/testthat/api.coinbase.com/v2/accounts.json")
#' }
pretty_json <- function(path) {
  json <- jsonlite::read_json(path)
  jsonlite::write_json(json, path, pretty = TRUE, auto_unbox = TRUE)
}

#' Capture requests to tests directory
#'
#' Helper to build up mock fixtures for testing
#' @param expr R expresssion to execute
#' @examples
#' \dontrun{
#' capture_requests2(get_accounts())
#' }
capture_request2 <- function(expr) {
  httptest::capture_requests(expr, path = "tests/testthat")
}
