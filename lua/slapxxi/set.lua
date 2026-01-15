local workspace_path = vim.fn.getcwd()
local cache_dir = vim.fn.stdpath("data")
local unique_id = vim.fn.fnamemodify(workspace_path, ":t") .. "_" .. vim.fn.sha256(workspace_path):sub(1, 8)
local shadafile = cache_dir .. "/shada/" .. unique_id .. ".shada"

function MyCustomTabLine()
	local s = ""
	local current_tab = vim.fn.tabpagenr()

	for i = 1, vim.fn.tabpagenr("$") do
		-- 1. Set highlight group based on whether this is the active tab
		if i == current_tab then
			s = s .. "%#TabLineSel#"
		else
			s = s .. "%#TabLine#"
		end

		-- 2. Set the tabpage number (enables mouse clicks to switch tabs)
		s = s .. "%" .. i .. "T"

		-- 3. Get the buffer name for the active window in this tab
		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)
		local bufnr = buflist[winnr]
		local bufname = vim.fn.bufname(bufnr)

		-- Format the label: [Index] Filename
		local label = " " .. i .. " "
		if bufname ~= "" then
			label = label .. vim.fn.fnamemodify(bufname, ":t") .. " "
		else
			label = label .. "[No Name] "
		end

		-- 4. Add a modified indicator if any buffer in the tab is modified
		local modified = false
		for _, b in ipairs(buflist) do
			if vim.fn.getbufvar(b, "&modified") == 1 then
				modified = true
				break
			end
		end
		if modified then
			label = label .. "+ "
		end

		s = s .. label
	end

	-- 5. Fill the remaining space and reset the click target
	s = s .. "%#TabLineFill#%T"

	return s
end

vim.opt.tabline = "%!v:lua.MyCustomTabLine()"

vim.opt.exrc = true
vim.opt.secure = true

vim.opt.shadafile = shadafile

vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.numberwidth = 1

vim.opt.guicursor = "n-v-c:block,i:ver25"
vim.opt.cursorline = true

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Number of spaces per indentation level
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 2 -- Number of spaces inserted when pressing <Tab>

vim.opt.hidden = true

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true

vim.opt.ignorecase = true

vim.opt.foldenable = false
vim.opt.foldmethod = "manual"

vim.opt.showmode = false

vim.opt.termguicolors = true

vim.g.nvim_tree_respect_buf_cwd = 1

vim.opt.iskeyword:remove("-")
vim.opt.iskeyword:remove("_")

vim.opt.wrap = false

vim.opt.autochdir = false

vim.o.autoread = true
