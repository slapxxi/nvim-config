local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local automarkGroup = augroup("automark", { clear = true })
local yank_group = augroup("yank_group", {})

local theme = require("slapxxi.theme")
local scolors = theme.scolors

-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	group = vim.api.nvim_create_augroup("MinuetVirtualTextDismiss", { clear = true }),
-- 	callback = function()
-- 		local vt = require("minuet.virtualtext")
-- 		vt.action.dismiss()
-- 	end,
-- })

vim.api.nvim_create_autocmd("InsertLeave", {
	group = vim.api.nvim_create_augroup("MinuetVirtualTextDismiss", { clear = true }),
	callback = function()
		local vt = require("minuet.virtualtext")
		if vt.action.is_visible() then
			vt.action.dismiss()
		end
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

local excluded_marks = {
	J = true,
	X = true,
	C = true,
	H = true,
}

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
		vim.api.nvim_set_hl(0, "MsgArea", { fg = scolors.fg })
	end,
})

autocmd("CmdlineLeave", {
	callback = function()
		-- Restore your normal MsgArea highlight
		vim.api.nvim_set_hl(0, "MsgArea", { fg = scolors.subtle })
	end,
})

local vectorcode_cacher = require("vectorcode.config").get_cacher_backend()

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
	pattern = { "*.go", "*.tsx", "*.jsx", "*.js", "*.ts", "*.md" },
	callback = function(args)
		if not vectorcode_cacher.buf_is_registered(args.buf) then
			vectorcode_cacher.register_buffer(args.buf, {
				n_query = 1,
				exclude_this = false,
			})
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufDelete" }, {
	pattern = { "*.go", "*.tsx", "*.jsx", "*.js", "*.ts", "*.md" },
	callback = function(args)
		if vectorcode_cacher.buf_is_registered(args.buf) then
			vectorcode_cacher.deregister_buffer(args.buf)
		end
	end,
})
