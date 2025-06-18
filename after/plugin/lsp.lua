-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

local lspconfig = require("lspconfig")
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = lspconfig.util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- vim.o.updatetime = 150

-- autocmd({ "CursorHold", "CursorHoldI" }, {
-- 	group = augroup("float_diagnostic", { clear = true }),
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false })
-- 	end,
-- })

-- Cursor specific diagnostics
-- autocmd({ "CursorHold", "CursorHoldI" }, {
-- 	group = augroup("float_diagnostic_cursor", { clear = true }),
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
-- 	end,
-- })

-- This is where you enable features that only work
-- if there is a language server active in the file
autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover({ border='rounded' })<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		--vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

		vim.keymap.set(
			"n",
			"<leader>h",
			"<cmd>lua vim.diagnostic.open_float(nil, {focus = false, border = 'rounded'})<cr>",
			opts
		)
		vim.keymap.set("n", "<leader>H", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

lspconfig.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx", "json", "jsonc" },
	cmd = { "typescript-language-server", "--stdio" },
})

lspconfig.html.setup({
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({})

lspconfig.emmet_language_server.setup({
	filetypes = {
		"html",
		"eruby",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"css",
		"less",
		"sass",
		"scss",
		"pug",
	},
	-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
	-- **Note:** only the options listed in the table are supported.
	init_options = {
		includeLanguages = {},
		excludeLanguages = {},
		extensionsPath = {},
		preferences = {},
		showAbbreviationSuggestions = true,
		showExpandedAbbreviation = "always",
		showSuggestionsAsSnippets = false,
		syntaxProfiles = {},
		variables = {},
	},
})
