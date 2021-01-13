" Make sure the plugin manager is installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" General
Plug 'junegunn/vim-peekaboo' " peek registers
Plug 'preservim/nerdtree' " tree view for files
Plug 'jiangmiao/auto-pairs' " insert brackets etc. in pairs
Plug 'dense-analysis/ale' " TODO
Plug 'junegunn/fzf' " fuzzy finder
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'tpope/vim-commentary' " shortcuts for commenting line

" Debugger
Plug 'puremourning/vimspector'

" CSharp
Plug 'OmniSharp/omnisharp-vim' " language server for C#
Plug 'nickspoons/vim-sharpenup' " TODO

" Python
Plug 'neoclide/coc.nvim' " intellisense
Plug 'palantir/python-language-server'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'maximbaz/lightline-ale'

call plug#end()
