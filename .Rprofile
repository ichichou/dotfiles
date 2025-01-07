# vim: ft=r

pacman::p_load(
  conflicted,
  tidyverse,
  lubridate,
  stats,
  MASS
)

conflicted::conflicts_prefer(
  dplyr::filter,
  dplyr::lag,
  dplyr::select,
  .quiet = TRUE
)

source("~/dotfiles/rlang/clear.R")

clear_globalenv()
