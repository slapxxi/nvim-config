require("slapxxi.packer")
require("slapxxi.remap")

vim.opt.relativenumber = true
vim.opt.numberwidth = 1

vim.opt.guicursor = "n-v-c:block,i:ver25"
vim.opt.cursorline = true

-- highlight yanked text for 50ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=50})
augroup END
]]
