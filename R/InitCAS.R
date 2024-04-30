#' Internal only function, prepares maxima environment
#'
#' @param con successful socket connection to maxima
#' @param userDir user directory to save intermediate objects
#' @export
InitCAS <- function(
  con,
  userDir
) {
  writeLines(text = paste0('load("operatingsystem")$chdir("', userDir,'")$'),      con = con)
  readLines(con = con, ok = TRUE, warn = FALSE)
  result <- NULL
}
