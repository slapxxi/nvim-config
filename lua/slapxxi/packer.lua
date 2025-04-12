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
	use("catgoose/nvim-colorizer.lua")
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
			require("avante").setup()
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
