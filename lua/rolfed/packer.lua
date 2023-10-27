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
        }

        use({ 'rose-pine/neovim', as = 'rose-pine', config = function()
            vim.cmd('colorscheme rose-pine')
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
						{'neovim/nvim-lspconfig'},             -- Required
						{	'williamboman/mason.nvim',           -- Optional
										run = function()
														pcall(vim.cmd, 'MasonUpdate')
										end,
						},
						{'williamboman/mason-lspconfig.nvim'}, -- Optional

						-- Autocompletion
						{'hrsh7th/nvim-cmp'},     -- Required
						{'hrsh7th/cmp-nvim-lsp'}, -- Required
						{'L3MON4D3/LuaSnip'},     -- Required
						{'rafamadriz/friendly-snippets'},
				}
		}

		-- Better Escape

		use { "max397574/better-escape.nvim",
				config = function()
						require("better_escape").setup()
				end,
		}

		-- Surround Plugin
		use({ "kylechui/nvim-surround", tag = "*" })
end)
