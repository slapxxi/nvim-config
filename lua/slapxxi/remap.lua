local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>Ps", ":PackerSync<CR>")

map("n", "<leader>w", ":bd<CR>")
map("n", "<leader>W", ":bd!<CR>")

-- map("n", "<leader>n", ":bn<CR>")
-- map("n", "<leader>p", ":bp<CR>")

-- quit
map("n", "<leader>q", vim.cmd.q)

-- paste next line
map("n", "<leader>p", 'o<C-r>"<BS><Esc>^')

-- remove search highlight
map("n", "<leader><BS>", vim.cmd.noh)

-- convenient start/end of line
map("v", "L", "$", opts)
map("v", "H", "^", opts)
map("n", "L", "$", opts)
map("n", "H", "^", opts)

-- yank and then delete
map("v", "gd", "ygvd", opts)

-- search and replace
map("n", "g/", ":%s/", opts)
map("v", "g/", ":s/", opts)

-- yank but go to the end of the yanked text
map("v", "gy", "ygv<Esc>", opts)

-- yank but keep the selection
map("v", "<leader>y", "ygv", opts)

-- move line up/down
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- add motion to register Y
map("n", "Y", '"Yy', opts)

-- go to end of line when entering visual
map("n", "V", "V$", opts)

-- DO NOT REMAP TAB TO NOT BREAK CTRL+I AND CTRL+O COMBO
-- map('n', '<Tab>', '@q', opts)
-- map("n", "<leader><Tab>", "@q", opts)
-- map('n', 'mm', "m'")

-- go to next match and center
map("n", "n", "nzz")

-- Emmet Commands (Normal Mode)
--map("v", "<C-e>", "<cmd>EmmetWrapWithAbbreviation<CR>", opts)
-- map("n", "<leader>dt", "<cmd>EmmetRemoveTag<CR>", opts)
-- map("n", "<leader>u", "<cmd>EmmetUpdateTag<CR>", opts)
-- map("n", "<leader>s", "<cmd>EmmetSplitJoinTag<CR>", opts)
-- map("n", "<C-l>", "<cmd>EmmetMatchTag<CR>", opts)
-- map("n", "<C-h>", "<cmd>EmmetMatchTag<CR>", opts)
-- map("i", "<C-e>", "<cmd>EmmetExpandAbbreviation<CR>", opts)

map("n", "<leader><leader>u", "<cmd>Git clean<CR>", opts) -- Requires git plugin

-- add comma at the end and go normal mode
map("n", "<leader>,", "A,<Esc>", opts)

-- navigate with  jklh
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-j>", "<Down>", opts)

-- Insert Mode Non-Recursive
-- map("i", "<C-e>", "<C-e><Esc>", { noremap = false, silent = true })

-- save
map("n", "<C-s>", ":w<CR>")

--force save
map("n", "<C-S-s>", ":w!<CR>")

-- switch buffers
map("n", "<leader><Tab>", "<C-^>", { noremap = false })

-- repeat q macro
map("n", "<C-r>", "@q")

-- go to end & center
map("n", "G", "Gzz")

-- scroll and center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
