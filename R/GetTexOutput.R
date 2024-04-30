#' Internal only function, extracts tex data
#'
#' @param mlines lines to be sent to maxima
#' @param con successful socket connection to maxima
#' @param waitTime time to wait from sending information to maxima and retreiving it
#' @export
GetTexOutput <- function(
    mlines,
    con,
    waitTime = 0.2
) {
  # "flush" previous returned data
  readLines(con = con, ok = TRUE, warn = FALSE)
  mlines <- gsub(";", "$tex(%)$", mlines)
  writeLines(mlines, con = con)
  Sys.sleep(waitTime)
  res <- readLines(con = con, ok = TRUE, warn = FALSE)
  res <- res[!grepl("^[(][%](i|o){1}[0-9]+[)]", res)]
  tex <- c()
  for (outLine in res) {
    # IF starts with two $ signs, it is the beginning of a tex segment
    if (grepl("^[$]{2}", outLine)) {
      tex <- append(tex, outLine)
    } else {
      tex[length(tex)] <- paste0(
        tex[length(tex)],
        gsub("^ ", "", outLine)
      )
    }
  }
  return(tex)
}
