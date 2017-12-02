#' Coinbase API
#'
#' Make request to Coinbase API.
#'
#' @param method appropriate web method. These map to httr::GET, httr::POST, etc...
#' @param ... extra arguments passed to httr::GET, httr::POST, etc...
#' @keywords internal
#' @examples
#' \dontrun{
#' coinbase_get("prices/BTC-USD/spot", query = list(date = "2017-01-01"))
#' }
coinbase_api <- function(endpoint, method = c("get", "post", "put", "delete"), ...) {
  stopifnot(length(endpoint) == 1L)

  baseurl <- "https://api.coinbase.com"
  path = paste("/v2", endpoint, sep = "/")
  url <- httr::modify_url(baseurl, path = path)

  # get api key
  api_key <- Sys.getenv("COINBASE_KEY")

  # extract and validate arguments
  method <- match.arg(method)
  extra <- list(...)
  request_body <- get0("body", list2env(extra), inherits = FALSE, ifnotfound = "")

  # generate signature and timestamp
  timestamp <- as.character(as.integer(Sys.time()))
  signature <- access_signature(timestamp, path, request_body, method = method)

  # build headers
  # Please supply API version (YYYY-MM-DD) as CB-VERSION header
  headers <- httr::add_headers(
    "CB-ACCESS-TIMESTAMP" = timestamp,
    "CB-ACCESS-KEY" = api_key,
    "CB-ACCESS-SIGN" = signature,
    "CB-VERSION" = "2017-11-28",
    "Content-Type" = "application/json",
    "Accept" = "application/json",
    "User-Agent" = "github.com/zamorarr/rcoinbase")

  # get response
  method_fun <- switch(
    method,
    "get" = httr::GET,
    "post" = httr::POST,
    "put" = httr::PUT,
    "delete" = httr::DELETE
  )
  response <- method_fun(url, headers, ...)

  # check response type
  if (httr::http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  # parse content
  content <- httr::content(response, "text")
  json <- jsonlite::fromJSON(content, simplifyVector = FALSE)

  # check errors
  if (httr::http_error(response)) {
    stop(
      sprintf(
        "Coinbase API request failed [%s]\n%s\n",
        httr::status_code(response),
        json$errors[[1]]$message
        ),
      call. = FALSE
    )
  }

  # return object
  structure(
    list(
      content = json,
      path = path,
      response = response
    ),
    class = "coinbase_api"
    )
}

#' @rdname coinbase_api
#' @export
coinbase_get <- function(endpoint, ...) coinbase_api(endpoint, "get", ...)

#' @rdname coinbase_api
#' @export
coinbase_post <- function(endpoint, ...) coinbase_api(endpoint, "post", ..., encode = "json")

#' @rdname coinbase_api
#' @export
coinbase_put <- function(endpoint, ...) coinbase_api(endpoint, "put", ..., encode = "json")

#' @rdname coinbase_api
#' @export
coinbase_delete <- function(endpoint, ...) coinbase_api(endpoint, "delete", ..., encode = "json")

#' @export
print.coinbase_api <- function(x, ...) {
  cat("<Coinbase ", x$path, ">\n", sep = "")
  utils::str(x$content, 1)
  invisible(x)
}

#' Generate an api access signature
#'
#' The CB-ACCESS-SIGN header is generated by creating a sha256 HMAC using the
#' secret key on the prehash string timestamp + method + requestPath + body
#' (where + represents string concatenation). The timestamp value is the same as
#'  the CB-ACCESS-TIMESTAMP header.
#'
#' @param timestamp The CB-ACCESS-TIMESTAMP header MUST be number of seconds since Unix Epoch.
#' @param request_path path requesting
#' @param request_body The body is the request body string or omitted if there is no request body (typically for GET requests).
#' @param method The method should be UPPER CASE.
#'
#' @keywords internal
access_signature <- function(timestamp, request_path, request_body = "",
                             method = c("get", "post", "put", "delete") ) {
  method <- toupper(match.arg(method))

  if (nchar(request_body) > 0) {
    body <- paste(jsonlite::toJSON(request_body, auto_unbox = TRUE), collapse = "\n")
  } else {
    body <- ""
  }

  msg <- paste0(timestamp, method, request_path, body)

  api_secret <- Sys.getenv("COINBASE_SECRET")
  digest::hmac(api_secret, msg, "sha256", raw = FALSE)
}
