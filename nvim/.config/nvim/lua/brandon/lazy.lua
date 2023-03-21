local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    'ThePrimeagen/harpoon',

    'tpope/vim-fugitive',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    {
        'morhetz/gruvbox',
        name = 'gruvbox',
        build = {
            ':colorscheme gruvbox'
        }
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },


    {
        'lervag/vimtex',
        ft = 'tex'
    },

    {
        "folke/which-key.nvim",
        config = true,
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },

    'vimpostor/vim-lumen',

    {
        "windwp/nvim-autopairs",
        config = true
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = true
    },

    {
        'mattn/emmet-vim',
        init = function()
            vim.g.user_emmet_leader_key = '<c-,>'
        end,
        ft = {'html', 'css', 'scss'}
    },

    'dstein64/vim-startuptime',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },

    {
        'lewis6991/gitsigns.nvim',
        config = true
    },

    {
        'numToStr/Comment.nvim',
        config = true
    },

    {
        'stevearc/oil.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = true,
        init = function()
            vim.g.loaded_netrwPlugin = 1
            vim.g.loaded_netrw = 1
        end
    },

    {
        'nvim-neorg/neorg',
        config = true,
        build = ':Neorg sync-parsers',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    {
        'jbyuki/nabla.nvim',
        ft = {'md', "tex", "norg", "org"}
    },

    {
        'folke/noice.nvim',
        config = true,
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        }
    },

    {
        'akinsho/toggleterm.nvim', version = '*',
        config = true
    },

    'folke/neodev.nvim',

    {
        'vim-pandoc/vim-pandoc',
        ft = 'md'
    },

    'vim-pandoc/vim-pandoc-syntax',

    {
        'folke/zen-mode.nvim',
        config = true
    },

    {
        'iurimateus/luasnip-latex-snippets.nvim',
        opts = {
            use_treesitter = true
        },
        dependencies = { 'L3MON4D3/LuaSnip', 'nvim-treesitter/nvim-treesitter' },
        ft = 'tex',
    },

    {
        'cljoly/telescope-repo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require'telescope'.load_extension'repo'
        end
    },

    {
        "folke/twilight.nvim",
        config = true
    },

    'alec-gibson/nvim-tetris',
})
