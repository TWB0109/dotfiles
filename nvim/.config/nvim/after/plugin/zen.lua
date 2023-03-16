require("zen-mode").setup {
    window = {
        options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false
        }
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false,
            showcmd = false,
        },
        gitsigns = {enabled = false},
        kitty = {
            enabled = true,
            font = "+4"
        },
        alacritty = {
            enabled = true,
            font = "14"
        }
    }
}
