if !executable("git")
    finish
endif

if empty(globpath(&runtimepath, 'plugged/vim-fugitive'))
    finish
endif

autocmd vimrc FileType fugitive nnoremap <silent> <buffer> q <C-w>q

nnoremap <Leader>g <Nop>
nnoremap [fugitive] <Nop>
nmap <Leader>g [fugitive]

nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]a :<C-u>Gwrite<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit -v<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>Glog<CR>
