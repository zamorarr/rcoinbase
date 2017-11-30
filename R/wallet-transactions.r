#' List transactions
#'
#' Lists account's transactions.
#'
#' @param account_id Account Id
#' @export
#' @family wallet-transactions
#' @references \url{https://developers.coinbase.com/api/v2#list-transactions}
get_transactions <- function(account_id) {
  endpoint <- paste("accounts", account_id, "transactions", sep = "/")
  coinbase_get(endpoint)
}

#' Show a transaction
#'
#' Show an individual transaction for an account.
#'
#' @param account_id Account Id
#' @param transaction_id Transaction Id
#' @export
#' @family wallet-transactions
#' @references \url{https://developers.coinbase.com/api/v2#show-a-transaction}
get_transaction <- function(account_id, transaction_id) {
  endpoint <- paste("accounts", account_id, "transactions", transaction_id, sep = "/")
  coinbase_get(endpoint)
}



