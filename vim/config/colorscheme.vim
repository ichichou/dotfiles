vim9script

# Colorscheme Config {{{

# Hybrid {{{
g:hybrid_custom_term_colors = 1
# g:lightline_hybrid_style = 'plain'
# }}}

# nordtheme/vim {{{
g:nord_italic    = 0
g:nord_underline = 1
# }}}

# shaunsingh/nord.nvim {{{
g:nord_borders = 1
# }}}

# Everforest {{{
g:everforest_background         = 'hard'
g:everforest_better_performance = 1
# g:everforest_enable_italic      = 1
g:everforest_disable_italic_comment = 1
# }}}

# Edge {{{
g:edge_style              = 'default'
g:edge_better_performance = 1
g:edge_enable_italic      = 1
# g:edge_disable_italic_comment = 1
# }}}

# Sonokai {{{
g:sonokai_style              = 'maia'
g:sonokai_better_performance = 1
g:sonokai_enable_italic      = 1
# g:sonokai_disable_italic_comment = 1
# }}}

# Gruvbox-Material {{{
g:gruvbox_material_background         = 'medium'
g:gruvbox_material_foreground         = 'material'
g:gruvbox_material_better_performance = 1
g:gruvbox_material_enable_italic      = 1
# g:gruvbox_material_disable_italic_comment = 1
# }}}

# }}}

# Define Highlights {{{

augroup def-highlights
  autocmd!
  autocmd ColorScheme * DefineHighlights()
  autocmd ColorScheme *fox DefineHighlightsNightfox()
augroup END

def DefineHighlights(): void
  highlight! link htmlItalic LineNr
  highlight! link htmlBold WarningMsg
  highlight! link htmlBoldItalic ErrorMsg

  highlight! link HighlightedyankRegion Visual
  highlight! link ExtraWhitespace Visual

  # highlight! link StatusLine VertSplit
  # highlight! link StatusLineNC VertSplit
enddef

def DefineHighlightsNightfox(): void
  highlight CursorLine   cterm=NONE
  highlight CursorLineNr cterm=NONE
enddef

# }}}

set background=dark
colorscheme nordfox
