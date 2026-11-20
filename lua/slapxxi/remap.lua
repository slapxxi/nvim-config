local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Tabs
vim.keymap.set("n", "<m-1>", ":tabn 1<CR>")
vim.keymap.set("n", "<m-2>", ":tabn 2<CR>")
vim.keymap.set("n", "<m-3>", ":tabn 3<CR>")
vim.keymap.set("n", "<m-4>", ":tabn 4<CR>")
vim.keymap.set("n", "<m-5>", ":tabn 5<CR>")
vim.keymap.set("n", "<m-6>", ":tabn 6<CR>")
vim.keymap.set("n", "<m-7>", ":tabn 7<CR>")
vim.keymap.set("n", "<m-8>", ":tabn 8<CR>")
vim.keymap.set("n", "<m-9>", ":tabn 9<CR>")

-- General
vim.keymap.set("n", "<leader>,", "A,<Esc>", opts) -- add comma at the end and go normal mode

-- Move
vim.keymap.set({ "n", "x" }, "L", "$", opts) -- to end of line
vim.keymap.set({ "n", "x" }, "H", "^", opts) -- to start of line
vim.keymap.set("n", "V", "V$", opts) -- enter visual mode and go to end of line

-- Yank and Paste
vim.keymap.set("n", "<leader>p", ":pu<CR>")
vim.keymap.set("n", "<leader>P", ":pu!<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy to system clipboard

-- Quit
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")

-- Search
vim.keymap.set("n", "g/", ":%s/", opts)
vim.keymap.set("v", "g/", ":s/", opts)
vim.keymap.set("v", "<leader>/", "y:%s/<C-R>0/") -- yank and replace currently selected
vim.keymap.set({ "n", "v" }, "<leader><BS>", vim.cmd.noh) -- remove search highlight

-- Save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-S-s>", ":wa<CR>")
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>")
vim.keymap.set("i", "<C-S-s>", "<C-o>:wa<CR>")

-- Macros
vim.keymap.set("n", "Q", "@q") -- repeat q macro
vim.keymap.set("n", "<C-space>", "@@") -- repeat last macro

-- Alignment
vim.keymap.set("n", "G", "Gzz") -- go to the end and center
vim.keymap.set("n", "n", "nzz") -- next match and center
vim.keymap.set("n", "<C-e>", "<C-e>j") -- scroll down and center
vim.keymap.set("n", "<C-y>", "<C-y>k") -- scroll up and center

-- Quickfix
vim.keymap.set("n", "<leader>co", ":copen<CR>")

-- Move Lines
vim.keymap.set("n", "<M-S-j>", ":m .+1<CR>==") -- qf next item
vim.keymap.set("n", "<M-S-k>", ":m .-2<CR>==") -- qf prev item
vim.keymap.set("v", "<M-S-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<M-S-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Insert Mode Navigation
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<M-l>", "<Right>")
vim.keymap.set("i", "<M-h>", "<Left>")
vim.keymap.set("i", "<M-j>", "<Down>")
vim.keymap.set("i", "<M-k>", "<Up>")

local function leave_insert_preserving_indent()
	local line = vim.api.nvim_get_current_line()
	if line:match("^%s+$") then
		return [[a<BS><Esc>]]
	end
	return [[<Esc>]]
end

vim.keymap.set("i", "<Esc>", leave_insert_preserving_indent, { expr = true, noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", leave_insert_preserving_indent, { expr = true, noremap = true, silent = true })

-- Newline Insert
vim.keymap.set("n", "<M-o>", "o<Esc>")
vim.keymap.set("n", "<M-O>", "O<Esc>")
vim.keymap.set("n", "<M-CR>", "o<Esc>")
vim.keymap.set("i", "<M-CR>", "<CR><Esc>O  ")

-- Buffers
vim.keymap.set("n", "<C-g>", "<C-^>") -- alternate buffer
vim.keymap.set("n", "<M-p>", ":bp<CR>") -- prev buffer
vim.keymap.set("n", "<M-n>", ":bn<CR>") -- next buffer
vim.keymap.set("n", "<leader>w", "<c-w>c") -- close
vim.keymap.set("n", "<leader>W", ":tabc<CR>") -- tab close

vim.keymap.set("v", "+", '"+y')

vim.keymap.set("n", "z.", ":normal! zszH<CR>", { silent = true, desc = "Center view horizontally" })

vim.keymap.set("n", "<leader>z", ":tab split<CR>")

-- Git
vim.keymap.set("x", "<leader>p", ":diffput<CR>", { silent = true })
vim.keymap.set("x", "<leader>o", ":diffget<CR>", { silent = true })

-- CD
vim.keymap.set("n", "<leader>`", ":lcd %:p:h<CR>", { desc = "lcd to current directory" })
vim.keymap.set("n", "<leader>_", ":lcd %:p:h | lcd ..<CR>", { desc = "lcd to parent directory" })
vim.keymap.set("n", "<leader>-", ":lcd-<CR>", { desc = "lcd to previous directory" })

vim.keymap.set("n", "<leader><leader>`", ":cd %:p:h<CR>", { desc = "cd to current directory" })
vim.keymap.set("n", "<leader><leader>_", ":cd %:p:h | cd ..<CR>", { desc = "cd to parent directory" })
vim.keymap.set("n", "<leader><leader>-", ":cd-<CR>", { desc = "cd to previous directory" })

-- Windows if not manage by tmux plugin
-- vim.keymap.set("n", "<m-j>", "j")
-- vim.keymap.set("n", "<m-l>", "l")
-- vim.keymap.set("n", "<m-k>", "k")
-- vim.keymap.set("n", "<m-h>", "h")

vim.keymap.set("n", "|", "|")
