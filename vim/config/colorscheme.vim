" Hybrid -----------------------------------------

let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

" nordtheme/vim ----------------------------------

let g:nord_italic    = 0
let g:nord_underline = 1

" shaunsingh/nord.nvim ---------------------------

let g:nord_borders = 1

" Everforest -------------------------------------

let g:everforest_background         = 'hard'
let g:everforest_better_performance = 1
" let g:everforest_enable_italic      = 1
let g:everforest_disable_italic_comment = 1

" Edge -------------------------------------------

let g:edge_style              = 'default'
let g:edge_better_performance = 1
let g:edge_enable_italic      = 1
" let g:edge_disable_italic_comment = 1

" Sonokai ----------------------------------------

let g:sonokai_style              = 'maia'
let g:sonokai_better_performance = 1
let g:sonokai_enable_italic      = 1
" let g:sonokai_disable_italic_comment = 1

" Gruvbox-Material -------------------------------

let g:gruvbox_material_background         = 'medium'
let g:gruvbox_material_foreground         = 'material'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_italic      = 1
" let g:gruvbox_material_disable_italic_comment = 1

" Define highlights ------------------------------

function! s:define_highlights() abort
  highlight! link htmlItalic LineNr
  highlight! link htmlBold WarningMsg
  highlight! link htmlBoldItalic ErrorMsg
  highlight! link HighlightedyankRegion Visual
  highlight! link ExtraWhitespace Visual
endfunction

augroup def-highlights
  autocmd!
  autocmd ColorScheme * call s:define_highlights()
augroup END

" Colorscheme ------------------------------------

set background=dark

if has('nvim')
  colorscheme nord
else
  colorscheme everforest
endif
