function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal",       { bg = "#32302f", fg = "#d5c4a1" })
	vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "#32302f", fg = "#d5c4a1" })
	vim.api.nvim_set_hl(0, "LineNr",       { bg = "#665c54",  fg = "#A8A8A8", bold = true })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b8bb26", bold = true })
	-- vim.api.nvim_set_hl(0, "VertSplit",    { bg = "#32302f", fg = "#d5c4a1" })
	-- vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "#32302f", fg = "#32302f" })
end

ColorMyPencils()
