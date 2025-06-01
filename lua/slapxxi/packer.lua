-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Parser
	use("nvim-treesitter/nvim-treesitter", { run = "TSUpdate" })
	use("nvim-treesitter/playground")

	-- LSP
	use("neovim/nvim-lspconfig")

	-- Autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp-signature-help")

	-- Snippets
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-vsnip")
	use("rafamadriz/friendly-snippets")
	use("kcsuraj/typescript-snippets")

	-- Eslint
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/eslint.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8", -- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-treesitter/nvim-treesitter-context")

	use("mbbill/undotree")

	use("tpope/vim-fugitive")
	use("tpope/vim-surround")

	-- use("elihunter173/dirbuf.nvim")
	use("chentoast/marks.nvim")
	use("lewis6991/gitsigns.nvim")
	use("stevearc/conform.nvim")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")

	use("luckasRanarison/tailwind-tools.nvim")
	use("onsails/lspkind-nvim")

	use("stevearc/dressing.nvim")
	use("MunifTanjim/nui.nvim")
	use("MeanderingProgrammer/render-markdown.nvim")

	use("nvim-tree/nvim-web-devicons") -- or use 'echasnovski/mini.icons'
	use("HakonHarnes/img-clip.nvim")

	use("stevearc/oil.nvim")

	use("nvim-tree/nvim-tree.lua")

	use({
		"OlegGulevskyy/better-ts-errors.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})

	use({
		"Shatur/neovim-session-manager",
		config = function()
			local config = require("session_manager.config")
			require("session_manager").setup({
				autoload_mode = { config.AutoloadMode.CurrentDir, config.AutoloadMode.LastSession },
			})
		end,
	})

	use("mason-org/mason.nvim")
	use("mfussenegger/nvim-dap")
	use("jay-babu/mason-nvim-dap.nvim")
	-- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

	use("github/copilot.vim")

	use("jake-stewart/multicursor.nvim")

	-- use({ "frankroeder/parrot.nvim", requires = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" } })

	-- use({
	-- 	"Exafunction/windsurf.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function()
	-- 		require("codeium").setup({
	-- 			virtual_text = {
	-- 				enabled = true,
	-- 				manual = false,
	-- 				default_filetype_enabled = true,
	-- 				-- key_bindings = { clear = "" },
	-- 			},
	-- 			enable_cmp_source = false,
	-- 		})
	-- 	end,
	-- })
end)
