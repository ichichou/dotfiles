# Clear console outputs

clear_console <- function() {
  cat("\014")
}

# Clear global environment

clear_globalenv <- function() {
  rm(list = ls(envir = globalenv()), envir = globalenv())
}

# Clear all

clear_all <- function() {
  clear_console()
  clear_globalenv()
}
