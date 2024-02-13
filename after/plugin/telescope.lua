local builtin = require('telescope.builtin')
-- project files
vim.keymap.set('n', '<C-s>f', builtin.find_files, {})
-- git specific files
vim.keymap.set('n', '<C-s>g', builtin.git_files, {})
-- find buffers
vim.keymap.set('n', '<C-s>b', builtin.buffers, {})
-- grep search telecscope
vim.keymap.set("n", "<C-s>g", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- search help tags
vim.keymap.set('n', '<C-h>', builtin.help_tags, {})

vim.api.nvim_create_user_command('OpenGitFilesInVSplit', function()
    vim.cmd('vsplit')                        -- Split the view vertically
    require('telescope.builtin').git_files() -- Open Telescope to search Git files
end, { nargs = 0 })
vim.api.nvim_set_keymap('n', '<C-w>f', ':OpenGitFilesInVSplit<CR>', { noremap = true, silent = true })
