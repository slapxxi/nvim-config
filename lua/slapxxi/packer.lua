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

	-- Snippets
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-vsnip")
	use("rafamadriz/friendly-snippets")

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

	-- using packer.nvim
	-- use({
	-- 	"akinsho/bufferline.nvim",
	-- 	tag = "*",
	-- 	requires = "nvim-tree/nvim-web-devicons",
	-- 	cond = function()
	-- 		return false
	-- 	end,
	-- })
	--
	use("nvim-treesitter/nvim-treesitter-context")

	use("mbbill/undotree")

	use("tpope/vim-fugitive")
	use("tpope/vim-surround")

	use("zbirenbaum/copilot.lua")
	use("elihunter173/dirbuf.nvim")
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

	-- use({
	-- 	"natecraddock/sessions.nvim",
	-- 	config = function()
	-- 		require("sessions").setup({})
	-- 	end,
	-- })

	-- use({
	-- 	"rmagatti/auto-session",
	-- 	config = function()
	-- 		require("auto-session").setup({
	-- 			suppressed_dirs = nil,
	-- 			-- suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	-- 		})
	-- 	end,
	-- })

	-- use({ "frankroeder/parrot.nvim", requires = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" } })

	use({
		"Exafunction/windsurf.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
				virtual_text = { enabled = true, default_filetype_enabled = true, key_bindings = { clear = "<Esc>" } },

				enable_cmp_source = false,
			})
		end,
	})

	-- use("nvim-tree/nvim-tree.lua")
	-- use("stevearc/oil.nvim")

	-- temp disable example
	-- use({
	-- 	"romgrk/nvim-treesitter-context",
	-- 	cond = function()
	-- 		return false
	-- 	end,
	-- })
end)
