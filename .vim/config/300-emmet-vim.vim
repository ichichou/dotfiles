if empty(globpath(&runtimepath, 'plugged/emmet-vim'))
    finish
endif

autocmd vimrc FileType html,css,markdown EmmetInstall

" let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_install_global = 0
