-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Mason
	use({ "mason-org/mason.nvim" })

	-- Parser
	use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" })
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- LSP
	use({ "neovim/nvim-lspconfig" })
	use({ "onsails/lspkind-nvim" })

	-- Autocomplete
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

	-- Snippets
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Lint
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
	})
	use({ "nvim-telescope/telescope-frecency.nvim" })

	-- Formatting
	use({ "stevearc/conform.nvim" })

	-- Filetrees
	use({ "stevearc/oil.nvim" })
	use({ "nvim-tree/nvim-tree.lua" })
	use({ "mikavilpas/yazi.nvim" })

	-- Session Management
	use({
		"stevearc/resession.nvim",
		config = function()
			require("resession").setup()
		end,
	})

	-- tpope
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-unimpaired" })

	-- Harpoon
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Quality of Life
	use({ "chentoast/marks.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "numToStr/Comment.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "jake-stewart/multicursor.nvim" })
	use({ "kevinhwang91/nvim-bqf" })
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	use({ "kevinhwang91/nvim-hlslens" })

	-- Appearance
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "nvim-tree/nvim-web-devicons" }) -- or use 'echasnovski/mini.icons'
	use({ "MunifTanjim/nui.nvim" })
	use({ "stevearc/dressing.nvim" })

	-- Tools
	use({ "MunifTanjim/eslint.nvim" })
	use({ "luckasRanarison/tailwind-tools.nvim" })
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
	use({
		"OlegGulevskyy/better-ts-errors.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})

	-- AI
	use({
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	})
end)
