#' List sells
#'
#' Lists sells for an account.
#'
#' @param account_id Account Id
#' @export
#' @family wallet-sells
#' @references \url{https://developers.coinbase.com/api/v2#list-sells}
get_sells <- function(account_id) {
  endpoint <- paste("accounts", account_id, "sells", sep = "/")
  coinbase_get(endpoint)
}

#' Show a sell
#'
#' Show an individual sell.
#'
#' @param account_id Account Id
#' @param sell_id Sell Id
#' @export
#' @family wallet-sells
#' @references \url{https://developers.coinbase.com/api/v2#show-a-sell}
get_sell <- function(account_id, sell_id) {
  endpoint <- paste("accounts", account_id, "sells", sell_id, sep = "/")
  coinbase_get(endpoint)
}



