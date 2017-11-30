#' List buys
#'
#' Lists buys for an account.
#'
#' @param account_id Account Id
#' @export
#' @family wallet-buys
#' @references \url{https://developers.coinbase.com/api/v2#list-buys}
get_buys <- function(account_id) {
  endpoint <- paste("accounts", account_id, "buys", sep = "/")
  coinbase_get(endpoint)
}

#' Show a buy
#'
#' Show an individual buy.
#'
#' @param account_id Account Id
#' @param buy_id Buy Id
#' @export
#' @family wallet-buys
#' @references \url{https://developers.coinbase.com/api/v2#show-a-buy}
get_buy <- function(account_id, buy_id) {
  endpoint <- paste("accounts", account_id, "buys", buy_id, sep = "/")
  coinbase_get(endpoint)
}



