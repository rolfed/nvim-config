vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#908caa' })  
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#f6c177' })  
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#908caa' })  

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
