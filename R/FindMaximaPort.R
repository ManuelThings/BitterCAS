#' Internal only function, find an available port to connect with maxima
#'
#' Ports 1024-49151 are the User Ports and are the ones to use for your custom protocols.
#'
#' @param fromPort integer, defaults at 1024 First port from which to look for available ports.
#' @param toPort integer, defaults at 49151 End port from 'fromPort' from which to look for available ports.
#' @export
FindMaximaPort <- function(
    fromPort = 1024,
    toPort   = 49151
) {
  for (port in seq(fromPort, toPort)) {
    scon <- try(serverSocket(port), silent = TRUE)
    if (all(class(scon) %in% c("servsockconn", "connection"))) {
      if (isOpen(con = scon)) {
        return(list(con = scon, port = port))
      }
    }
  }
  stop("Port/s unavailable!, This should NOT happen!!")
}
