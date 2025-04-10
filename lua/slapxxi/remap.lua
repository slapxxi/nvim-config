local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>Ps", ":PackerSync<CR>")

map("n", "<leader>w", ":bd<CR>")
map("n", "<leader>W", ":bd!<CR>")
map("n", "<leader>n", ":bn<CR>")
map("n", "<leader>p", ":bp<CR>")

map("n", "<leader>q", vim.cmd.q)

-- remove search highlight
map("n", "<leader><BS>", vim.cmd.noh)

-- Visual Mode Keybindings
map("v", "<C-e>", "<cmd>EmmetWrapWithAbbreviation<CR>", opts)
map("v", "<C-l>", "<Esc>a", opts)
map("v", "<C-h>", "<Esc>i", opts)
map("v", "L", "$", opts)
map("v", "H", "^", opts)
map("v", "gd", "ygvd", opts)
map("v", "gB", "<cmd>lua vim.lsp.buf.document_highlight()<CR>", opts) -- Approximation
map("v", "g/", ":s/", opts)
map("v", "<leader>y", "ygv", opts)
map("v", "gy", "ygv<Esc>", opts)

-- move line up/down
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Normal Mode Keybindings
map("n", "Y", '"Yy', opts)
map("n", "L", "$", opts)
map("n", "H", "^", opts)
map("n", "V", "V$", opts)
map("n", "g/", ":%s/", opts)

-- DO NOT REMAP TAB TO NOT BREAK CTRL+I AND CTRL+O COMBO
-- map('n', '<Tab>', '@q', opts)
map("n", "<leader><Tab>", "@q", opts)
--map('n', 'mm', "m'")

-- Editor Commands (Normal Mode)
map("n", "n", "nzz")

-- Emmet Commands (Normal Mode)
map("n", "<leader>dt", "<cmd>EmmetRemoveTag<CR>", opts)
map("n", "<leader>u", "<cmd>EmmetUpdateTag<CR>", opts)
map("n", "<leader>s", "<cmd>EmmetSplitJoinTag<CR>", opts)
map("n", "<C-l>", "<cmd>EmmetMatchTag<CR>", opts)
map("n", "<C-h>", "<cmd>EmmetMatchTag<CR>", opts)
map("i", "<C-e>", "<cmd>EmmetExpandAbbreviation<CR>", opts)

map("n", "<leader><leader>u", "<cmd>Git clean<CR>", opts) -- Requires git plugin

-- Leader Commands (Normal Mode)
map("n", "<leader>f", "0/fun<CR>cwlet<Esc>f(i=<Esc>f{i=><Esc>0", opts)
map("n", "<leader>=", "0/let<CR>Ncwfunction<Esc>f=x;xx0", opts)
map("n", '<leader><leader>"', 'f"ci"<C-o>l<C-h><C-h>{`<C-r>"`}<Esc>', opts)
map("n", "<leader>,", "A,<Esc>", opts)
map("n", "<leader><leader>{", 'f{ds{cs`"', opts)

-- Insert Mode Keybindings
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-i>", "<cmd>lua vim.lsp.buf.completion()<CR>", opts) -- Approximation

-- Insert Mode Non-Recursive
map("i", "<C-e>", "<C-e><Esc>", { noremap = false, silent = true })

map("n", "<C-s>", ":w<CR>")
map("n", "<C-S-s>", ":w!<CR>")

map("n", "<leader><Tab>", "<C-^>", { noremap = false })
map("n", "<C-r>", "@q")
