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
set shortmess+=c
syntax on

"Coc.nvim
set hidden
set nobackup
set nowritebackup
set updatetime=300

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Emmet
let mapleader = ','
let g:user_emmet_leader_key = ','

"Mappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-L>
nnoremap <C-N> :NERDTreeToggle <CR><CR>
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
"autocmd FileType py setlocal omnifunc=pythoncomplete#Complete

"Remember Folds
augroup remember_folds 
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview

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
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload')

"Plug Defaults
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
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
Plug 'davidhalter/jedi-vim'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'mboughaba/i3config.vim'

" Initialize plugin system
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
filetype plugin on
filetype plugin indent on
filetype indent on

"Paste toggle
set pastetoggle=<F10>

"Haskell 
let g:haskell_classic_highlighting = 1

"lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

"i3config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"Colorscheme config
colorscheme gruvbox
set background=dark
set fillchars+=vert:\ 
highlight Normal ctermbg=none
highlight LineNr ctermbg=8 cterm=bold ctermfg=gray
highlight CursorLineNr ctermfg=2 cterm=bold
highlight VertSplit ctermbg=0
