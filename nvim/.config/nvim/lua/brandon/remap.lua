vim.g.mapleader = ' '
vim.g.maplocalleader = '  '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, {desc = "Opens Netrw"})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


vim.keymap.set('n', '<Up>', ':resize +2<CR>')
vim.keymap.set('n', '<Down>', ':resize -2<CR>')
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>')
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

vim.keymap.set("n", "<leader>y", "\"+y", {desc = "Yanks to system clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "Yanks to system clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Yanks current line to system clipboard"})

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")

vim.keymap.set("n", "<leader>=", "=G", {desc = "Properly indents the whole file"})
vim.keymap.set("i", "<C-BS>", "<C-W>", {desc = "Ciw"})
