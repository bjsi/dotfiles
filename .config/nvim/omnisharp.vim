" OmniSharp
" Open code completion if the last character is not a newline or a space
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'


""" General
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3

""" Popups
let g:OmniSharp_popup_position = 'atcursor'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  " let g:OmniSharp_popup_options = {
  " \ 'highlight': 'Normal',
  " \ 'padding': [0, 0, 0, 0],
  " \ 'border': [1]
  " \}
endif

let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_popup = 1

" Create a dictionary of IDE actions to shortcuts
" Allows me to keep the same shortcuts across languages
let dic = {}
let lis = readfile("/home/james/.config/nvim/ide_shortcuts")
for el in lis
    let sp = split(el, ",")
    let dic[sp[0]] = sp[1]
endfor

augroup csharp_commands
    autocmd!
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["code_actions"] . ' <Plug>(omnisharp_code_actions)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["navigate_up"] . ' <Plug>(omnisharp_navigate_up)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["navigate_down"] . ' <Plug>(omnisharp_navigate_down)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["go_to_def"] . ' <Plug>(omnisharp_go_to_definition)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["rename"] . ' <Plug>(omnisharp_rename)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["format"] . ' <Plug>(omnisharp_code_format)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["find_implementations"] . ' <Plug>(omnisharp_find_implementations)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["find_usages"] . ' <Plug>(omnisharp_find_usages)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["documentation"] . ' <Plug>(omnisharp_documentation)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["run_test"] . ' <Plug>(omnisharp_run_test)'
    execute 'autocmd FileType cs nmap <silent> <buffer> ' . dic["run_tests_file"] . ' <Plug>(omnisharp_run_tests_in_file)'
    autocmd FileType cs nmap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd BufWritePre *.cs :OmniSharpCodeFormat

    " vim-better-whitespace
    autocmd FileType cs let g:strip_whitespace_on_save = 1
    autocmd FileType cs let g:strip_whitespace_confirm = 0
augroup END


