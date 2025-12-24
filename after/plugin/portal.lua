if true then
	vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
	vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")
	vim.keymap.set("n", "<leader><leader>o", "<cmd>Portal changelist backward<cr>")
	vim.keymap.set("n", "<leader><leader>i", "<cmd>Portal changelist forward<cr>")
end
