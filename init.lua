require("slapxxi")
require("themes/blueberry")

local api = vim.api

-- Helper to get a single character from user input (like getchar())
local function getchar()
	local char = vim.fn.getchar()
	if type(char) == "number" then
		return vim.fn.nr2char(char)
	else
		return char
	end
end

-- Insert register content with paste mode temporarily enabled
_G.paste_register_no_indent = function()
	-- Disable indent options temporarily
	local old_ai = vim.o.autoindent
	local old_si = vim.o.smartindent
	local old_ci = vim.o.cindent

	vim.o.autoindent = false
	vim.o.smartindent = false
	vim.o.cindent = false

	-- Get next char for register name
	local reg = getchar()

	-- Get register content
	local reg_content = vim.fn.getreg(reg)

	-- Insert register content literally at cursor position
	-- Use nvim_put to insert literally without triggering indent
	api.nvim_put(vim.split(reg_content, "\n"), "c", true, true)

	-- Restore indent options
	vim.o.autoindent = old_ai
	vim.o.smartindent = old_si
	vim.o.cindent = old_ci
end

-- Map <C-r> in insert mode to call our function
api.nvim_set_keymap("i", "<C-r>", "<C-o>:lua paste_register_no_indent()<CR>", { noremap = true, silent = true })
