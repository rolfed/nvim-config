-- Keybinding for fuzzy searching Neorg notes
vim.api.nvim_set_keymap('n', '<Leader>nf', "<cmd>Telescope neorg find_norg_files<CR>", { noremap = true, silent = true })

-- Finding tasks
vim.api.nvim_set_keymap('n', '<Leader>nfl', "<cmd>Telescope neorg find_linkable<CR>", { noremap = true, silent = true })

-- Open Index
vim.api.nvim_set_keymap('n', '<Leader>ni', "<cmd>Neorg index<CR>", { noremap = true, silent = true })

-- Open Index in split
-- set split to right
vim.o.splitright = true
vim.api.nvim_set_keymap('n', '<Leader>nsi', ":OpenIndex<CR>", { noremap = true, silent = true })
vim.api.nvim_create_user_command('OpenIndex', function()
  vim.cmd('vsplit')
  vim.cmd('Neorg index')
end, {})

----------------------------------------
-- Todo
----------------------------------------
-- Toggle Important 
vim.api.nvim_set_keymap('n', '<Leader>ti', ":Neorg command todo important<CR>", { noremap = true, silent = true })

-- Toggle Done
vim.api.nvim_set_keymap('n', '<Leader>td', ":Neorg command todo done<CR>", { noremap = true, silent = true })

-- Toggle Hold 
vim.api.nvim_set_keymap('n', '<Leader>th', ":Neorg command todo hold<CR>", { noremap = true, silent = true })

-- Toggle Canceled 
vim.api.nvim_set_keymap('n', '<Leader>tc', ":Neorg command todo cancel<CR>", { noremap = true, silent = true })

-- Toggle Uncertain
-- Todo implement
-- vim.api.nvim_set_keymap('n', '<Leader>tu', ":Neorg command todo uncertain<CR>", { noremap = true, silent = true })

-- Fix for link rendering issue with conceallevel
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3"
})
