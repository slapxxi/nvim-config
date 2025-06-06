-- vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
-- 	expr = true,
-- 	replace_keycodes = false,
-- })
-- vim.g.copilot_no_tab_map = true

-- vim.keymap.set("i", "<C-f>", "<Plug>(copilot-accept-word)")

vim.keymap.set("n", "<leader><leader>", ":Copilot disable<CR>")

if false then
	vim.keymap.set("i", "<C-c>", "<Plug>(copilot-dismiss)<C-c>")
	vim.keymap.set("i", "<C-j>", "<Plug>(copilot-suggest)")
end

if false then
	require("copilot").setup({
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = false,
			accept_mappings = true,
			debounce = 25,
			keymap = {
				accept = "<Tab>",
				accept_word = false,
				accept_line = "<M-l>",
				next = false,
				prev = false,
				dismiss = false,
			},
		},
	})
end
