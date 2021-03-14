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
set cursorline
set encoding=utf-8
set showcmd
set nopaste
set nocompatible
set splitbelow
set splitright
set laststatus=2
set shortmess+=A
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F10>

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
nnoremap <C-N> :NERDTreeToggle <CR><CR>
inoremap ii <ESC>
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap tt :tabf
nmap tn :tabn <CR><CR>
nmap tp :tabp <CR><CR>
nnoremap <C-b> :set rnu! <CR><CR>
map <leader>C :w! \| !pancomp <C-R>%<C-R>
map <leader>bd :bd <CR><CR>
map <leader>bn :bn <CR><CR>
map <leader>bp :bp <CR><CR>
map <leader>bf :FBuffers <CR>
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
endif

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
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"Deoplete 
Plug 'wellle/tmux-complete.vim'
Plug 'fszymanski/deoplete-emoji'
Plug 'Shougo/neco-syntax'

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
Plug 'akiomik/git-gutter-vim'
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'dhruvasagar/vim-zoom'

" Initialize plugin system
call plug#end()

"Tmux-complete
let g:tmuxcomplete#trigger = ''

"Deoplete-emoji
call deoplete#custom#source('emoji', 'filetypes', ['markdown', 'vimwiki', "org"])
call deoplete#custom#source('emoji', 'converters', ['converter_emoi']) 

"UltiSnips
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Haskell 
let g:haskell_classic_highlighting = 1

"lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

"Deoplete
call deoplete#custom#option('auto_complete_delay', 150,)
let g:deoplete#enable_at_startup = 1
"inoremap <silent><expr><tab> pumvisible() ? '\<c-n>' : '\<tab>'
"inoremap <silent><expr><s-tab> pumvisible() ? '\<c-p>' : '\<s-tab>'

"Colorscheme config
colorscheme gruvbox
set background=dark
set fillchars+=vert:\ 
highlight Normal ctermbg=none
highlight LineNr ctermbg=8 cterm=bold ctermfg=gray
highlight CursorLineNr ctermfg=2 cterm=bold
highlight VertSplit ctermbg=0
