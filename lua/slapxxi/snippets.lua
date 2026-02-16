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

local jsSnippets = {
	s("clog", {
		t({ "console.log(" }),
		i(1),
		t({ ")" }),
	}),
}

ls.add_snippets("javascript", jsSnippets)
ls.add_snippets("typescript", jsSnippets)

local reactSnippets = {
	s("cn", {
		t({ "className=" }),
		i(1),
	}),
}

ls.add_snippets("javascriptreact", reactSnippets)
ls.add_snippets("typescriptreact", reactSnippets)
