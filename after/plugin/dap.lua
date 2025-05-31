local dap = require("dap")

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)

vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)

vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)

vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)

vim.keymap.set("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<Leader>dB", function()
	require("dap").set_breakpoint()
end)

vim.keymap.set("n", "<Leader>dlp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)

vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)

vim.keymap.set({ "n", "v" }, "<leader>dh", function()
	require("dap.ui.widgets").hover()
end)

vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)

vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)

vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

-- dap.adapters.chrome = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
-- }
--
-- dap.configurations.javascriptreact = {
-- 	{
-- 		type = "chrome",
-- 		request = "attach",
-- 		name = "Attach to Chrome",
-- 		port = 9222,
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		cwd = vim.fn.getcwd(),
-- 		webRoot = "${workspaceFolder}",
-- 	},
-- }
--
-- dap.configurations.typescriptreact = {
-- 	{
-- 		type = "chrome",
-- 		request = "attach",
-- 		name = "Attach to Chrome",
-- 		port = 9222,
-- 		webRoot = "${workspaceFolder}",
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		cwd = vim.fn.getcwd(),
-- 	},
-- }
--

-- dap.configurations.typescriptreact = { -- change to typescript if needed
-- 	{
-- 		name = "Chrome: Debug",
-- 		type = "chrome",
-- 		request = "attach",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		port = 9222,
-- 		webRoot = "${workspaceFolder}",
-- 	},
-- }
