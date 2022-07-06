--[[
 _       _ _     _
(_)_ __ (_) |_  | |_   _  __ _
| | '_ \| | __| | | | | |/ _` |
| | | | | | |_ _| | |_| | (_| |
|_|_| |_|_|\__(_)_|\__,_|\__,_|
-------------------------------
	      By TWB0109
--]]

-- Create abbreviations for vim commands
Set = vim.opt
Let = vim.g
O   = vim.o
Bo  = vim.bo
Wo  = vim.wo
Map = vim.api.nvim_set_keymap
Cmd = vim.cmd

-- Import the main configuration files
require('settings') -- see lua/settings.lua
require('mappings') -- see lua/mappings.lua
require('plugins')  -- see lua/plugins.lua
require('colors')  -- see lua/plugins.lua
