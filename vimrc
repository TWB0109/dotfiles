set nu
set laststatus =2
let g:move_key_mdifier = 'C' 
inoremap ii <ESC>
inoremap <M-H> <Left>
inoremap <M-J> <Down>
inoremap <M-K> <Up>
inoremap <M-L> <Right>
syntax on
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 
set splitbelow
set splitright
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

"Cursor Line"
"set cursorline
"--AUTOCOMPLETION--
set omnifunc=syntaxcomplete#Complete
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

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

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
Plug 'junegunn/limelight.vim'
Plug 'Yggdroot/indentLine'
Plug 'matze/vim-move'
Plug 'https://github.com/etdev/vim-hexcolor.git'

" Initialize plugin system
call plug#end()
filetype plugin indent on
filetype indent on
set smartindent
set expandtab
set tabstop=1 
set softtabstop=1  
set shiftwidth=2
set cindent
set autoindent
colorscheme wal
"hi cterm=bold term=bold
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
