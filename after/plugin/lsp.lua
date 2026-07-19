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

		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = event.buf, desc = "LSP Rename" })

		vim.keymap.set(
			{ "n", "x" },
			"<F3>",
			"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
			{ buffer = event.buf, desc = "LSP Format" }
		)

		vim.keymap.set(
			"n",
			"K",
			"<cmd>lua vim.lsp.buf.hover({ border='rounded' })<cr>",
			{ buffer = event.buf, desc = "LSP Hover" }
		)

		vim.keymap.set(
			"n",
			"gd",
			"<cmd>lua vim.lsp.buf.definition()<cr>",
			{ buffer = event.buf, desc = "Go to definition" }
		)

		vim.keymap.set(
			"n",
			"gD",
			"<cmd>lua vim.lsp.buf.declaration()<cr>",
			{ buffer = event.buf, desc = "Go to declaration" }
		)

		vim.keymap.set(
			"n",
			"go",
			"<cmd>lua vim.lsp.buf.type_definition()<cr>",
			{ buffer = event.buf, desc = "Go to type definition" }
		)

		vim.keymap.set(
			"n",
			"grr",
			"<cmd>lua vim.lsp.buf.references()<cr>",
			{ buffer = event.buf, desc = "Go to references" }
		)

		vim.keymap.set(
			"n",
			"gs",
			"<cmd>lua vim.lsp.buf.signature_help()<cr>",
			{ buffer = event.buf, desc = "Signature help" }
		)

		vim.keymap.set(
			"n",
			"gn",
			"<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' } })<cr>",
			{ buffer = event.buf, desc = "Next diagnostic" }
		)

		vim.keymap.set("n", "gci", vim.lsp.buf.incoming_calls, { buffer = event.buf, desc = "LSP Incoming calls" })
		vim.keymap.set("n", "gco", vim.lsp.buf.outgoing_calls, { buffer = event.buf, desc = "LSP Outgoing calls" })

		vim.keymap.set(
			"n",
			"Y",
			"<cmd>lua vim.diagnostic.open_float(nil, {focus = false, border = 'rounded'})<cr>",
			{ buffer = event.buf, desc = "LSP Diagnostics" }
		)

		vim.keymap.set(
			{ "n", "v" },
			"<leader>H",
			"<cmd>lua vim.lsp.buf.code_action()<cr>",
			{ buffer = event.buf, desc = "LSP Code actions" }
		)
	end,
})

local caps = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("ts_ls", {
	capabilities = caps,
	on_attach = on_attach,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"json",
		"jsonc",
		"vue",
	},
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vim.fn.stdpath("data")
					.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
	},
	-- cmd = { "typescript-language-server", "--stdio" },
})

vim.lsp.enable("ts_ls")

vim.lsp.config("vue_ls", {
	capabilities = caps,
})

vim.lsp.enable("vue_ls")

-- Go
vim.lsp.config("gopls", {
	settings = {
		gopls = {},
	},
})
vim.lsp.enable("gopls")

-- Lua
vim.lsp.enable("lua_ls")

-- CSS
vim.lsp.config("cssls", {
	capabilities = capabilities,
})
vim.lsp.enable("cssls")

vim.lsp.enable("css_variables")
vim.lsp.enable("cssmodules_ls")
vim.lsp.enable("tailwindcss")

-- HTML
vim.lsp.config("html", {
	capabilities = capabilities,
})
vim.lsp.enable("html")

vim.lsp.config("emmet_language_server", {
	settings = {
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
			"vue",
		},
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
	},
})
vim.lsp.enable("emmet_language_server")
