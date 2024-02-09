return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'},
            { "nvim-telescope/telescope-live-grep-args.nvim" }
        },
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
    }

    use({ 'rose-pine/neovim', as = 'rose-pine', config = function()
        vim.cmd('colorscheme rose-pine')
    end
})

use({
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = true,
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
})

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('theprimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
use('christoomey/vim-tmux-navigator')

-- LSP ZERO
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},

    },
}

-- Better Escape

use {
    "max397574/better-escape.nvim",
    config = function()
        require("better_escape").setup()
    end,
}

-- Surround Plugin
use({ "kylechui/nvim-surround", tag = "*" })

-- Code Folding Utility
use ({'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'})

-- Git Signs
use ('lewis6991/gitsigns.nvim')

-- copilot
use("github/copilot.vim")

-- Sniprun
use ({ 'michaelb/sniprun',
run = 'sh ./install.sh',
config = function()
    require('sniprun').setup()
end
})

-- Neorg
use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            -- Your Neorg configuration here
            load = {
                ["core.defaults"] = {}, -- Loads default modules
                ["core.concealer"] = {}, -- Allows for use of icons
                ["core.dirman"] = { -- Manage Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/repos/notes",
                    },
                },
            },
        },
    }
end,
run = ":Neorg sync-parsers",
requires = "nvim-lua/plenary.nvim"  -- You need the plenary library for this plugin
}

end)
