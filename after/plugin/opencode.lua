vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode" })

vim.keymap.set({ "n", "x" }, "<leader>cx", function()
	require("opencode").select()
end, { desc = "Execute opencode action…" })

vim.keymap.set({ "n", "t" }, "<leader>cc", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "<leader>car", function()
	return require("opencode").operator("@this ")
end, { expr = true, desc = "Add range to opencode" })

vim.keymap.set("n", "<leader>cal", function()
	return require("opencode").operator("@this ") .. "_"
end, { expr = true, desc = "Add line to opencode" })

vim.keymap.set("n", "<leader>cu", function()
	require("opencode").command("session.half.page.up")
end, { desc = "opencode half page up" })

vim.keymap.set("n", "<leader>cd", function()
	require("opencode").command("session.half.page.down")
end, { desc = "opencode half page down" })
