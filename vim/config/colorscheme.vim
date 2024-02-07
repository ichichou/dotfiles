" Hybrid
let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

" nordtheme/vim
let g:nord_italic    = 1
let g:nord_underline = 1

" shaunsingh/nord.nvim
let g:nord_borders = 1

" Everforest
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1

" Sonokai
let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1

" Edge
let g:edge_style = 'default'
let g:edge_better_performance = 1

" Gruvbox-Material
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_better_performance = 1

" Fix highlight
augroup vimrc
  autocmd VimEnter,ColorScheme * highlight! link htmlItalic LineNr
  autocmd VimEnter,ColorScheme * highlight! link htmlBold WarningMsg
  autocmd VimEnter,ColorScheme * highlight! link htmlBoldItalic ErrorMsg
  autocmd VimEnter,ColorScheme * highlight! link HighlightedyankRegion Visual
  autocmd VimEnter,ColorScheme * highlight! link ExtraWhitespace Visual

  autocmd VimEnter,ColorScheme * highlight! link EasyMotionTarget ErrorMsg
  autocmd VimEnter,ColorScheme * highlight! link EasyMotionShade Comment
  autocmd VimEnter,ColorScheme * highlight! link EasyMotionTarget2First MatchParen
  autocmd VimEnter,ColorScheme * highlight! link EasyMotionTarget2Second MatchParen
  autocmd VimEnter,ColorScheme * highlight! link EasyMotionMoveHL Search
  autocmd VimEnter,ColorScheme * highlight! link EasyMotionIncSearch Search
augroup END

" Colorscheme
set background=dark

if has('nvim')
  let s:colorscheme = 'nord'
else
  let s:colorscheme = 'nord'
endif

execute 'colorscheme' s:colorscheme
let g:lightline_colorscheme = s:colorscheme
" let g:lightline_colorscheme = 'gruvbox_material'
