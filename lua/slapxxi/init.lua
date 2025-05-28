require("slapxxi.packer")
require("slapxxi.remap")
require("slapxxi.set")

local lspconfig = require("lspconfig")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local automarkGroup = augroup("automark", { clear = true })
local yank_group = augroup("yank_group", {})

-- mark with I mark when leaving insert mode via Esc key. doesnt work  with <C-c>
autocmd("InsertLeave", { group = automarkGroup, pattern = "*", command = "normal! mI" })

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

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = "*.md",
	command = "normal! mM",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = { "*.yml", "*.yaml" },
	command = "normal! mY",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = "*.vue",
	command = "normal! mV",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = "*.json",
	command = "normal! mS",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = "package.json",
	command = "normal! mP",
})

autocmd("BufLeave", {
	group = automarkGroup,
	pattern = ".env*",
	command = "normal! mE",
})

autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.iskeyword:remove("-")
		vim.opt_local.iskeyword:remove("_")
	end,
})

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
