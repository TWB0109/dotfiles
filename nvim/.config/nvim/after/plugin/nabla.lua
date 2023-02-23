vim.keymap.set('n', '<leader>nr', function() require("nabla").popup() end, {desc = "Open Nabla Math popup"})
vim.keymap.set('n', '<leader>nv', function() require("nabla").enable_virt() end, {desc = "Refresh Nabla Math virt line render"})
