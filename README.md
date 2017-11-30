## Overview 
**rcoinbase** provides an R interface for making requests to the Coinbase API.
This package is still under development and not all endpoints have been 
implemented yet. 

## Example usage
```R
library(rcoinbase)
user <- get_current_user()
accounts <- get_accounts()

user$content$data
accounts$content$data
```

## Installation and Setup
Installation can be done via devtools.

```R
devtools::install_github("zamorarr/rcoinbase")
```

## API Authentication
API key authentication requires each request to be signed. You can create and activate new API keys in your [Coinbase API settings](https://www.coinbase.com/settings/api).

This package assumes you have set your `COINBASE_KEY` and `COINBASE_SECRET` environment variables to the values provided when you created a new API key. Please ensure these are set in your ~/.Renviron file and check with

```R
Sys.getenv("COINBASE_KEY")
Sys.getenv("COINBASE_SECRET")
```

## Roadmap

- Wallet GET Endpoints (complete)
- Wallet POST/PUT/DELETE Endpoints (in-progress)
- Merchant Endpoints
- Data Endpoints
