local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Open a fuzzy file picker"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Open a git repo fuzzy file picker"})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {desc = "Open a fuzzy live grep"})
