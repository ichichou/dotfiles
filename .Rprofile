# vim: ft=r

# install.packages("pak")
# install.packages("tidyverse")
# pak::pak("pacman")
# pak::pak("conflicted")
# pak::pak("jalvesaq/colorout")

pacman::p_load(
  conflicted,
  tidyverse,
  stats,
  MASS,
  colorout
)

conflicted::conflicts_prefer(
  dplyr::filter,
  dplyr::lag,
  dplyr::select,
  .quiet = TRUE
)

# {colorout} {{{

# Nord Theme:
# https://github.com/jalvesaq/colorout/issues/27#issuecomment-1692518129

# General ----------------------------------------

colorout::setOutputColors(

  index    = '\x1b[38;2;76;86;106m',
  normal   = '\x1b[38;2;216;222;233m',

  number   = '\x1b[38;2;236;239;244m',
  negnum   = '\x1b[38;2;180;142;173m',
  zero     = '\x1b[38;2;136;192;208m', zero.limit = 0.01,
  infinite = '\x1b[38;2;236;239;244m',

  string   = '\x1b[38;2;235;203;139m',
  date     = '\x1b[38;2;236;239;244m',
  const    = '\x1b[38;2;136;192;208m',

  true     = '\x1b[38;2;163;190;140m',
  false    = '\x1b[38;2;191;97;106m',

  warn     = '\x1b[38;2;235;203;139m',
  stderror = '\x1b[38;2;191;97;106m',
  error    = '\x1b[38;2;191;97;106m',

  verbose  = FALSE
)

# Custom Patterns --------------------------------

# _ {data.table}

colorout::addPattern('[0-9]*:',  '\x1b[38;2;143;188;187m')  # Row num
colorout::addPattern('---',      '\x1b[38;2;76;86;106m')    # Row splitter
colorout::addPattern('<[a-z]*>', '\x1b[38;2;143;188;187m')  # Col class

# _ `str`

# Class
colorout::addPattern(' num ',        '\x1b[38;2;143;188;187m')
colorout::addPattern(' int ',        '\x1b[38;2;143;188;187m')
colorout::addPattern(' chr ',        '\x1b[38;2;143;188;187m')
colorout::addPattern(' Factor ',     '\x1b[38;2;143;188;187m')
colorout::addPattern(' Ord.factor ', '\x1b[38;2;143;188;187m')
colorout::addPattern(' logi ',       '\x1b[38;2;143;188;187m')
colorout::addPattern('function ',    '\x1b[38;2;143;188;187m')
colorout::addPattern(' dbl ',        '\x1b[38;2;143;188;187m')
colorout::addPattern(' lgcl ',       '\x1b[38;2;143;188;187m')
colorout::addPattern(' cplx ',       '\x1b[38;2;143;188;187m')
# Misc
colorout::addPattern('$ ',           '\x1b[38;2;76;86;106m')

# }}}

source("~/dotfiles/rlang/clear.R")

clear_globalenv()
