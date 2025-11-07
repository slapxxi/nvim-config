local workspace_path = vim.fn.getcwd()
local cache_dir = vim.fn.stdpath("data")
local unique_id = vim.fn.fnamemodify(workspace_path, ":t") .. "_" .. vim.fn.sha256(workspace_path):sub(1, 8)
local shadafile = cache_dir .. "/shada/" .. unique_id .. ".shada"

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
