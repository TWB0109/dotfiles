require("toggleterm").setup{
    open_mapping = [[<c-\>]],
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
