"Basics
set nu
set cursorline
set encoding=utf-8
set showcmd
set nopaste
set splitbelow
set splitright
syntax on
colorscheme desert
let mapleader = ','
let g:user_emmet_leader_key = ','

"Mappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-L>
nnoremap <C-N> :NERDTree <CR><CR>
inoremap ii <ESC>
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap tt :tabf
nmap tn :tabn <CR><CR>
nmap tp :tabp <CR><CR>
nnoremap <C-b> :set rnu! <CR><CR>

"Abbrevs
iabbrev *** • 
iabbrev TTTTT `

"Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType py setlocal omnifunc=pythoncomplete#Complete

"Remember Folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview

"Elite mode
let g:elite_mode=1

"Elite mode def
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical reziae -2<CR>
endif

" Replace quotes with spaces in .json files
autocmd FileType json setlocal conceallevel=1

"Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/autoload')

"Plug Defaults
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Installed Plugins
Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/etdev/vim-hexcolor.git'
Plug 'alvan/vim-closetag'
Plug 'othree/csscomplete.vim'
Plug 'othree/html5.vim'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim'
Plug 'vim-scripts/loremipsum'
Plug 'somini/vim-autoclose'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'plasticboy/vim-markdown'
Plug 'unblevable/quick-scope'
Plug 'neovimhaskell/haskell-vim'
Plug 'valloric/youcompleteme'

"Initialize plugin system
call plug#end()

"Complete menu
set completeopt=longest,menuone

"Filetype omni
set omnifunc=syntaxcomplete#Complete

"Indent
set expandtab
set cindent
set autoindent
set tabstop=4
set shiftwidth=4

"Filetype
filetype on
filetype plugin indent on
filetype indent on

"Paste toggle
set pastetoggle=<F10>

"Haskell 
let g:haskell_classic_highlighting = 1

"Lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

"Colorscheme config
colorscheme gruvbox
set background=dark
set fillchars+=vert:\ 
highlight Normal ctermbg=none
highlight LineNr ctermbg=8 cterm=bold ctermfg=gray
highlight CursorLineNr ctermfg=2 cterm=bold
highlight VertSplit ctermbg=0
