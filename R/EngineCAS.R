#' CAS engine, ran by CAS code chunks.
#'
#' This function is only meant to be used in RMD files within chunks.
#'
#' @param options chunk options
#'
#' @import R.utils
#'
#' @export
EngineCAS <- function(
    options = NULL
){

  # Maxima line breaks are not meaningful, as sections are split by usin $ or ;
  options$code <- paste0(options$code, collapse = "")
  nformulas    <- sum(charToRaw(options$code) == charToRaw(';'))
  formNames    <- paste0(
    "mathml_",
    formatC(seq_len(nformulas), width = 8, format = "d", flag = "0"),
    ".mathml"
  )

  for (i in seq_len(nformulas)) {
    options$code <- sub(";", paste0('$with_stdout("', formNames[i],'", mathml_display(%))$'), options$code)
  }

  readLines(con = EnvCAS$currentConn, ok = TRUE, warn = FALSE)
  writeLines(options$code, con = EnvCAS$currentConn)

  # Let maxima create the outputs we need
  Sys.sleep(0.5)
  readLines(con = EnvCAS$currentConn, ok = TRUE, warn = FALSE)
  res <- sapply(list.files(EnvCAS$userDir, full.names = TRUE), function(x) {
    paste0(readLines(x, warn = FALSE), collapse = "")
  })

  # Ill add another option to collapse mathml in other ways, as several outputs in the same
  # line is not currently supported (</br>  -->  </br> or nothing?, let the user choose?)
  # If i let the user choose, it is also crrect to let him write what he wants in-between
  # outputs..
  unlink(list.files(EnvCAS$userDir, full.names = TRUE))
  res <- paste0(res, collapse = "</br>")
  res <- gsub("math xmlns", paste0('math display="', options$display,'" xmlns'), res)

  return(knitr::asis_output(res))
}
