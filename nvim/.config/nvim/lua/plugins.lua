local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end


require('packer').startup(function(use)

	-- Let packer manage itself
	use 'wbthomason/packer.nvim'

	use 'morhetz/gruvbox'
	use {'dracula/vim', as = "dracula"}
    use 'kyazdani42/nvim-web-devicons'

	-- Lualine
	use {'nvim-lualine/lualine.nvim', run=require('lualine').setup{
		options = {
			component_separators = { left = '', right = ''},
			section_separators   = { left = '', right = ''},
			globalstatus         = true,
			theme = Gruvbox_material_dark,
        }
    }}

	-- Nvim-tree
	use 'kyazdani42/nvim-tree.lua'

    -- LSP Support
    use 'VonHeikemen/lsp-zero.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Emmet-vim
    use 'mattn/emmet-vim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'BurntSushi/ripgrep'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-telescope/telescope.nvim'

    -- Which-key
    use {'folke/which-key.nvim', run=require('which-key').setup()}

    -- Neogit
    use {'TimUntersberger/neogit', run=require('neogit').setup{
        disable_insert_on_commit = false
    }}

    -- Tabbar
    use 'romgrk/barbar.nvim'

    -- Autopairs
    use {'windwp/nvim-autopairs', run=require('nvim-autopairs').setup()}

    -- Kmonad
    use 'kmonad/kmonad-vim'

    -- Sxhkdrc
    use 'kovetskiy/sxhkd-vim'

    -- Nvim-comment
    use {'terrortylor/nvim-comment', run=require('nvim_comment').setup()}

    -- Nvim-colorizer
    use {'norcalli/nvim-colorizer.lua', run=require('colorizer').setup()}

    -- Toggleterm
    use {'akinsho/toggleterm.nvim', run=require('toggleterm').setup{
        open_mapping = [[<c-\>]],
    }}

    -- Yuck
    use 'elkowar/yuck.vim'

	if packer_bootstrap then
    	require('packer').sync()
  	end
end)

-- Nvim-Tree
require'nvim-tree'.setup {
  update_cwd = false,
  reload_on_bufenter = true,
  open_on_setup_file = false,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "no",
    mappings = {
      custom_only = false,
      list = {
          { key = "g.", action = "cd"},
          { key = "g..", action = "dir_up"}
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
}

-- LSP
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Emmet-vim

Let.user_emmet_leader_key="<leader>"
Let.user_emmet_mode="a"

Let.user_emmet_install_global= 0
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.html", "*.css"},
    command = "EmmetInstall"
})
