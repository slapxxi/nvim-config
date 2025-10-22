local builtin = require("telescope.builtin")

local find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }

vim.keymap.set("n", "<C-p>", function()
	require("telescope.builtin").find_files({
		find_command = find_command,
	})
end, { desc = "Go to file (includes ignored)" })

vim.keymap.set("n", "<leader>ff", function()
	local opts = require("telescope.themes").get_ivy({})
	require("telescope.builtin").find_files(opts)
end, { desc = "Go to file (includes ignored)" })

vim.keymap.set("n", "<leader>fl", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fr", builtin.resume, {})
vim.keymap.set("n", "<leader>fm", builtin.marks, {})

vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})

vim.keymap.set("n", "<leader>fg", builtin.git_files)
vim.keymap.set("n", "<leader>fc", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>ft", builtin.git_status, {})

-- vim.keymap.set("n", "<leader>fh", builtin.help_tags)

require("telescope").load_extension("fzf")

require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true, --[[ theme = "ivy" ]]
		},
	},
	extensions = { fzf = {} },
	defaults = {
		sorting_strategy = "ascending", -- display results top->bottom
		layout_config = {
			prompt_position = "top", -- search bar at the top
		},
		mappings = {
			n = {
				-- ["<M-b>"] = require("telescope.actions").preview_scrolling_up,
				-- ["<M-f>"] = require("telescope.actions").preview_scrolling_down,
				["<M-d>"] = require("telescope.actions").delete_buffer,
			},
			i = {
				["<M-d>"] = require("telescope.actions").delete_buffer,
			},
		},
	},
})
