# vim: ft=r

# -- パッケージは手動インストール：
# pak::pak("conflicted")
# pak::pak("pacman")
# pak::pak("tidyverse")
# pak::pak("jalvesaq/colorout")
#
# (pak は rig 経由での R のインストール時に自動で入る)
#
# -- pak が利用不可なら：
# install.packages("conflicted")
# install.packages("pacman")
# install.packages("tidyverse")
# install.packages("colorout", repos = "https://community.r-multiverse.org")

# -- 関数: パッケージが存在すれば読み込む
load_if_available <- function(pkg, quiet_startup = FALSE) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    if (quiet_startup) {
      suppressPackageStartupMessages(
        library(pkg, character.only = TRUE)
      )
    } else {
      library(pkg, character.only = TRUE)
    }
  }
}

# -- パッケージ読み込み
load_if_available("conflicted")
load_if_available("MASS", quiet_startup = TRUE)
load_if_available("tidyverse")

# pak と pacman は毎回読み込む必要がないので記述しない
# pak::pak(...) とすれば読み込まなくても使える

# -- パッケージ読み込み（対話セッション限定）
if (interactive() && requireNamespace("colorout", quietly = TRUE)) {
  library(colorout)
}

# Conflicted {{{

if (
  requireNamespace("conflicted", quietly = TRUE) &&
  requireNamespace("dplyr", quietly = TRUE)
) {
  conflicted::conflicts_prefer(
    dplyr::filter,
    dplyr::lag,
    dplyr::select,
    .quiet = TRUE
  )
}

# }}}

# Colorout {{{

# Nord Theme:
# https://github.com/jalvesaq/colorout/issues/27#issuecomment-1692518129

# General ----------------------------------------

if (interactive() && requireNamespace("colorout", quietly = TRUE)) {
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

  # Custom Patterns ------------------------------

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
}

# }}}

# clear 系関数群の読み込み
clear_file <- "~/dotfiles/rlang/clear.R"

if (file.exists(clear_file)) {
  source(clear_file)
}
