require('catppuccin').setup({

})

function ColorMyPencils(color) 

    vim.cmd.colorscheme "catppuccin-mocha"

    --color = color or "catppuccin"
    --vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- change colors of comments and lines
    vim.cmd('highlight Comment guifg=#778899')
    vim.cmd('highlight LineNr guifg=#cccccc')

end

ColorMyPencils()
