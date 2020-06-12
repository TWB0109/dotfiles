""""""""""""""""""""""""""""""""
"        _                     "
" __   _(_)_ __ ___  _ __ ___  "
" \ \ / / | '_ ` _ \| '__/ __| "
"  \ V /| | | | | | | | | (__  "
" (_)_/ |_|_| |_| |_|_|  \___| "
"                              "
"           TWB0109            "
""""""""""""""""""""""""""""""""

set completeopt=longest,menuone
set shortmess+=A
set ruler
set showcmd
set nu
set laststatus =2
let g:move_key_mdifier = 'C' 
iabbrev *** •
iabbrev TTTTT `
inoremap ii <ESC>
inoremap <M-H> <Left>
inoremap <M-J> <Down>
inoremap <M-K> <Up>
inoremap <M-L> <Right>
syntax on
nnoremap <C-N> :NERDTree <CR><CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 
set splitbelow
set splitright
let mapleader = ','
let g:user_emmet_leader_key = ','

" Vim-Markdown folding disable
let g:vim_markdown_folding_disable = 1

" Tab mappings
nnoremap tt :tabf 
nmap tn :tabn <CR><CR>
nmap tp :tabp <CR><CR>

" Enable Omnicomplete for supported filetypes
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType py setlocal omnifunc=pythoncomplete#Complete

" Enable italic comments in bash
highlight Comment cterm=italic gui=italic

" Toggle relative numbers
nnoremap <C-b> :set rnu!<CR>

" Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"Elite Mode"
let g:elite_mode=1
""let g:indentLine_setColors = 0

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

"--AUTOCOMPLETION--
set omnifunc=syntaxcomplete#Complete

"LaTeX
let g:neotex_enabled=1

"Language Tool
let g:languagetool_jar='/usr/share/java/languagetool/languagetool-commandline.jar'
let g:languagetool_lang='es'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'junegunn/goyo.vim'
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/etdev/vim-hexcolor.git'
Plug 'alvan/vim-closetag'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim'
Plug 'vim-scripts/loremipsum'
Plug 'somini/vim-autoclose'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()
filetype on
filetype plugin indent on
filetype indent on

set smartindent
set tabstop=3
set shiftwidth=3
set expandtab
set cindent
set autoindent
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

" Gruvbox config
colorscheme gruvbox
set background=dark
set cursorline
set fillchars+=vert:\ 
highlight Normal ctermbg=none
highlight LineNr ctermbg=8 cterm=bold ctermfg=gray
highlight CursorLineNr ctermfg=2 cterm=bold
highlight VertSplit ctermbg=0
