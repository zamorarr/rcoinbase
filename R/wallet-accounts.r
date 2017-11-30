#' List accounts
#'
#' Lists current user’s accounts to which the authentication method has access to.
#' @export
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#list-accounts}
get_accounts <- function() {
  coinbase_get("accounts")
}

#' Show an account
#'
#' Show current user’s account. To access the primary account for a given
#' currency, a currency string (BTC or ETH) can be used instead of the account
#' id in the URL.
#'
#' @param account_id Account Id
#' @export
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#show-an-account}
get_account <- function(account_id) {
  endpoint <- paste("accounts", account_id, sep = "/")
  coinbase_get(endpoint)
}

#' Create account
#'
#' Creates a new account for user.
#'
#' @param body a named list of parameters
#' @keywords internal
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#create-account}
#' @examples
#' \dontrun{
#' body <- list(name = "New Wallet")
#' resp <- create_account(body)
#' }
create_account <- function(body) {
  stopifnot(is.list(body))
  coinbase_post("accounts", body = body)
}

#' Set account as primary
#'
#' Promote an account as primary account.
#'
#' @param account_id Account Id
#' @keywords internal
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#set-account-as-primary}
#' @examples
#' \dontrun{
#' resp <- set_primary_account("123456")
#' }
set_primary_account <- function(account_id) {
  endpoint <- paste("accounts", account_id, "primary", sep = "/")
  coinbase_post(endpoint)
}

#' Update account
#'
#' Modifies user’s account.
#'
#' @param account_id Account Id
#' @param body a named list of parameters
#' @keywords internal
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#update-account}
#' @examples
#' \dontrun{
#' resp <- update_account("123456", list(name = "New account name"))
#' }
update_account <- function(account_id, body) {
  endpoint <- paste("accounts", account_id, sep = "/")
  coinbase_put(endpoint, body = body)
}

#' Delete account
#'
#' Removes user’s account. In order to remove an account it can’t be:
#' \itemize{
#' \item Primary account
#' \item Account with non-zero balance
#' \item Fiat account
#' \item Vault with a pending withdrawal
#' }
#'
#' @param account_id Account Id
#' @keywords internal
#' @family wallet-accounts
#' @references \url{https://developers.coinbase.com/api/v2#delete-account}
#' @examples
#' \dontrun{
#' resp <- delete_account("123456")
#' }
delete_account <- function(account_id) {
  endpoint <- paste("accounts", account_id, sep = "/")
  coinbase_delete(endpoint)
}
