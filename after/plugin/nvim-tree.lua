if true then
	local function my_on_attach(bufnr)
		local api = require("nvim-tree.api")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- default mappings
		api.config.mappings.default_on_attach(bufnr)

		-- custom mappings
		vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
		vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	end

	-- disable netrw at the very start of your init.lua
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- optionally enable 24-bit colour
	vim.opt.termguicolors = true

	vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeToggle)

	-- OR setup with some options
	require("nvim-tree").setup({
		on_attach = my_on_attach,
		update_cwd = true,
		update_focused_file = { enable = true, update_cwd = true },
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 34,
			side = "right",
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	})
end
