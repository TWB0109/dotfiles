require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
})

vim.keymap.set('n', '<leader>pv', vim.cmd.Oil)
vim.keymap.set('n', '<leader>pV', '<cmd>Oil --float<CR>')
