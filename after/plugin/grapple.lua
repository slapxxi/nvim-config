if true then
	local remap = vim.keymap.set

	remap("n", "<leader>a", "<cmd>Grapple tag<CR>")
	remap("n", "<leader>e", "<cmd>Grapple toggle_tags<CR>")
	remap("n", "<leader>d", "<cmd>Grapple untag<CR>")

	remap("n", "<leader>k", "<cmd>Grapple cycle_tags prev<CR>")
	remap("n", "<leader>j", "<cmd>Grapple cycle_tags next<CR>")

	remap("n", "<c-j>", "<cmd>Grapple select index=1<CR>")
	remap("n", "<c-k>", "<cmd>Grapple select index=2<CR>")
	remap("n", "<c-l>", "<cmd>Grapple select index=3<CR>")
	remap("n", "<c-h>", "<cmd>Grapple select index=4<CR>")
	remap("n", "<c-;>", "<cmd>Grapple select index=5<CR>")
	remap("n", "<c-'>", "<cmd>Grapple select index=6<CR>")

	remap("n", "<m-nl>", "<cmd>Grapple select index=7<CR>")
	remap("n", "<m-c-k>", "<cmd>Grapple select index=8<CR>")
	remap("n", "<m-c-l>", "<cmd>Grapple select index=9<CR>")
	remap("n", "<m-c-h>", "<cmd>Grapple select index=10<CR>")
	remap("n", "<m-c-;>", "<cmd>Grapple select index=11<CR>")
	remap("n", "<m-c-'>", "<cmd>Grapple select index=12<CR>")

	require("grapple").setup({})
end
