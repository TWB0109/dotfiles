local set = vim.opt
local let = vim.g
local o   = vim.o
local bo  = vim.bo
local wo  = vim.wo

-- Basics
set.nu  = true
set.rnu = true
set.cursorline = true
set.showcmd = true
set.wrap = false
set.compatible = false
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.pastetoggle = "<F10>"
set.mouse = "a"
set.shell = "/bin/zsh"
set.scl = "auto"
set.encoding = "utf-8"

-- Indentation
set.expandtab  = true
set.cindent    = true
set.autoindent = true
set.tabstop    = 4
set.shiftwidth = 4

-- Elite Mode
let.elite_mode = true

-- Colorscheme
let.colorscheme = "gruvbox"
