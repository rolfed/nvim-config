require('sniprun').setup({
    selected_interpreters = {}, -- Keep empty to use all that are appropriate
    repl_enable = {},           -- Enable REPL-like behavior for these interpreters
    repl_disable = {},          -- Disable REPL-like behavior for these interpreters
    -- Example: Add or remove specific language support
    interpreter_options = {
        Golang = {
            go_path = '/opt/homebrew/bin/go', -- Specify path to Go if necessary
        },
        JS_original = {
          interpreter_path = os.getenv("NODE_PATH"), -- Specify the path to your Node.js binary
          -- Add any Node-specific options here
        },
    },
})

vim.api.nvim_set_keymap('v', '<C-x>e', '<Plug>SnipRun', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>SnipRunOperator', {silent = true})
vim.api.nvim_set_keymap('n', '<C-x>e', '<Plug>SnipRun', {silent = true})
