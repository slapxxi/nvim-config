local map = vim.keymap.set

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- auto close brackets
-- map("i", "(", "()<Esc>i", opts)
-- map("i", "[", "[]<Esc>i", opts)
-- map("i", "{", "{}<Esc>i", opts)

-- map({ "n", "v", "i" }, "<C-c>", "<Esc>", { noremap = true })

map("n", "<C-g>", "<C-^>")

map("n", "<leader>s", ":SessionManager save_current_session<CR>", opts)
map("n", "<leader>l", ":SessionManager load_last_session<CR>", opts)

-- go to start/end of line in insert mode
map("i", "<M-S-l>", "<Esc>$a")
map("i", "<M-S-h>", "<Esc>^i")
map("i", "<M-l>", "<Right>")
map("i", "<M-h>", "<Left>")
map("i", "<M-j>", "<Down>")
map("i", "<M-k>", "<Up>")

-- insert new line
map("n", "<M-o>", "o<Esc>")
map("n", "<M-O>", "O<Esc>")

map("n", "<M-CR>", "o<Esc>")
map("i", "<M-CR>", "<CR><Esc>O  ")

-- prev/next buffer
map("n", "<M-p>", ":bp<CR>")
map("n", "<M-n>", ":bn<CR>")

map("n", "<leader>p", ":pu<CR>")
map("n", "<leader>P", ":pu!<CR>")

map("n", "<C-e>", "<C-e>j")
map("n", "<C-y>", "<C-y>k")

map("n", "<leader>w", ":bd<CR>")
map("n", "<leader>W", ":bd!<CR>")

map("i", "<C-a>", "<Home>")

-- quit
map("n", "<leader>q", ":qa!<CR>")

-- paste next line
-- map("n", "<leader>p", 'o<C-r>"<BS><Esc>^')

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

map("n", "<leader>/", ":g/")

-- yank and replace currently selected
map("v", "<leader>/", "y:%s/<C-R>0/")

-- case insensitive search in case the option is not enabled
-- map("n", "<leader>/","/\\c")

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
-- map("n", "<Tab>", "@q", opts)
-- map("n", "<leader><Tab>", "@q", opts)

-- go to next match and center
map("n", "n", "nzz")

-- add comma at the end and go normal mode
map("n", "<leader>,", "A,<Esc>", opts)

-- save
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<C-o>:w<CR>")
map("n", "<leader>s", ":w<CR>")

--force save
map("n", "<C-S-s>", ":w!<CR>")

-- switch buffers
-- map("n", "<leader><Tab>", "<C-^>", { noremap = false })

-- repeat macros
map("n", "Q", "@q")
map("n", "<C-space>", "@@")

-- go to end & center
map("n", "G", "Gzz")

-- scroll and center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Open quickfix list
map("n", "<leader>;o", ":copen<CR>", { desc = "Quickfix: Open list" })

-- Close quickfix list
map("n", "<leader>;c", ":cclose<CR>", { desc = "Quickfix: Close list" })

-- Go to next quickfix item
map("n", "<leader>;n", ":cnext<CR>zz", { desc = "Quickfix: Next item" })

-- Go to previous quickfix item
map("n", "<leader>;p", ":cprev<CR>zz", { desc = "Quickfix: Previous item" })

-- Clear quickfix list
map("n", "<leader>;f", ":call setqflist([])<CR>", { desc = "Quickfix: Clear list" })

-- Toggle quickfix list
map("n", "<leader>;t", function()
	local wininfo = vim.fn.getwininfo()
	for _, win in ipairs(wininfo) do
		if win.quickfix == 1 then
			vim.cmd("cclose")
			vim.cmd("wincmd p") -- go back to previous window
			return
		end
	end
	vim.cmd("copen")
	vim.cmd("wincmd p") -- go back to previous window
end, { desc = "Quickfix: Toggle list" })

vim.keymap.set("n", "<leader>;o", function()
	vim.cmd("copen")
	vim.cmd("wincmd p") -- go back to previous window
end, { desc = "Quickfix: Open without focus" })

map("n", "<M-S-j>", ":cnext<CR>zz", { desc = "Quickfix: Next item" })
map("n", "<M-S-k>", ":cprev<CR>zz", { desc = "Quickfix: Next item" })
