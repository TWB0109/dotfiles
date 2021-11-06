if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload')

"Plug Defaults
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Installed Plugins
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }
Plug 'vim-scripts/loremipsum'
Plug 'somini/vim-autoclose'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'Natur3-Boy/dracula-for-lightline'
"Plug 'neovimhaskell/haskell-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'vim-python/python-syntax'
"Plug 'donRaphaco/neotex', { 'for': 'tex'  }
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'vimwiki/vimwiki'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'preservim/nerdcommenter'
Plug 'mboughaba/i3config.vim'
"Plug 'rust-lang/rust.vim'
"Plug 'ziglang/zig.vim'
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
Plug 'jpalardy/vim-slime'
Plug 'chrisbra/unicode.vim'
Plug 'tpope/vim-eunuch'
Plug 'baskerville/vim-sxhkdrc'
Plug 'elkowar/yuck.vim'
Plug 'habamax/vim-godot'
Plug 'tridactyl/vim-tridactyl'

" Initialize plugin system
call plug#end()
