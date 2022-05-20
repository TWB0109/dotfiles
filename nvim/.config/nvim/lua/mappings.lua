local map = vim.api.nvim_set_keymap
local let = vim.g
local noremap = { noremap = true, silent = true }

-- Map The Leader Key
let.mapleader = ","

-- ii = <ESC>
map('i', 'ii', '<ESC>', { noremap = true })

--------------------------------

-- Tab mappings

---- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<cr>', noremap)
map('n', '<A-.>', ':BufferNext<cr>', noremap)

---- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<cr>', noremap)
map('n', '<A->>', ':BufferMoveNext<cr>', noremap)

---- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<cr>', noremap)
map('n', '<A-2>', ':BufferGoto 2<cr>', noremap)
map('n', '<A-3>', ':BufferGoto 3<cr>', noremap)
map('n', '<A-4>', ':BufferGoto 4<cr>', noremap)
map('n', '<A-5>', ':BufferGoto 5<cr>', noremap)
map('n', '<A-6>', ':BufferGoto 6<cr>', noremap)
map('n', '<A-7>', ':BufferGoto 7<cr>', noremap)
map('n', '<A-8>', ':BufferGoto 8<cr>', noremap)
map('n', '<A-9>', ':BufferGoto 9<cr>', noremap)

---- Pin/Unping buffer
map('n', '<A-p>', ':BufferPin<cr>', noremap)

---- Close buffer
map('n', '<A-w>', ':BufferClose<cr>', noremap)

---- Magic Buffer-picking mode
map('n', '<A-s>', ':BufferPick<cr>', noremap)

--------------------------------

-- Disable hlsearch
map('n', '<Return>', ':nohlsearch<cr>', noremap)

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

-- Neogit
map('n', '<leader>gs', ":lua require('neogit').open( {kind = \"split\"} ) <CR>", noremap)
