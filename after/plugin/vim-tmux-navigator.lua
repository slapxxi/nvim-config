if true then
	vim.g.tmux_navigator_no_mappings = 1
	vim.g.tmux_navigator_disable_when_zoomed = 1

	local opts = { silent = true }

	vim.keymap.set("n", "<M-h>", ":<C-U>TmuxNavigateLeft<CR>", opts)
	vim.keymap.set("n", "<M-j>", ":<C-U>TmuxNavigateDown<CR>", opts)
	vim.keymap.set("n", "<M-k>", ":<C-U>TmuxNavigateUp<CR>", opts)
	vim.keymap.set("n", "<M-l>", ":<C-U>TmuxNavigateRight<CR>", opts)
	vim.keymap.set("n", "<M-\\", ":<C-U>TmuxNavigatePrevious<CR>", opts)
end
