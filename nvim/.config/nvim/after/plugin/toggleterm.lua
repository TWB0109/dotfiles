require("toggleterm").setup{
    open_mapping = [[<c-\>]],
    shade_terminals = false,
    highlights = {
        Normal = {
            guibg = vim.cmd[[
                set bg
            ]]
        },
        NormalFloat = {
            link = "Normal"
        }
    }
}
