local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()

vim.keymap.set("n", "<leader>dc", function()
	require("dap").run_to_cursor()
end)

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

vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint()
end)

vim.keymap.set("n", "<leader>dlp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end)

vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end)

vim.keymap.set({ "n", "v" }, "<leader>?", function()
	require("dapui").eval(nil, { enter = true })
end)

-- dap hover
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
	require("dap.ui.widgets").hover()
end)

-- dap preview
vim.keymap.set({ "n", "v" }, "<leader>dp", function()
	require("dap.ui.widgets").preview()
end)

-- dap float
vim.keymap.set("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)

-- dap scopes
vim.keymap.set("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
	all_references = false, -- show virtual text on all all references of the variable (not only definitions)
	clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
	-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
	virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

	-- experimental features:
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

dap.adapters.node = {
	type = "executable",
	command = "node",
	args = { mason_path .. "packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { mason_path .. "packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

dap.configurations.typescript = {
	{
		name = "Launch Node",
		type = "node",
		request = "launch",
		runtimeArgs = { "-r", "ts-node/register" },
		runtimeExecutable = "node",
		args = { "--inspect", "${file}" },
		skipFiles = { "node_modules/**" },
		console = "integratedTerminal",
	},
	{
		name = "Attach Chrome",
		type = "chrome",
		request = "attach",
		-- program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}/src",
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
}

dap.configurations.typescriptreact = {
	{
		name = "Attach Chrome",
		type = "chrome",
		request = "attach",
		-- program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}
