if true then
	local remap = vim.keymap.set

	remap("n", "<leader>a", "<cmd>Grapple tag<CR>")
	remap("n", "<leader>e", "<cmd>Grapple toggle_tags<CR>")
	remap("n", "<leader>D", "<cmd>Grapple untag<CR>")

	remap("n", "<s-m-h>", "<cmd>Grapple cycle_tags prev<CR>")
	remap("n", "<s-m-l>", "<cmd>Grapple cycle_tags next<CR>")

	remap("n", "<c-j>", "<cmd>Grapple select index=1<CR>")
	remap("n", "<c-k>", "<cmd>Grapple select index=2<CR>")
	remap("n", "<c-l>", "<cmd>Grapple select index=3<CR>")
	remap("n", "<c-h>", "<cmd>Grapple select index=4<CR>")
	remap("n", "<c-;>", "<cmd>Grapple select index=5<CR>")
	remap("n", "<c-'>", "<cmd>Grapple select index=6<CR>")

	remap("n", "<M-j>", "<cmd>Grapple select index=1 scope=git<CR>")
	remap("n", "<M-k>", "<cmd>Grapple select index=2 scope=git<CR>")
	remap("n", "<M-l>", "<cmd>Grapple select index=3 scope=git<CR>")
	remap("n", "<M-h>", "<cmd>Grapple select index=4 scope=git<CR>")
	remap("n", "<M-;>", "<cmd>Grapple select index=5 scope=git<CR>")
	remap("n", "<M-'>", "<cmd>Grapple select index=6 scope=git<CR>")

	require("telescope").load_extension("grapple")
	remap("n", "<leader>fh", "<cmd>Telescope grapple tags<CR>")

	require("grapple").setup({
		scope = "cwd",
		win_opts = {
			relative = "editor",
		},
	})
end
