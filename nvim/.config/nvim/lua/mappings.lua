local map = vim.api.nvim_set_keymap
local let = vim.g
noremap = { noremap = true } 

-- Map The Leader Key
let.mapleader = ","

-- ii = <ESC>
map('i', 'ii', '<ESC>', { noremap = true })

-- Buffer Mappings
map('n', '<leader>bn', ':bnext<cr>', noremap)
map('n', '<leader>bp', ':bprev<cr>', noremap)
map('n', '<leader>bd', ':bd<cr>', noremap)
map('n', '<leader>bl', ':Telescope buffers<cr>', noremap)

-- Find files
map('n', '<leader>ff', ':Telescope find_files<cr>', noremap)

-- Terminal Escape
map('t', '<ESC>', '<C-\\><C-n>', noremap)

-- Spawn Terminals
map('n', '<leader>ts', ':sp term://zsh<CR>', noremap)
map('n', '<leader>tv', ':vs term://zsh<CR>', noremap)

-- Elite Mode (Turn off or on in lua/settings.lua)
if(let.elite_mode)
then
    map('n', '<Up>', ':resize +2<CR>', noremap)
    map('n', '<Down>', ':resize -2<CR>', noremap)
    map('n', '<Left>', ':vertical resize +2<CR>', noremap)
    map('n', '<Right>', ':vertical resize -2<CR>', noremap)
end

-- Nvim-Tree
map('n', '<C-N>', ':NvimTreeToggle<CR>', noremap)
