require("slapxxi.packer")
require("slapxxi.remap")
require("slapxxi.set")

local lspconfig = require('lspconfig')
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local automarkGroup = augroup("automark", { clear = true })
local yank_group = augroup("yank_group", {})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

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
  pattern = ".env*",
  command = "normal! mE",
})
