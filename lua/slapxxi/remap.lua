local map = vim.keymap.set

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Tabs
map("n", "<m-1>", ":tabn 1<CR>")
map("n", "<m-2>", ":tabn 2<CR>")
map("n", "<m-3>", ":tabn 3<CR>")
map("n", "<m-4>", ":tabn 4<CR>")
map("n", "<m-5>", ":tabn 5<CR>")
map("n", "<m-6>", ":tabn 6<CR>")
map("n", "<m-7>", ":tabn 7<CR>")
map("n", "<m-8>", ":tabn 8<CR>")
map("n", "<m-9>", ":tabn 9<CR>")

-- General
map("n", "<leader>,", "A,<Esc>", opts) -- add comma at the end and go normal mode

-- Move
map({ "n", "x" }, "L", "$", opts) -- to end of line
map({ "n", "x" }, "H", "^", opts) -- to start of line
map("n", "V", "V$", opts) -- enter visual mode and go to end of line

-- Yank and Paste
map("n", "<leader>p", ":pu<CR>")
map("n", "<leader>P", ":pu!<CR>")

map({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
map("n", "<leader>Y", [["+Y]]) -- copy to system clipboard

-- Quit
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":qa!<CR>")

-- Search
map("n", "g/", ":%s/", opts)
map("v", "g/", ":s/", opts)
map("v", "<leader>/", "y:%s/<C-R>0/") -- yank and replace currently selected
map({ "n", "v" }, "<leader><BS>", vim.cmd.noh) -- remove search highlight

-- Save
map("n", "<C-s>", ":w<CR>")
map("n", "<C-S-s>", ":wa<CR>")
map("i", "<C-s>", "<C-o>:w<CR>")
map("i", "<C-S-s>", "<C-o>:wa<CR>")

-- Macros
map("n", "Q", "@q") -- repeat q macro
map("n", "<C-space>", "@@") -- repeat last macro

-- Alignment
map("n", "G", "Gzz") -- go to the end and center
map("n", "n", "nzz") -- next match and center
map("n", "<C-e>", "<C-e>j") -- scroll down and center
map("n", "<C-y>", "<C-y>k") -- scroll up and center

-- Quickfix
map("n", "<leader>co", ":copen<CR>")

-- Move Lines
map("n", "<M-S-j>", ":m .+1<CR>==") -- qf next item
map("n", "<M-S-k>", ":m .-2<CR>==") -- qf prev item
map("v", "<M-S-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<M-S-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

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
map("n", "<leader>w", "<c-w>c") -- close
map("n", "<leader>W", ":tabc<CR>") -- tab close

map("v", "+", '"+y')

map("n", "z.", ":normal! zszH<CR>", { silent = true, desc = "Center view horizontally" })

map("n", "<leader>z", ":tab split<CR>")

-- Git
map("x", "<leader>p", ":diffput<CR>", { silent = true })
map("x", "<leader>o", ":diffget<CR>", { silent = true })

-- CD
map("n", "<leader>`", ":lcd %:p:h<CR>", { desc = "lcd to current directory" })
map("n", "<leader>_", ":lcd %:p:h | lcd ..<CR>", { desc = "lcd to parent directory" })
map("n", "<leader>-", ":lcd-<CR>", { desc = "lcd to previous directory" })

map("n", "<leader><leader>`", ":cd %:p:h<CR>", { desc = "cd to current directory" })
map("n", "<leader><leader>_", ":cd %:p:h | cd ..<CR>", { desc = "cd to parent directory" })
map("n", "<leader><leader>-", ":cd-<CR>", { desc = "cd to previous directory" })

-- Windows
map("n", "<m-j>", "j")
map("n", "<m-l>", "l")
map("n", "<m-k>", "k")
map("n", "<m-h>", "h")

map("n", "<m-w>", "w")
map("n", "<m-t>", "t")
map("n", "<m-b>", "b")

map("n", "<m-c>", "c")
map("n", "<m-o>", "o")

map("n", "<m-v>", "v")
map("n", "<m-s>", "s")
