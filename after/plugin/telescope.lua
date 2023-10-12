local builtin = require('telescope.builtin')
-- project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- git specific files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- grep search-- grep search-- grep search-- grep search-- grep search-- grep search-- grep search-- grep search
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- grep search telecscope
vim.keymap.set("n", "<leader>pg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- search help tags
vim.keymap.set('n', '<C-h>', builtin.help_tags, {})
