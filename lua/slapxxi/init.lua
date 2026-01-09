require("slapxxi.packer")
require("slapxxi.remap")
require("slapxxi.set")
require("slapxxi.snippets")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local automarkGroup = augroup("automark", { clear = true })
local yank_group = augroup("yank_group", {})

-- mark with I mark when leaving insert mode via Esc key. doesnt work  with <C-c>
-- autocmd("InsertLeave", { group = automarkGroup, pattern = "*", command = "normal! mI" })

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 50,
		})
	end,
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = { "*.css", "*.scss" },
	command = "normal! mC",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = "*.html",
	command = "normal! mH",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = { "*.js", "*.ts" },
	command = "normal! mJ",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = { "*.jsx", "*.tsx" },
	command = "normal! mX",
})

autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.iskeyword:remove("-")
		vim.opt_local.iskeyword:remove("_")
	end,
})

-- Define excluded mark letters
local excluded_marks = {
	J = true,
	X = true,
	C = true,
	H = true,
}

-- Function to set mark when leaving a buffer
local function set_mark_on_bufleave()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname == "" then
		return
	end -- Ignore unnamed buffers

	local filename = vim.fn.fnamemodify(bufname, ":t")
	local first_letter = filename:sub(1, 1):upper()

	if not first_letter:match("%a") then
		return
	end -- Only mark with letters

	if excluded_marks[first_letter] then
		return
	end -- Skip excluded letters

	-- Set mark at current cursor position in the buffer being left
	pcall(vim.cmd, "mark " .. first_letter)
end

-- Create autocommand
autocmd("BufLeave", {
	group = automarkGroup,
	pattern = { "*.jsx", "*.tsx", "*.js", "*.ts" },
	callback = set_mark_on_bufleave,
	desc = "Set alphabetical mark on buffer leave",
})

-- Change msgarea highlight when entering/leaving command-line mode
autocmd("CmdlineEnter", {
	callback = function()
		-- Change the message area (command line) colors
		vim.api.nvim_set_hl(0, "MsgArea", { fg = "#f6f8ff" })
	end,
})

autocmd("CmdlineLeave", {
	callback = function()
		-- Restore your normal MsgArea highlight
		vim.api.nvim_set_hl(0, "MsgArea", { fg = "#676d8a" })
	end,
})
