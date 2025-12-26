if true then
	local dap = require("dap")
	local dapui = require("dapui")
	local widgets = require("dap.ui.widgets")

	vim.keymap.set("n", "<leader>;", dap.continue)
	vim.keymap.set("n", "<leader>.", dap.run_to_cursor)
	vim.keymap.set("n", "<leader>]", dap.step_over)
	vim.keymap.set("n", "<leader>[", dap.step_into)
	vim.keymap.set("n", "<leader><BS>", dap.step_out)
	vim.keymap.set("n", "<leader>B", dap.toggle_breakpoint)

	vim.keymap.set("n", "<leader>?", function()
		dapui.eval(nil, { enter = false })
	end)

	vim.keymap.set("n", "<leader>do", function()
		dapui.toggle()
	end)

	vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
		widgets.hover()
	end)

	vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
		widgets.preview()
	end)

	vim.keymap.set("n", "<Leader>df", function()
		widgets.centered_float(widgets.frames)
	end)

	vim.keymap.set("n", "<Leader>ds", function()
		widgets.centered_float(widgets.scopes)
	end)

	vim.fn.sign_define("DapBreakpoint", {
		text = "•",
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	})

	vim.fn.sign_define("DapStopped", {
		text = "\u{ea9c}",
		texthl = "DapStoppedNumHl",
		linehl = "DapStopped",
		numhl = "DapStopped",
	})

	require("dapui").setup()
	require("dap-go").setup()
	require("nvim-dap-virtual-text").setup()
end
