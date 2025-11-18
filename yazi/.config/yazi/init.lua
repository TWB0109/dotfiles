require("bunny"):setup({
	hops = {
		{ key = "/", path = "/" },
		{ key = "m", path = "~/Music", desc = "Music" },
		{ key = "d", path = "~/Downloads", desc = "Downloads" },
		{ key = "D", path = "~/Documents", desc = "Documents" },
		{ key = "c", path = "~/.config", desc = "Config files" },
		{ key = "f", path = "/mnt/5347968b-d978-47e0-ad93-5a8ebbbfc73d/", desc = "Files Drive" },
		{ key = { "l", "s" }, path = "~/.local/share", desc = "Local share" },
		{ key = { "l", "b" }, path = "~/.local/bin", desc = "Local bin" },
		-- key and path attributes are required, desc is optional
	},
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true, -- Enable ephemeral hops, default is true
	tabs = true, -- Enable tab hops, default is true
	notify = true, -- Notify after hopping, default is false
	fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
