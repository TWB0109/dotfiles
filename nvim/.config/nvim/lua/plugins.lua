require 'paq' {
    "morhetz/gruvbox";
    {"dracula/vim", as="dracula"};
    "kyazdani42/nvim-web-devicons";

    -- Statusline
    "beauwilliams/statusline.lua";

    -- Nvim-Tree
    "kyazdani42/nvim-tree.lua";

    -- LSP Support
    'VonHeikemen/lsp-zero.nvim';
    'neovim/nvim-lspconfig';
    'williamboman/nvim-lsp-installer';

    -- Autocompletion
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'saadparwaiz1/cmp_luasnip';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-nvim-lua';

    -- Snippets
    'L3MON4D3/LuaSnip';
    'rafamadriz/friendly-snippets';

    -- Emmet-vim
    'mattn/emmet-vim';

    -- Telescope
    "nvim-lua/plenary.nvim";
    "BurntSushi/ripgrep";
    "nvim-treesitter/nvim-treesitter";
    "nvim-telescope/telescope.nvim";

    -- Which-key
    {"folke/which-key.nvim", run=require("which-key").setup{}};

    -- Neogit
    {"TimUntersberger/neogit", run=require("neogit").setup {
        disable_insert_on_commit = false
    }};

    -- Tabbar
    "romgrk/barbar.nvim";

    -- Autopairs
    {"windwp/nvim-autopairs", run=require("nvim-autopairs").setup{}};

    -- Kmonad
    "kmonad/kmonad-vim";

    -- Sxhkdrc
    "kovetskiy/sxhkd-vim";

    -- Nvim-comment
    {"terrortylor/nvim-comment", run=require("nvim_comment").setup()};
}

-- Statusline
local statusline = require('statusline')
statusline.tabline = false

-- Nvim-Tree
require'nvim-tree'.setup {
  update_cwd = false,
  reload_on_bufenter = true,
  open_on_setup_file = true,
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
