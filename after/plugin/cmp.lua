local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "luasnip", priority = 1000 },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	}),
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel,Search:None",
		}),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "abbr", "kind" },
		format = function(entry, vim_item)
			local kind_name = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]

			vim_item = require("lspkind").cmp_format({
				before = require("tailwind-tools.cmp").lspkind_format,
				menu = {
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					vsnip = "[VSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[Latex]",
				},
			})(entry, vim_item)

			if kind_name then
				vim_item.abbr_hl_group = "CmpItemKind" .. kind_name
			end

			return vim_item
		end,
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

-- `/` cmdline setup.
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
