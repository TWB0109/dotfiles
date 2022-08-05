local noremap = { noremap = true, silent = true }

-- Map The Leader Key
Let.mapleader = ","

-- ii = <ESC>
Map('i', 'ii', '<ESC>', { noremap = true })

--------------------------------

-- Tab mappings

---- Move to previous/next
Map('n', '<A-,>', ':BufferPrevious<cr>', noremap)
Map('n', '<A-.>', ':BufferNext<cr>', noremap)

---- Re-order to previous/next
Map('n', '<A-<>', ':BufferMovePrevious<cr>', noremap)
Map('n', '<A->>', ':BufferMoveNext<cr>', noremap)

---- Goto buffer in position...
Map('n', '<A-1>', ':BufferGoto 1<cr>', noremap)
Map('n', '<A-2>', ':BufferGoto 2<cr>', noremap)
Map('n', '<A-3>', ':BufferGoto 3<cr>', noremap)
Map('n', '<A-4>', ':BufferGoto 4<cr>', noremap)
Map('n', '<A-5>', ':BufferGoto 5<cr>', noremap)
Map('n', '<A-6>', ':BufferGoto 6<cr>', noremap)
Map('n', '<A-7>', ':BufferGoto 7<cr>', noremap)
Map('n', '<A-8>', ':BufferGoto 8<cr>', noremap)
Map('n', '<A-9>', ':BufferGoto 9<cr>', noremap)

---- Pin/Unping buffer
Map('n', '<A-p>', ':BufferPin<cr>', noremap)

---- Close buffer
Map('n', '<A-w>', ':BufferClose<cr>', noremap)

---- Magic Buffer-picking mode
Map('n', '<A-s>', ':BufferPick<cr>', noremap)

--------------------------------

-- Disable hlsearch
Map('n', '<Return>', ':nohlsearch<cr>', noremap)

-- Find files
Map('n', '<leader>ff', ':Telescope find_files<cr>', noremap)

-- Terminal Escape
Map('t', '<ESC>', '<C-\\><C-n>', noremap)

-- Spawn Terminals
Map('n', '<leader>ts', ':sp term://zsh<CR>', noremap)
Map('n', '<leader>tv', ':vs term://zsh<CR>', noremap)

-- Elite Mode (Turn off or on in lua/settings.lua)
if(Let.elite_mode)
then
    Map('n', '<Up>', ':resize +2<CR>', noremap)
    Map('n', '<Down>', ':resize -2<CR>', noremap)
    Map('n', '<Left>', ':vertical resize +2<CR>', noremap)
    Map('n', '<Right>', ':vertical resize -2<CR>', noremap)
end

-- Nvim-Tree
Map('n', '<C-N>', ':NvimTreeToggle<CR>', noremap)

-- File finder
Map('n', '<C-f>', ':Telescope find_files<CR>', noremap)

-- Neogit
Map('n', '<leader>gs', ":lua require('neogit').open( {kind = \"split\"} ) <CR>", noremap)
