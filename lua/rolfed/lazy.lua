local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },
    {
        'rose-pine/neovim', as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},

        },
    },
    {
        "kylechui/nvim-surround",
    },
    --{
        --	'kevinhwang91/nvim-ufo',
        --	dependecies = 'kevinhwang91/promise-async'
        --},
        {
            'michaelb/sniprun',
            run = 'sh ./install.sh',
            config = function()
                require('sniprun').setup()
            end
        },
        {
            'folke/noice.nvim',
            events = "VeryLazy",
            opts = {
                routes = {
                    filter = { event = "notify", find = "No Information Available" },
                    opts = { skip = true }
                },
                presets = {
                    lsp_doc_border = true
                }
            },
            dependencies = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            }
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
        },
        {
            "nvim-neorg/neorg",
            build = ":Neorg sync-parsers",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require('neorg').setup {
                    -- Your Neorg configuration here
                    load = {
                        ["core.defaults"] = {}, -- Loads default modules
                        ["core.dirman"] = { -- Manage Neorg workspaces
                            config = {
                                workspaces = {
                                    work = "~/repos/notes/work",
                                    learning = "~/repos/notes/learning",
                                    ojjlab = "~/repos/notes/learning",
                                },
                                default_workspace = "work",
                            },
                        },
                        ["core.journal"] = {
                            config = {
                                journal_folder = "journal",
                                template_name = "template.norg",
                                use_template = true,
                                workspace = "work",
                                strategy = "flat",
                            }
                        },
                        ["core.concealer"] = {}, -- Allows for use of icons
                        ["core.presenter"] = {
                            config = {
                                zen_mode = "zen-mode",
                            }
                        },
                        ["core.ui"] = {},
                        ["core.qol.toc"] = {
                            config = {
                                close_after_use = true,
                                sync_cursurline = true,
                            }
                        },
                        ["core.summary"] = {
                            config = {
                                strategy = "default",
                            }
                        },

                        -- Dependencies
                        ["core.integrations.telescope"] = {},
                        ["core.integrations.treesitter"] = {},
                        ["core.autocommands"] = {},
                        ["core.esupports.hop"] = {},
                        ["core.esupports.metagen"] = {},
                        ["core.mode"] = {},
                        ["core.queries.native"] = {},
                        ["core.ui.calendar"] = {},
                    },
                }
            end,
            run = ":Neorg sync-parsers",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-neorg/neorg-telescope"
            }  -- You need the plenary library for this plugin
        },
        "nvim-neorg/neorg",
        "folke/trouble.nvim",
        'nvim-treesitter/playground',
        'theprimeagen/harpoon',
        'mbbill/undotree',
        'tpope/vim-fugitive',
        'christoomey/vim-tmux-navigator',
        'lewis6991/gitsigns.nvim',
        'folke/zen-mode.nvim',

    };
    local opts = {};

    require("lazy").setup(plugins, opts)

