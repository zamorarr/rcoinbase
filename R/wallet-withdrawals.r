#' List withdrawals
#'
#' Lists withdrawals for an account.
#'
#' @param account_id Account Id
#' @export
#' @family wallet-withdrawals
#' @references \url{https://developers.coinbase.com/api/v2#list-withdrawals}
get_withdrawals <- function(account_id) {
  endpoint <- paste("accounts", account_id, "withdrawals", sep = "/")
  coinbase_get(endpoint)
}

#' Show a withdrawal
#'
#' Show an individual withdrawal.
#'
#' @param account_id Account Id
#' @param withdrawal_id Withdrawal Id
#' @export
#' @family wallet-withdrawals
#' @references \url{https://developers.coinbase.com/api/v2#show-a-withdrawal}
get_withdrawal <- function(account_id, withdrawal_id) {
  endpoint <- paste("accounts", account_id, "withdrawals", withdrawal_id, sep = "/")
  coinbase_get(endpoint)
}



