""""""""""""""""""""""""""""""""
"        _                     "
" __   _(_)_ __ ___  _ __ ___  "
" \ \ / / | '_ ` _ \| '__/ __| "
"  \ V /| | | | | | | | | (__  "
" (_)_/ |_|_| |_| |_|_|  \___| "
"                              "
"           TWB0109            "
""""""""""""""""""""""""""""""""
"Basics 
set nu
set rnu
set scl=auto
set cursorline
set encoding=utf-8
set showcmd
set nopaste
set nocompatible
set splitbelow
set splitright
set shortmess+=A
set completeopt=longest,menuone
set pastetoggle=<F10>
set mouse=a

if has("nvim")
    set shell=/bin/bash
endif

"Indent 
set expandtab 
set cindent 
set autoindent 
set tabstop=4
set shiftwidth=4

"Filetype 
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

syntax on
syntax enable

"i3config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"Emmet
let mapleader = ','
let g:user_emmet_leader_key = ','

"Mappings
inoremap ii <ESC>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap tt :tabf
nnoremap <silent> <CR> :nohlsearch<CR><CR>
nmap tn :tabn <CR><CR>
nmap tp :tabp <CR><CR>
map <leader>C :w! \| !pancomp <C-R>%<C-R>
map <leader>bd :bd <CR><CR>
map <leader>bn :bn <CR><CR>
map <leader>bp :bp <CR><CR>
map <leader>bf :FBuffers <CR>
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
endif

" Neovim Terminal
autocmd TermOpen * setlocal nonumber nornu signcolumn=no
autocmd TermOpen * startinsert

nnoremap <silent> ts :sp term://bash <CR>
nnoremap <silent> tsp :sp term://python <CR>
nnoremap <silent> tsn :sp term://node <CR>
nnoremap <silent> tv :vs term://bash <CR>
nnoremap <silent> tvp :sp term://python <CR>
nnoremap <silent> tvn :sp term://node <CR>

"Abbrevs
iabbrev *** • 
iabbrev TTTTT `

"Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType py setlocal omnifunc=pythoncomplete#Complete

autocmd FileType md set ft=markdown

"Vim-Markdown folding disable
let g:vim_markdown_folding_disable = 1

"MarkdownPreview
let g:mkdp_auto_start        = 0
let g:mkdp_auto_close        = 1
let g:mkdp_refresh_slow      = 1
let g:mkdp_open_to_the_world = 1
let g:mkdp_markdown_css      = "~/.vim/autoload/markdown-preview.nvim/air.css"

"Neotex
let g:neotex_enabled = 1
let g:neotex_delay   = 500
let g:tex_flavor     = "latex"

"Python Highlight
let g:python_highlight_all = 1

"FZF
nnoremap <C-T> :FZF <CR><CR>
let g:fzf_command_prefix = 'F'

"Elite mode
let g:elite_mode=1

"Vimwiki
let g:vimwiki_autowriteall=1

"Elite mode def
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

"Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload')

"Plug Defaults
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Installed Plugins
Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/etdev/vim-hexcolor.git'
Plug 'alvan/vim-closetag'
Plug 'othree/csscomplete.vim'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim'
Plug 'vim-scripts/loremipsum'
Plug 'somini/vim-autoclose'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'vim-python/python-syntax'
Plug 'donRaphaco/neotex', { 'for': 'tex'  }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'preservim/nerdcommenter'
Plug 'mboughaba/i3config.vim'
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'
Plug 'dhruvasagar/vim-zoom'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'josa42/vim-lightline-coc'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Initialize plugin system
call plug#end()

"Tmux-complete
let g:tmuxcomplete#trigger = ''

"Haskell 
let g:haskell_classic_highlighting = 1

"FixCursorHold.nvim
let g:cursorhold_updatetime = 100

"Source config files
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fern.vim

"Colorscheme config
colorscheme gruvbox
set background=dark
set fillchars+=vert:\▏
highlight Normal ctermbg=none
highlight LineNr ctermbg=8 cterm=bold ctermfg=gray
highlight CursorLineNr ctermfg=2 cterm=bold
highlight VertSplit ctermfg=7
highlight VertSplit ctermbg=0
highlight EndOfBuffer ctermfg=0 ctermbg=0
