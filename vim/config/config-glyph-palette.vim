UsePlugin 'glyph-palette.vim'

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END
