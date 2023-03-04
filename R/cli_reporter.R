cli_reporter <- function(status, done = FALSE) {
  if (done) {
    cat("\r\033[K")
    cat(paste0("DONE: ", status))
  } else {
    cat("\r\033[K")
    cat(status)
  }
}
