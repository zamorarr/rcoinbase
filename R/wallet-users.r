#' Show a user
#'
#' Get any user’s public information with their ID.
#' @param user_id User Id
#' @export
#' @family wallet-users
#' @references \url{https://developers.coinbase.com/api/v2#show-a-user}
get_user <- function(user_id) {
  endpoint <- paste("users", user_id, sep = "/")
  coinbase_get(endpoint)
}

#' Show current user
#'
#' Get current user’s public information. To get user’s email or private
#' information, use permissions wallet:user:email and wallet:user:read. If
#' current request has a wallet:transactions:send scope, then the response
#' will contain a boolean sends_disabled field that indicates if the user’s
#' send functionality has been disabled.
#' @export
#' @family wallet-users
#' @references \url{https://developers.coinbase.com/api/v2#show-current-user}
get_current_user <- function() {
  coinbase_get("user")
}

#' Show authorization information
#'
#' Get current user’s authorization information including granted scopes and
#' send limits when using OAuth2 authentication.
#' @export
#' @family wallet-users
#' @references \url{https://developers.coinbase.com/api/v2#show-authorization-information}
get_auth_info <- function() {
  coinbase_get("user/auth")
}

#' Update current user
#'
#' Modify current user and their preferences.
#'
#' @param body a named list of parameters
#' @keywords internal
#' @family wallet-users
#' @references \url{https://developers.coinbase.com/api/v2#update-current-user}
#' @examples
#' \dontrun{
#' body <- list(name = "mynewname")
#' resp <- update_current_user(body)
#' }
update_current_user <- function(body) {
  stopifnot(is.list(body))
  coinbase_put("user", body = body)
}
