-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
    use 'ThePrimeagen/harpoon'
    use 'tpope/vim-fugitive'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'morhetz/gruvbox',
        as = 'gruvbox',
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
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
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'vimpostor/vim-lumen'

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup()
        end
    }

    use {
        'mattn/emmet-vim',
        setup = function()
            vim.g.user_emmet_leader_key = '<c-,>'
        end
    }

    use 'dstein64/vim-startuptime'

    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use {
        "giusgad/pets.nvim",
        requires = {"edluffy/hologram.nvim", "MunifTanjim/nui.nvim"},
        config = function()
            require("pets").setup()
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup()
        end
    }
end)
