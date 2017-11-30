#' List payment methods
#'
#' Lists current user's payment methods.
#' @export
#' @family wallet-payment-methods
#' @references \url{https://developers.coinbase.com/api/v2#list-payment-methods}
get_payment_methods <- function() {
  coinbase_get("payment-methods")
}

#' Show a payment method
#'
#' Show a current user's payment method.
#'
#' @param payment_method_id Payment Method Id
#' @export
#' @family wallet-payment-methods
#' @references \url{https://developers.coinbase.com/api/v2#show-a-payment-method}
get_payment_method <- function(payment_method_id) {
  endpoint <- paste("payment-methods", payment_method_id, sep = "/")
  coinbase_get(endpoint)
}



