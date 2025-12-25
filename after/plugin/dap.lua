if true then
	local dap = require("dap")
	local dapui = require("dapui")

	vim.keymap.set("n", "<F5>", dap.continue)
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

	vim.fn.sign_define("DapBreakpoint", {
		text = "•",
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	})

	vim.fn.sign_define("DapStopped", {
		text = "  ", -- An arrow icon (requires Nerd Font)
		texthl = "DapStopped", -- Color for the icon
		linehl = "DapStopped", -- Background color for the entire line
		numhl = "DapStopped", -- Color for the line number
	})

	require("dapui").setup()
	require("dap-go").setup()
	require("nvim-dap-virtual-text").setup()
end
