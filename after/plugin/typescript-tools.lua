if true then
	vim.keymap.set("n", "<leader>ti", ":TSToolsAddMissingImports<CR>")
	vim.keymap.set("n", "<leader>tr", ":TSToolsRemoveUnused<CR>")
	vim.keymap.set("n", "<leader>to", ":TSToolsOrganizeImports<CR>")

	require("typescript-tools").setup({
		on_attach = on_attach,
		settings = {
			-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
			-- "remove_unused_imports"|"organize_imports") -- or string "all"
			-- to include all supported code actions
			-- specify commands exposed as code_actions
			expose_as_code_action = { "all" },
			publish_diagnostics_on = "change",
		},
	})
end
