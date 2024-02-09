-- Keybinding for fuzzy searching Neorg notes
vim.api.nvim_set_keymap('n', '<Leader>fn', "<cmd>Telescope neorg<CR>", { noremap = true, silent = true })

-- Keybinding for inserting a link to another Neorg note
-- As of my last update, there isn't a direct `neorg-telescope` command to insert links via Telescope,
-- so you might need to use Neorg's link insertion functionality or create a custom function
-- that leverages Telescope for selecting a note and then inserting a link to it.

-- Additional useful keybindings might include:
-- Finding tasks
vim.api.nvim_set_keymap('n', '<Leader>fl', "<cmd>Telescope neorg find_linkable<CR>", { noremap = true, silent = true })
