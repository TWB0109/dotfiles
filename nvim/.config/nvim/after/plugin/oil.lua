require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
})

vim.keymap.set('n', '<leader>pv', vim.cmd.Oil, {desc = "Open Oil in a buffer"})
vim.keymap.set('n', '<leader>pV', '<cmd>Oil --float<CR>', {desc = "Open Oil in a floating window"})
