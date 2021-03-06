% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wallet-addresses.r
\name{create_address}
\alias{create_address}
\title{Create address}
\usage{
create_address(account_id, body = "")
}
\arguments{
\item{account_id}{Account Id}
}
\description{
Creates a new address for an account. As all the arguments are optional, it’s
possible just to do a empty POST which will create a new address. This is
handy if you need to create new receive addresses for an account on-demand.
Addresses can be created for all account types. With fiat accounts, funds
will be received with Instant Exchange.
}
\examples{
\dontrun{
addr <- create_address("fakeAcct2", body = list(name = "New receive address"))
}
}
\references{
\url{https://developers.coinbase.com/api/v2#create-address}
}
\seealso{
Other wallet-addresses: \code{\link{get_address_transactions}},
  \code{\link{get_addresses}}, \code{\link{get_address}}
}
\keyword{internal}
