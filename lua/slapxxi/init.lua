require("slapxxi.packer")
require("slapxxi.remap")
require("slapxxi.set")

local autocmd = vim.api.nvim_create_autocmd
local lspconfig = require('lspconfig')

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

