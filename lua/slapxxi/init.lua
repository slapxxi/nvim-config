require("slapxxi.packer")
require("slapxxi.remap")

vim.opt.relativenumber = true
vim.opt.numberwidth = 1

vim.opt.guicursor = "n-v-c:block,i:ver25"
vim.opt.cursorline = true

vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 2        -- Number of spaces per indentation level
vim.opt.tabstop = 2           -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 2       -- Number of spaces inserted when pressing <Tab>


-- highlight yanked text for 50ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=50})
augroup END
]]

lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
})
