#' Internal only function, returns last command as latex
#'
#' @param options valid connection to maxima.
#'
#' @import R.utils
#'
#' @export
EngineCAS <- function(
    options = NULL
){

  # Count number of mathml formuilas to add:
  options$code <- paste0(options$code, collapse = "")
  nformulas <- sum(charToRaw(options$code) == charToRaw(';'))
  formNames <- paste0(
    "mathml_",
    formatC(seq_len(nformulas), width = 8, format = "d", flag = "0"),
    ".mathml"
  )

  for (i in seq_len(nformulas)) {
    options$code <- sub(";", paste0('$with_stdout("', formNames[i],'", mathml_display(%))$'), options$code)

  }

  # This must be a parameter
  #fileLocation     <- "~/Desktop/Projects/BitterCAS/inst/test/test.Rmd"#knitr::current_input(dir = TRUE)


  #chnk <- paste0(GetTexOutput(options$code, con = EnvCAS$currentConn), collapse = "")
  readLines(con = EnvCAS$currentConn, ok = TRUE, warn = FALSE)
  writeLines(options$code, con = EnvCAS$currentConn)
  Sys.sleep(0.5)
  readLines(con = EnvCAS$currentConn, ok = TRUE, warn = FALSE)
  res <- sapply(list.files(EnvCAS$userDir, full.names = TRUE), function(x) {
    paste0(readLines(x, warn = FALSE), collapse = "")
  })
  unlink(list.files(EnvCAS$userDir, full.names = TRUE))
  res <- paste0(res, collapse = "</br>")
  res <- gsub("math xmlns", paste0('math display="', options$display,'" xmlns'), res)
  return(knitr::asis_output(res))
}
