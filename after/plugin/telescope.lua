local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files)

vim.keymap.set("n", "<leader>pg", builtin.git_files)
vim.keymap.set("n", "<leader>pp", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>pr", builtin.resume, {})

require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending", -- display results top->bottom
		layout_config = {
			prompt_position = "top", -- search bar at the top
		},
		mappings = {
			n = {
				["<M-b>"] = require("telescope.actions").preview_scrolling_up,
				["<M-f>"] = require("telescope.actions").preview_scrolling_down,
			},
		},
	},
})
