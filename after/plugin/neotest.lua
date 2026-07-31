if true then
	local config = {
		runner = "gotestsum", -- Optional, but recommended
	}

	local neotest = require("neotest")

	neotest.setup({
		adapters = {
			require("neotest-golang")(config),
		},
	})

	-- Run tests
	vim.keymap.set("n", "<leader>tn", function()
		neotest.run.run()
	end, { desc = "Test: Run Nearest" })

	vim.keymap.set("n", "<leader>tf", function()
		neotest.run.run(vim.fn.expand("%"))
	end, { desc = "Test: Run File" })

	vim.keymap.set("n", "<leader>ts", function()
		neotest.run.run({ suite = true })
	end, { desc = "Test: Run Suite" })

	vim.keymap.set("n", "<leader>tl", function()
		neotest.run.run_last()
	end, { desc = "Test: Run Last" })

	-- Debug tests (requires nvim-dap)
	vim.keymap.set("n", "<leader>td", function()
		neotest.run.run({ strategy = "dap" })
	end, { desc = "Test: Debug Nearest" })

	-- UI and Output Navigation
	vim.keymap.set("n", "<leader>to", function()
		neotest.output.open({ enter = true })
	end, { desc = "Test: Open Output Hover" })
	vim.keymap.set("n", "<leader>tO", function()
		neotest.output_panel.toggle()
	end, { desc = "Test: Toggle Output Panel" })
	vim.keymap.set("n", "<leader>ts", function()
		neotest.summary.toggle()
	end, { desc = "Test: Toggle Summary Panel" })

	-- Diagnostic Jump Mappings
	vim.keymap.set("n", "[T", function()
		neotest.jump.prev({ status = "failed" })
	end, { desc = "Test: Go to Prev Failed" })
	vim.keymap.set("n", "]T", function()
		neotest.jump.next({ status = "failed" })
	end, { desc = "Test: Go to Next Failed" })

	-- Stop tests
	vim.keymap.set("n", "<leader>tx", function()
		neotest.run.stop()
	end, { desc = "Test: Stop Nearest" })
end
