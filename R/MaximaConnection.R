#' Internal only function, creates a new Socket for a connection with maxima.
#'
#' @param con successful socket connection from FindMaximaPort()
#' @param port port of the successful socket connection()
#' @export
MaximaConnection <- function(
    con,
    port
) {
  maximaPath <- Sys.which("maxima")
  if (maximaPath == "") {
    stop("Maxima path not found!, Sys.which('maxima') should return the maxima executable path!")
  }
  system2(maximaPath,
          paste0("-s ", port),
          wait = FALSE,
          stdout = FALSE,
          stderr = stdout()
  )
  maximaSocket <- socketAccept(
    socket = con,
    blocking = FALSE,
    open = "r+b"
  )
  close(con)
  return(maximaSocket)
}
