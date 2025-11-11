local map = vim.keymap.set

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- General
map("n", "<leader>,", "A,<Esc>", opts) -- add comma at the end and go normal mode

-- Move
map({ "n", "v" }, "L", "$", opts) -- to end of line
map({ "n", "v" }, "H", "^", opts) -- to start of line
map("n", "V", "V$", opts) -- enter visual mode and go to end of line

-- Yank and Paste
map("n", "<leader>p", ":pu<CR>")
map("n", "<leader>P", ":pu!<CR>")

map({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
map("n", "<leader>Y", [["+Y]]) -- copy to system clipboard

-- Quit
map("n", "<leader>q", ":qa!<CR>")

-- Search
map("n", "g/", ":%s/", opts)
map("v", "<leader>/", "y:%s/<C-R>0/") -- yank and replace currently selected
map({ "n", "v" }, "<leader>l", vim.cmd.noh) -- remove search highlight

-- Save
map("n", "<C-s>", ":w<CR>")
map("n", "<leader>s", ":w<CR>")
map("i", "<C-s>", "<C-o>:w<CR>")
map("n", "<C-S-s>", ":w!<CR>") -- force save

-- Macros
map("n", "Q", "@q") -- repeat q macro
map("n", "<C-space>", "@@") -- repeat last macro

-- Alignment
map("n", "G", "Gzz") -- go to the end and center
map("n", "n", "nzz") -- next match and center
map("n", "<C-e>", "<C-e>j") -- scroll down and center
map("n", "<C-y>", "<C-y>k") -- scroll up and center

-- Quickfix
map("n", "<M-S-j>", ":cnext<CR>zz") -- qf next item
map("n", "<M-S-k>", ":cprev<CR>zz") -- qf prev item

-- Move Lines
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Insert Mode Navigation
map("i", "<C-a>", "<Home>")
map("i", "<M-l>", "<Right>")
map("i", "<M-h>", "<Left>")
map("i", "<M-j>", "<Down>")
map("i", "<M-k>", "<Up>")

-- Newline Insert
map("n", "<M-o>", "o<Esc>")
map("n", "<M-O>", "O<Esc>")
map("n", "<M-CR>", "o<Esc>")
map("i", "<M-CR>", "<CR><Esc>O  ")

-- Buffers
map("n", "<C-g>", "<C-^>") -- alternate buffer
map("n", "<M-p>", ":bp<CR>") -- prev buffer
map("n", "<M-n>", ":bn<CR>") -- next buffer
map("n", "<leader>w", ":bd<CR>") -- close
map("n", "<leader>W", ":bd!<CR>") -- force close
