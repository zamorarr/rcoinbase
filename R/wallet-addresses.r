#' List addresses
#'
#' Lists addresses for an account.
#' @param account_id Account Id
#' @export
#' @family wallet-addresses
#' @references \url{https://developers.coinbase.com/api/v2#list-addresses}
get_addresses <- function(account_id) {
  endpoint <- paste("accounts", account_id, "addresses", sep = "/")
  coinbase_get(endpoint)
}

#' Show addresss
#'
#' Show an individual address for an account. A regular bitcoin, litecoin or
#' ethereum address can be used in place of address_id but the address has to
#' be associated to the correct account.
#'
#' @param account_id Account Id
#' @param address_id Address Id
#' @export
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#show-addresss}
get_address <- function(account_id, address_id) {
  endpoint <- paste("accounts", account_id, "addresses", address_id, sep = "/")
  coinbase_get(endpoint)
}

#' List address’s transactions
#'
#' List transactions that have been sent to a specific address.
#' A regular bitcoin, litecoin or ethereum address can be used in place of
#' address_id but the address has to be associated to the correct account.
#'
#' @param account_id Account Id
#' @param address_id Address Id
#' @export
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#list-address39s-transactions}
get_address_transactions <- function(account_id, address_id) {
  endpoint <- paste("accounts", account_id, "addresses", address_id, "transactions", sep = "/")
  coinbase_get(endpoint)
}
