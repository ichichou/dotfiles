myenv <- new.env()

# Clear console messages
myenv$clear_console <- function() {
  cat("\014")
}

# Clear plots
myenv$clear_plots <- function() {
  if (dev.cur() > 1) dev.off()
}

# Clear global environment
myenv$clear_globalenv <- function() {
  rm(
    list  = ls(envir = globalenv()),
    envir = globalenv()
  )
}

# Clear all
myenv$clear_all <- function() {
  clear_console()
  clear_plots()
  clear_globalenv()
}

attach(myenv)
