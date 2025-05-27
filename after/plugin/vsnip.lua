-- local map = vim.keymap.set

-- map("n", "s", "<Plug>(vsnip-select-text)")
-- map("x", "s", "<Plug>(vsnip-select-text)")
-- map("n", "S", "<Plug>(vsnip-cut-text)")
-- map("x", "S", "<Plug>(vsnip-cut-text)")

-- Expand
-- map({ "i", "s" }, "<Right>", function()
-- 	return vim.fn["vsnip#expandable"]() == 1 and "<Plug>(vsnip-expand)" or "<Right>"
-- end, { expr = true, noremap = false })

-- Expand or jump
-- map({ "i", "s" }, "<Left>", function()
-- 	return vim.fn == 1 and "<Plug>(vsnip-expand-or-jump)" or "<Left>"
-- end, { expr = true, noremap = false })

-- Jump forward
-- map({ "i", "s" }, "<Tab>", function()
-- 	return vim.fn == 1 and "<Plug>(vsnip-jump-next)" or "<Tab>"
-- end, { expr = true, noremap = false })

-- Jump backward
-- map({ "i", "s" }, "<S-Tab>", function()
-- 	return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<S-Tab>"
-- end, { expr = true, noremap = false })
