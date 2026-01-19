local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
	s("iferr", {
		t({ "if err != nil {", "\t" }),
		i(1),
		t({ "", "}" }),
	}),
})

local cn = {
	s("cn", {
		t({ "className=" }),
		i(1),
	}),
}

ls.add_snippets("javascriptreact", cn)
ls.add_snippets("typescriptreact", cn)
