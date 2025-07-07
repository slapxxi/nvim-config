require("slapxxi")
require("themes/blueberry")

local function disable_relative_number_temporarily(duration_ms)
	-- Save current state
	local relnum = vim.wo.relativenumber

	-- Disable relative number
	vim.wo.relativenumber = false

	-- Restore after duration (in milliseconds)
	if relnum then
		vim.defer_fn(function()
			-- Ensure buffer and window are still valid
			if vim.api.nvim_win_is_valid(0) then
				vim.wo.relativenumber = true
			end
		end, duration_ms)
	end
end

vim.keymap.set("n", "<leader>rn", function()
	disable_relative_number_temporarily(1000)
end, { desc = "Disable relative number for 1 second" })
