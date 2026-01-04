if true then
	vim.keymap.set("n", "<leader>sp", ":Gitsigns prev_hunk<CR>")
	vim.keymap.set("n", "<leader>sn", ":Gitsigns next_hunk<CR>")

	require("gitsigns").setup({
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		sign_priority = 10,
	})
end
