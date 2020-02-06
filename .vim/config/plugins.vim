" ----------------------------------------
" Plugins
" ----------------------------------------

if !executable("ooo")
    finish
endif

if empty(globpath(&runtimepath, 'autoload/xxx'))
    finish
endif
