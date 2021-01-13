let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
let g:ale_sign_style_error = '➤'
let g:ale_linters = { 
            \ 'cs': ['OmniSharp'],
            \}

let g:ale_fixers = {
            \ 'python': ['yapf']
            \}

let g:ale_fix_on_save = 1
