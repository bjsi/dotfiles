" Create a dictionary of IDE actions to shortcuts
" Allows me to keep the same shortcuts across languages
let dic = {}
let lis = readfile("/home/james/.config/nvim/ide_shortcuts")
for el in lis
    let sp = split(el, ",")
    let dic[sp[0]] = sp[1]
endfor

augroup lisp_commands
    autocmd!
    autocmd FileType lisp set shortmess+=c
    execute 'autocmd FileType lisp xmap <silent> <buffer> ' . dic["code_actions"] . ' <Plug>(coc-codeaction-selected)'
    "execute 'autocmd FileType python nmap <silent> <buffer> ' . dic["navigate_up"] . ' <Plug>(omnisharp_navigate_up)'
    "execute 'autocmd FileType python nmap <silent> <buffer> ' . dic["navigate_down"] . ' <Plug>(omnisharp_navigate_down)'
    execute 'autocmd FileType lisp nmap <silent> <buffer> ' . dic["go_to_def"] . ' <Plug>(coc-definition)'
    execute 'autocmd FileType lisp nmap <silent> <buffer> ' . dic["rename"] . ' <Plug>(coc-rename)'
    " execute 'autocmd FileType python nmap <silent> <buffer> ' . dic["format"] . ' <Plug>(omnisharp_code_format)'
    execute 'autocmd FileType lisp nmap <silent> <buffer> ' . dic["find_implementations"] . ' <Plug>(coc-implementation)'
    "execute 'autocmd FileType python nmap <silent> <buffer> ' . dic["find_usages"] . ' <Plug>(omnisharp_find_usages)'
    " execute 'autocmd FileType python nmap <silent> <buffer> ' . dic["documentation"] . ' <Plug>(omnisharp_documentation)'
    " execute 'autocmd FileType python nmap <silent> <buffer> ' . dic["run_test"] . ' <Plug>(omnisharp_run_test)'
    " execute 'autocmd FileType python nmap <silent> <buffer> ' . dic["run_tests_file"] . ' <Plug>(omnisharp_run_tests_in_file)'
    "autocmd FileType python nmap <silent> <buffer> <leader>s :call CocActionAsync('showSignatureHelp')
    " autocmd BufWritePre *.cs :OmniSharpCodeFormat

    " vim-better-whitespace
    autocmd FileType lisp let g:strip_whitespace_on_save = 1
    autocmd FileType lisp let g:strip_whitespace_confirm = 0
augroup END

