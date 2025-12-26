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

	map("n", "<leader>;", dap.continue)
	map("n", "<leader>.", dap.run_to_cursor)
	map("n", "<leader>]", dap.step_over)
	map("n", "<leader>[", dap.step_into)
	map("n", "<leader><BS>", dap.step_out)
	map("n", "<leader>B", dap.toggle_breakpoint)
	map("n", "<Leader>dB", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end)
	map("n", "<leader>de", function()
		dap.repl.open()
	end)

	map("n", "<leader>?", function()
		dapui.eval(nil, { enter = false })
	end)
	map("n", "<leader>do", function()
		dapui.toggle()
	end)
	map("n", "<Leader>dus", function()
		dapui.toggle({ layout = 1 })
	end)
	map("n", "<Leader>dut", function()
		dapui.toggle({ layout = 2 })
	end)
	map("n", "<Leader>dB", set_conditional_breakpoint)

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

	require("dapui").setup({
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.7 },
					{ id = "watches", size = 0.3 },
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

	vim.fn.sign_define("DapStopped", {
		text = "\u{ea9c}",
		texthl = "DapStoppedNumHl",
		linehl = "DapStopped",
		numhl = "DapStopped",
	})
end
