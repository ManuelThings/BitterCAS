#' Inline R function with maxima code, wraps EngineCAS
#'
#' @param code string with maxima code.
#'
#' @export
ICAS <- function(
    code = NULL
){
  fakeOptions <- list(code = code)
  EngineCAS(fakeOptions)
}
