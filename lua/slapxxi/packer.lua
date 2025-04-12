-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = "TSUpdate" })
	use("nvim-treesitter/playground")

	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

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
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
		cond = function()
			return true
		end,
	})

	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")
	use("zbirenbaum/copilot.lua")
	use("elihunter173/dirbuf.nvim")
	use("chentoast/marks.nvim")
	use("nvim-treesitter/nvim-treesitter-context")
	use("lewis6991/gitsigns.nvim")
	use("stevearc/conform.nvim")
	-- use("catgoose/nvim-colorizer.lua")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")
	use("luckasRanarison/tailwind-tools.nvim")

	-- AVANTE
	-- Required plugins
	use("stevearc/dressing.nvim")
	use("MunifTanjim/nui.nvim")
	use("MeanderingProgrammer/render-markdown.nvim")

	-- Optional dependencies
	use("nvim-tree/nvim-web-devicons") -- or use 'echasnovski/mini.icons'
	use("HakonHarnes/img-clip.nvim")

	-- Avante.nvim with build process
	use({
		"yetone/avante.nvim",
		branch = "main",
		run = "make",
		config = function()
			require("avante").setup({
				opts = {
					-- provider = "openai",
					provider = "groq",
					openai = {
						endpoint = "https://api.openai.com/v1",
						model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
						timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
						temperature = 0,
						max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
						--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
					},
					vendors = {
						groq = {
							__inherited_from = "openai",
							api_key_name = "GROQ_API_KEY",
							endpoint = "https://api.groq.com/openai/v1/",
							model = "llama-3.1-70b-versatile",
						},
					},
				},
			})
		end,
	})

	use({
		"OlegGulevskyy/better-ts-errors.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})
	--use("mattn/emmet-vim")

	-- use 'nvim-tree/nvim-tree.lua'

	-- use 'stevearc/oil.nvim'

	-- temp disable
	-- use {'romgrk/nvim-treesitter-context', cond = function() return false end}
end)
