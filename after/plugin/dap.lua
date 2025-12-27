if true then
	local dap = require("dap")
	local dapui = require("dapui")
	local widgets = require("dap.ui.widgets")
	local map = vim.keymap.set
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event

	local function set_conditional_breakpoint()
		local input = Input({
			position = { row = 0.2, col = 0.5 },
			size = { width = 40 },
			border = { style = "rounded", text = { top = " Breakpoint Condition ", top_align = "center" } },
			win_options = { winhighlight = "Normal:Normal,FloatBorder:Normal" },
		}, {
			prompt = "> ",
			on_submit = function(value)
				if value ~= "" then
					require("dap").set_breakpoint(value)
				end
			end,
		})

		input:mount()
		input:on(event.BufLeave, function()
			input:unmount()
		end)
	end

	-- navigation
	map("n", "<leader>;", dap.continue)
	map("n", "<leader>.", dap.run_to_cursor)
	map("n", "<leader>j", dap.step_over)
	map("n", "<leader>l", dap.step_into)
	map("n", "<leader>k", dap.step_back)
	map("n", "<leader>h", dap.step_out)
	map("n", "<leader>u", dap.up)
	map("n", "<leader>d", dap.down)

	--breakpoints
	map("n", "<leader>B", dap.toggle_breakpoint)
	map("n", "<leader>dc", dap.clear_breakpoints)
	map("n", "<leader>db", set_conditional_breakpoint)

	-- process
	map("n", "<leader>dT", dap.terminate)
	map("n", "<leader>dR", dap.restart)
	map("n", "<leader>dP", dap.pause)
	map("n", "<leader>dL", dap.run_last)
	map("n", "<leader>dD", dap.disconnect)

	map("n", "<leader>dE", function()
		dap.repl.open()
	end)

	map({ "n", "v" }, "<leader>?", function()
		dapui.eval(nil, { enter = true })
	end)
	map("n", "<leader>do", function()
		dapui.toggle({ reset = true })
	end)
	map("n", "<Leader>dus", function()
		dapui.toggle({ layout = 1 })
	end)
	map("n", "<Leader>dut", function()
		dapui.toggle({ layout = 2 })
	end)

	map({ "n", "v" }, "<Leader>dh", function()
		widgets.hover()
	end)
	map({ "n", "v" }, "<Leader>dp", function()
		widgets.preview()
	end)
	map("n", "<Leader>df", function()
		widgets.centered_float(widgets.frames)
	end)
	map("n", "<Leader>ds", function()
		widgets.centered_float(widgets.scopes)
	end)
	map({ "n", "v" }, "<Leader>de", function()
		widgets.centered_float(widgets.expression)
	end)
	map("n", "<Leader>dt", function()
		widgets.centered_float(widgets.threads)
	end)

	require("dapui").setup({
		layouts = {
			{
				elements = {
					{ id = "breakpoints", size = 0.2 },
					{ id = "scopes", size = 0.6 },
					{ id = "watches", size = 0.2 },
				},
				position = "left",
				size = 40,
			},
			{
				elements = {
					{ id = "repl", size = 1.0 },
				},
				position = "bottom",
				size = 10,
			},
		},
	})

	require("dap-go").setup()
	require("nvim-dap-virtual-text").setup()

	vim.fn.sign_define("DapBreakpoint", {
		text = "•",
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	})

	vim.fn.sign_define("DapBreakpointCondition", {
		text = "•",
		texthl = "DapBreakpointCondition",
		linehl = "",
		numhl = "",
	})

	vim.fn.sign_define("DapStopped", {
		text = "\u{ea9c}",
		texthl = "DapStoppedNumHl",
		linehl = "DapStopped",
		numhl = "DapStopped",
	})
end
