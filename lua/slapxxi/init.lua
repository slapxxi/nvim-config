require("slapxxi.packer")
require("slapxxi.remap")
require("slapxxi.set")

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
			timeout = 40,
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

local session_manager = require("session_manager")

-- Auto save session
autocmd({ "BufWritePre" }, {
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			-- Don't save while there's any 'nofile' buffer open.
			if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
				return
			end
		end
		session_manager.save_current_session()
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
