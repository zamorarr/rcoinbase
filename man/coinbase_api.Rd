% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api.r
\name{coinbase_api}
\alias{coinbase_api}
\alias{coinbase_get}
\alias{coinbase_post}
\alias{coinbase_put}
\alias{coinbase_delete}
\title{Coinbase API}
\usage{
coinbase_api(endpoint, method = c("get", "post", "put", "delete"), ...)

coinbase_get(endpoint, ...)

coinbase_post(endpoint, ...)

coinbase_put(endpoint, ...)

coinbase_delete(endpoint, ...)
}
\arguments{
\item{method}{appropriate web method. These map to httr::GET, httr::POST, etc...}

\item{...}{extra arguments passed to httr::GET, httr::POST, etc...}
}
\description{
Make request to Coinbase API.
}
\examples{
\dontrun{
coinbase_get("prices/BTC-USD/spot", query = list(date = "2017-01-01"))
}
}
\keyword{internal}
