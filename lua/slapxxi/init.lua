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

lspconfig.lua_ls.setup({})
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
})
