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
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettier" },
		jsonc = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		markdown = { "prettier" },
		svg = { "svgo" },
	},
})
