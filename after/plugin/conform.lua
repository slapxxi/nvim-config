require("conform").setup({
	formatters = {
		svgo = {
			command = "svgo",
			args = { "--input", "$FILENAME", "--output", "$FILENAME" },
			stdin = false,
		},
		prettier = {
			prepend_args = function()
				return {
					"--single-quote",
					"--print-width",
					"100",
					"--config-precedence",
					"prefer-file",
				}
			end,
		},
	},
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "eslint_d", "prettierd", "prettier" },
		typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		json = { "prettier" },
		jsonc = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		markdown = { "prettier" },
		svg = { "svgo" },
	},
})

vim.keymap.set({ "n", "i" }, "<C-s>", function()
	require("conform").format({
		async = false,
		lsp_fallback = true,
	})

	vim.cmd("write")
end, { desc = "Format with Conform and save file" })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })
