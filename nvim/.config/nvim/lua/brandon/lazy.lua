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
        build = ':TSUpdate',
        main = "nvim-treesitter.configs",
        opts = {
            -- A list of parser names, or "all"
            ensure_installed = { "norg", "help", "javascript", "typescript", "html", "css", "c", "lua", "rust", "python" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    },

    {
        'ThePrimeagen/harpoon',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        end
    },

    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open fuGITive status" })
            vim.keymap.set("n", "<leader>gp", '<CMD>Git push<CR>', { desc = "Push commits" })
        end,
        cmd = 'Git',
        keys = {
            { '<leader>gs', vim.cmd.Git, desc = 'Open fuGITive status' },
            { '<leader>gs', '<CMD>Git push<CR>', desc = "Push commits" }
        }
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Open a fuzzy file picker" })
            vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Open a fuzzy recent file picker" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Open a fuzzy buffer picker" })
            vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Open a git repo fuzzy file picker" })
            vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = "Open a fuzzy live grep" })
        end
    },

    --[[ {
        'morhetz/gruvbox',
        name = 'gruvbox',
        config = function() 
            vim.cmd.colorscheme('gruvbox') 
            Let.gruvbox_invert_selection = 0
        end
    }, ]]

    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.g.gruvbox_material_better_performance = 1
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_foreground = "original"
            vim.g.gruvbox_material_statusline_style = "original"
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_dim_inactive_windows = 1
            vim.g.gruvbox_material_show_eob = 0
            vim.g.gruvbox_material_diagnostic_text_highlight = 1
            vim.g.gruvbox_material_diagnostic_line_highlight = 1
            vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
            vim.cmd.colorscheme('gruvbox-material')
        end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            local lsp = require('lsp-zero')
            lsp.preset('recommended')

            lsp.setup()

            lsp.ensure_installed({
                'tsserver',
                'eslint',
                'sumneko_lua',
                'rust_analyzer',
                'python-lsp-server',
            })

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, opts)
                vim.keymap.set("n", "<C-H>", function() vim.lsp.buf.signature_help() end, opts)
            end)
        end
    },


    {
        'lervag/vimtex',
        ft = 'tex',
        config = function()
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_quickfix_mode = 0
        end
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
        config = true,
        init = function()
            -- If you want insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
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
        ft = { 'html', 'css', 'scss' }
    },

    'dstein64/vim-startuptime',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = {
                        'encoding',
                        'fileformat',
                        'filetype',
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "red" }
                        }
                    },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
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
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            }
        },
        init = function()
            vim.g.loaded_netrwPlugin = 1
            vim.g.loaded_netrw = 1
            vim.keymap.set('n', '<leader>pv', vim.cmd.Oil, { desc = "Open Oil in a buffer" })
            vim.keymap.set('n', '<leader>pV', '<cmd>Oil --float<CR>', { desc = "Open Oil in a floating window" })
        end
    },

    {
        'jbyuki/nabla.nvim',
        ft = { 'md', "tex", "norg", "org" },
        config = function()
            vim.keymap.set('n', '<leader>nr', function() require("nabla").popup() end, { desc = "Open Nabla Math popup" })
            vim.keymap.set('n', '<leader>nv', function() require("nabla").enable_virt() end,
                { desc = "Refresh Nabla Math virt line render" })
        end
    },

    {
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
        }
    },

    {
        'akinsho/toggleterm.nvim', version = '*',
        opts = {
            open_mapping = [[<c-\>]],
            shade_terminals = false,
            highlights = {
                Normal = {
                    guibg = vim.cmd [[
                    set bg
                    ]]
                },
                NormalFloat = {
                    link = "Normal"
                }
            }
        }
    },

    'folke/neodev.nvim',

    {
        'vim-pandoc/vim-pandoc',
        ft = 'md'
    },

    'vim-pandoc/vim-pandoc-syntax',

    {
        'folke/zen-mode.nvim',
        opts = {
            window = {
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false
                }
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                },
                gitsigns = { enabled = false },
                kitty = {
                    enabled = true,
                    font = "+4"
                },
                alacritty = {
                    enabled = true,
                    font = "14"
                }
            }

        }
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
            require 'telescope'.load_extension 'repo'
        end
    },

    {
        "folke/twilight.nvim",
        config = true
    },

    'alec-gibson/nvim-tetris',

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "│",
            filetype_exlude = { "help", "Trouble", "lazy", "oil" },
            show_trailing_blankline_indent = false,
            show_current_context = true,
            show_current_context_start = true
        }
    },
    {
        'vimwiki/vimwiki',
        init = function()
            vim.opt.compatible = false
            vim.cmd('filetype plugin on')
            vim.cmd('syntax on')
            vim.cmd([[
                let vimwiki_public = {}
                let vimwiki_public.path = '~/vimwiki-public'
                let vimwiki_public.path_html = '~/vimwiki-public-html'
                let vimwiki_public.template_path = '~/vimwiki-public/templates'
                let vimwiki_public.template_default = 'default'
                let vimwiki_public.template_ext = '.tpl'
                let vimwiki_public.syntax = 'markdown'
                let vimwiki_public.ext = '.md'
                let vimwiki_public.name = 'public'
                let vimwiki_public.custom_wiki2html = 'vimwiki_markdown' " pip install vimwiki-markdown

                let vimwiki_private = {}
                let vimwiki_private.path = '~/vimwiki-private'
                let vimwiki_private.path_html = '~/vimwiki-private-html'
                let vimwiki_private.template_path = '~/vimwiki-private/templates'
                let vimwiki_private.template_default = 'default'
                let vimwiki_private.template_ext = '.tpl'
                let vimwiki_private.syntax = 'markdown'
                let vimwiki_private.ext = '.md'
                let vimwiki_private.name = 'private'
                let vimwiki_private.custom_wiki2html = 'vimwiki_markdown' " pip install vimwiki-markdown

                let g:vimwiki_list = [vimwiki_private, vimwiki_public]
            ]])
            vim.g.vimwiki_global_ext = 0
        end
    }
})
