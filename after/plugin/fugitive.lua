vim.keymap.set("n", "<leader>g", ":vertical G<CR>")
vim.keymap.set("n", "<leader>G", ":G")

vim.keymap.set("n", "<leader>v", ":Gvdiffsplit<CR>")
vim.keymap.set("n", "<leader>h", ":Ghdiffsplit<CR>")
vim.keymap.set("n", "<leader>o", ":diffoff<CR><c-w>b<c-w>o")

vim.keymap.set("n", "<leader>~", ":Glcd<CR>", { desc = "lcd to git root" })
vim.keymap.set("n", "<leader><leader>~", ":Gcd<CR>", { desc = "cd to git root" })
