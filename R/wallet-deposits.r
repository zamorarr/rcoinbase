#' List deposits
#'
#' Lists deposits for an account.
#'
#' @param account_id Account Id
#' @export
#' @family wallet-deposits
#' @references \url{https://developers.coinbase.com/api/v2#list-deposits}
get_deposits <- function(account_id) {
  endpoint <- paste("accounts", account_id, "deposits", sep = "/")
  coinbase_get(endpoint)
}

#' Show a deposit
#'
#' Show an individual deposit.
#'
#' @param account_id Account Id
#' @param deposit_id Deposit Id
#' @export
#' @family wallet-deposits
#' @references \url{https://developers.coinbase.com/api/v2#show-a-deposit}
get_deposit <- function(account_id, deposit_id) {
  endpoint <- paste("accounts", account_id, "deposits", deposit_id, sep = "/")
  coinbase_get(endpoint)
}



