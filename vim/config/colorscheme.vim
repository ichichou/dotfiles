" Colorscheme Config {{{

" Hybrid {{{
let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'
" }}}

" nordtheme/vim {{{
let g:nord_italic    = 0
let g:nord_underline = 1
" }}}

" shaunsingh/nord.nvim {{{
let g:nord_borders = 1
" }}}

" Everforest {{{
let g:everforest_background         = 'hard'
let g:everforest_better_performance = 1
" let g:everforest_enable_italic      = 1
let g:everforest_disable_italic_comment = 1
" }}}

" Edge {{{
let g:edge_style              = 'default'
let g:edge_better_performance = 1
let g:edge_enable_italic      = 1
" let g:edge_disable_italic_comment = 1
" }}}

" Sonokai {{{
let g:sonokai_style              = 'maia'
let g:sonokai_better_performance = 1
let g:sonokai_enable_italic      = 1
" let g:sonokai_disable_italic_comment = 1
" }}}

" Gruvbox-Material {{{
let g:gruvbox_material_background         = 'medium'
let g:gruvbox_material_foreground         = 'material'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_italic      = 1
" let g:gruvbox_material_disable_italic_comment = 1
" }}}

" }}}

" Define Highlights {{{

augroup def-highlights
  autocmd!
  autocmd ColorScheme * call s:define_highlights()
  autocmd ColorScheme *fox call s:define_highlights_nightfox()
augroup END

function! s:define_highlights() abort
  highlight! link htmlItalic LineNr
  highlight! link htmlBold WarningMsg
  highlight! link htmlBoldItalic ErrorMsg

  highlight! link HighlightedyankRegion Visual
  highlight! link ExtraWhitespace Visual

  " highlight! link StatusLine VertSplit
  " highlight! link StatusLineNC VertSplit
endfunction

function! s:define_highlights_nightfox() abort
  highlight CursorLine   cterm=NONE
  highlight CursorLineNr cterm=NONE
endfunction

" }}}

set background=dark
colorscheme nordfox
