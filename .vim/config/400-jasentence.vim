if empty(globpath(&runtimepath, 'plugged/jasentence.vim'))
    finish
endif

let g:jasentence_endpat = '[、。，．？！（）［］｛｝「」『』〈〉《》【】〔〕‘’“”]\+'
