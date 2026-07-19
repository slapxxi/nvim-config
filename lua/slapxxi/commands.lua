-- :lua =vim.lsp.get_clients({ bufnr = 0 })[1].server_capabilities.executeCommandProvider.commands

vim.api.nvim_create_user_command("OrganizeImports", function()
	vim.lsp.buf.execute_command({
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	})
end, { desc = "Organize TypeScript/JavaScript imports" })

vim.keymap.set("n", "<leader>to", ":OrganizeImports<CR>")

-- :lua =vim.lsp.get_clients({ bufnr = 0 })[1].server_capabilities.codeActionProvider.codeActionKinds

vim.api.nvim_create_user_command("AddMissingImports", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.addMissingImports.ts" },
			diagnostics = {},
		},
	})
end, { desc = "Fix all missing TypeScript imports in the file" })

vim.keymap.set("n", "<leader>ti", ":AddMissingImports<CR>")
