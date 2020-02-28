if empty(globpath(&runtimepath, 'plugged/vim-asciidoctor'))
    finish
endif

" HTML
" --------------------
let g:asciidoctor_executable = 'asciidoctor'
let g:asciidoctor_extensions = ['asciidoctor-diagram']
" let g:asciidoctor_css_path = ''
" let g:asciidoctor_css = ''

" PDF
" --------------------
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf-cjk'
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']
" let g:asciidoctor_pdf_themes_path = ''
" let g:asciidoctor_pdf_fonts_path = ''

" Code Highlight
" --------------------
" let g:asciidoctor_fenced_languages = []
