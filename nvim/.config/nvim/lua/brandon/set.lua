Set = vim.opt
Let = vim.g

Set.nu = true
Set.rnu = true
Set.cursorline = true
Set.showcmd = true
Set.wrap = false
Set.compatible = false
Set.splitbelow = true
Set.splitright = true
Set.termguicolors = true
Set.pastetoggle = "<F10>"
Set.mouse = "a"
Set.shell = "zsh"
Set.scl = "auto"
Set.encoding = "utf-8"

Set.expandtab = true
Set.cindent = true
Set.autoindent = true
Set.smartindent = true
Set.shiftwidth = 4
Set.tabstop = 4
Set.softtabstop = 4

Set.hlsearch = false
Set.incsearch = true

Set.cmdheight = 2

Set.scrolloff = 8
Set.isfname:append("@-@")
Set.colorcolumn = "80"

Set.conceallevel = 1
Set.hidden = true

Let.markdown_fenced_languages = {'python', 'bash', 'cpp'}
