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

  # This must be a parameter
  fileLocation     <- "~/Desktop/Projects/BitterCAS/inst/test/test.Rmd"#knitr::current_input(dir = TRUE)

  # Function only used once? REMOVE
  maximaData <- function(fileLocation, code) {
    fileDirectory <- dirname(fileLocation)
    temporayDir  <- file.path(fileDirectory, 'tempMaxima')
    if (dir.exists(temporayDir)) {
      file.remove(list.files(temporayDir, full.names = TRUE))
    } else {
      dir.create(temporayDir)
    }
    maxEnv <- list()
    maxEnv$fileLocation <- fileLocation
    maxEnv$temporaryDir <- temporayDir
    maxEnv$chunkCode    <- code
    return(maxEnv)
  }

  # Clean the shit written down
  mData <- maximaData(fileLocation, options$code)
  pos <- which(grepl(";$", mData$chunkCode)) + 1L
  savePaths <-file.path(mData$temporaryDir, paste0("mathml_", seq_along(pos), ".mathml"))
  writeLine <- paste0('with_stdout("',savePaths, '", mathml_display(%))$')
  mData$chunkCode <- R.utils::insert(mData$chunkCode, pos, writeLine)

  mData$chunkCode <- c('load("alt-display.mac");set_alt_display(2, mathml_display);',mData$chunkCode)
  maximaCodeLines <- paste0(mData$chunkCode, collapse = "\n")
  maximaCodeFile <- file.path(mData$temporaryDir, "rmax.max")
  writeLines(maximaCodeLines, maximaCodeFile)
  system2("maxima", args = c("-b", maximaCodeFile))

  allfiles <- list.files(mData$temporaryDir, pattern = "^mathml.*[.]mathml$", full.names = TRUE)
  alllines <- sapply(allfiles, function(x)paste0(readLines(x, warn = FALSE), collapse = "\n"))
  chnk <- paste0(alllines, collapse = '')
  chnk <- gsub('math xmlns', 'math display="inline" xlmns', chnk)
  unlink(list.files(file.path(mData$temporaryDir), full.names = TRUE))
  return(knitr::asis_output(chnk))
}
