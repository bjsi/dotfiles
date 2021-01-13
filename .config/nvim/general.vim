let mapleader = ","  " set leader to comma

" sets how many lines of history VIM has to remember
set history=500

set updatetime=1000

" Enable filetype plugins
filetype plugin on
filetype indent on


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Popups
set completeopt=longest,menuone

" Fast saving
nmap <leader>w :w!<cr>

" Ctrl + Backspace delete last word
imap <C-BS> <C-W>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" split resize
nmap <C-S-Y> :vertical resize -5
nmap <C-S-H> :vertical resize +5

""" Layout and UI
" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Useful for buffers
set hidden

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set number  " Show line position
set ruler " show current position
set cmdheight=3  " Height of the command bar

" Cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q""]"

set encoding=utf8
set ffs=unix,dos,mac  " Use Unix as the standard file type

""" General
set lazyredraw  " for performance with macros
set magic  " for regexes
set showmatch  " matching brackets
" Configure backspace so it acts as it should act
" set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""" Errors
set noerrorbells  " disable error noise
set novisualbell  " disable error blinking
set t_vb=  " ??
set tm=500  " ??

"""" Searching
set ignorecase " Ignore case when searching
set smartcase " be smart about cases 
set hlsearch " Highlight search results
set incsearch " search as you type

" map space to search
map <space> /

" map control space to search backwards
map <C-space> ?

""" Files and Backups
set nobackup
set nowb
set noswapfile

""" Text, tabs, indentation
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""" Navigation
"" panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"" buffers
map K :bnext<cr>
nmap J :bprevious<cr>

""" Mouse
set mouse=a

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""" Editing Mappings
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
