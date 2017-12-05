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
#' @family wallet-addresses
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
#' @family wallet-addresses
#' @references \url{https://developers.coinbase.com/api/v2#list-address39s-transactions}
get_address_transactions <- function(account_id, address_id) {
  endpoint <- paste("accounts", account_id, "addresses", address_id, "transactions", sep = "/")
  coinbase_get(endpoint)
}

#' Create address
#'
#' Creates a new address for an account. As all the arguments are optional, it’s
#' possible just to do a empty POST which will create a new address. This is
#' handy if you need to create new receive addresses for an account on-demand.
#' Addresses can be created for all account types. With fiat accounts, funds
#' will be received with Instant Exchange.
#'
#' @param account_id Account Id
#' @keywords internal
#' @family wallet-addresses
#' @references \url{https://developers.coinbase.com/api/v2#create-address}
#' @examples
#' \dontrun{
#' addr <- create_address("fakeAcct2", body = list(name = "New receive address"))
#' }
create_address <- function(account_id, body = "") {
  endpoint <- paste("accounts", account_id, "addresses", sep = "/")
  coinbase_post(endpoint, body = body)
}
