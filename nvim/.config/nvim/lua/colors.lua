-- Configure colorscheme colors
--
if (Let.colorscheme == "gruvbox") then
    Cmd([[
        colorscheme gruvbox

        highlight Normal guibg=#32302f
        highlight LineNr guibg=#665c54 gui=bold guifg=#A8A8A8
        highlight CursorLineNr guifg=#b8bb26 gui=bold
        highlight VertSplit guifg=#d5c4a1 guibg=#32302f
        highlight EndOfBuffer guifg=#32302f guibg=#32302f
    ]])

elseif (Let.colorscheme == "dracula") then
    Cmd([[
        colorscheme dracula

        highlight Normal guibg=#282a36
        highlight LineNr guibg=#44475a gui=bold guifg=#A8A8A8
        highlight CursorLineNr guifg=#50fa7b gui=bold
        highlight VertSplit guifg=#f8f8f2 guibg=#282a36
        highlight EndOfBuffer guifg=#282a36 guibg=#282a36 
    ]])
end

-- Customizing Lualine
Gruvbox_material_dark = require("lualine.themes.gruvbox")
Gruvbox_material_dark.command.a.bg = "#83a598"
Gruvbox_material_dark.insert.a.bg  = "#b8bb26"
