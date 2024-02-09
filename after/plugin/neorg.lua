-- Keybinding for fuzzy searching Neorg notes
vim.api.nvim_set_keymap('n', '<Leader>nf', "<cmd>Telescope neorg find_norg_files<CR>", { noremap = true, silent = true })

-- Finding tasks
vim.api.nvim_set_keymap('n', '<Leader>nfl', "<cmd>Telescope neorg find_linkable<CR>", { noremap = true, silent = true })

-- Open Index
vim.api.nvim_set_keymap('n', '<Leader>noi', "<cmd>Neorg index<CR>", { noremap = true, silent = true })

-- Open Index in split
-- set split to right
vim.o.splitright = true
vim.api.nvim_set_keymap('n', '<Leader>ni', ":OpenIndex<CR>", { noremap = true, silent = true })
vim.api.nvim_create_user_command('OpenIndex', function()
  vim.cmd('vsplit')
  vim.cmd('Neorg index')
end, {})

