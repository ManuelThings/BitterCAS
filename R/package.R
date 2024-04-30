#' bitterCAS
#'
#' @description
#' Provides an interface to Maxima, a computer algebra system (CAS).
#'
#' @details
#' Note: You need to install the Maxima software separately in order to make use of this package.
#'
## usethis namespace: start
#'
"_PACKAGE"
#> [1] "_PACKAGE"

maxEnv     <- new.env()
connection <- FindMaximaPort()
con        <- MaximaConnection(con = connection$con, port = connection$port)
maxEnv$currentConn <- con
InitCAS(con = con, userDir = "~/Desktop/Projects/BitterCAS/inst/tmp/")
