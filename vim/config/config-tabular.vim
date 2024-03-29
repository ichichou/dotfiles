UsePlugin 'tabular'

function! s:Align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' &&
        \ (getline(line('.') - 1) =~# p || getline(line('.') + 1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')], '[^|]', '', 'g'))
    let position = strlen(matchstr(getline('.')[0:col('.')], '.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|', column)
          \ .. '\s\{-\}' .. repeat('.', position), 'ce', line('.'))
  endif
endfunction

inoremap <silent> <Bar> <Bar><Esc><Cmd>call <SID>Align()<CR>a

" map <Leader>a= <Cmd>Tabularize /=<CR>
" map <Leader>a: <Cmd>Tabularize /:\zs<CR>
