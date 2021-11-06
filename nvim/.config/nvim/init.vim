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
set nowrap
set nocompatible
set splitbelow
set splitright
set shortmess+=A
set completeopt=longest,menuone
set pastetoggle=<F10>
set mouse=a
set inccommand=nosplit
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h14

if has("nvim")
    set shell=/bin/zsh
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
nnoremap <silent> <CR> :nohlsearch<CR><CR>
map <leader>C :w! \| !pancomp <C-R>%<C-R>
map <leader>bd :bd <CR><CR>
map <leader>bn :bn <CR><CR>
map <leader>bp :bp <CR><CR>
map <leader>bf :FBuffers <CR>
map <leader>tt :tabf
map <leader>tn :tabn <CR><CR>
map <leader>tp :tabp <CR><CR>
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
endif

" Diverse terminals
nnoremap <silent> ts :sp term://zsh <CR>
nnoremap <silent> tsp :sp term://python <CR>
nnoremap <silent> tsn :sp term://node <CR>
nnoremap <silent> tv :vs term://zsh <CR>
nnoremap <silent> tvp :vs term://python <CR>
nnoremap <silent> tvn :vs term://node <CR>

" Fugitive
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gp :G push<CR>
nnoremap <silent> <leader>gc :G commit<CR>

" Neovim Terminal
augroup nterminal-custom
    autocmd! *
    autocmd TermOpen * setlocal nonumber nornu signcolumn=no
    autocmd TermOpen * startinsert
augroup END

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

"Elite mode def
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

"Plug
source $HOME/.config/nvim/plug.vim

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
source $HOME/.config/nvim/plug-config/slime.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim

"Colorscheme config
colorscheme gruvbox
set background=dark
set fillchars+=vert:\▏
if (has('termguicolors'))
    set termguicolors
endif

" Gruvbox
highlight Normal guibg=#32302f
highlight LineNr guibg=#665c54 gui=bold guifg=#A8A8A8
highlight CursorLineNr guifg=#b8bb26 gui=bold
highlight VertSplit guifg=#d5c4a1 guibg=#32302f
highlight EndOfBuffer guifg=#32302f guibg=#32302f 

" Dracula
"highlight Normal guibg=#282a36
"highlight LineNr guibg=#44475a gui=bold guifg=#A8A8A8
"highlight CursorLineNr guifg=#50fa7b gui=bold
"highlight VertSplit guifg=#f8f8f2 guibg=#282a36
"highlight EndOfBuffer guifg=#282a36 guibg=#282a36 

" Terminal Colors
highlight Normal ctermbg=none
highlight LineNr ctermbg=8 cterm=bold ctermfg=gray
highlight CursorLineNr ctermfg=2 cterm=bold
highlight VertSplit ctermfg=7 ctermbg=0
highlight EndOfBuffer ctermfg=0 ctermbg=0

"Neovide
let g:neovide_cursor_antialiasing=v:true
let g:neovide_refresh_rate=60
