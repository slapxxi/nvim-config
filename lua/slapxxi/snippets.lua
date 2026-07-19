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
ls.add_snippets("vue", jsSnippets)

local reactSnippets = {
	s("cn", {
		t({ 'className="' }),
		i(1),
		t({ '"' }),
	}),
}

ls.add_snippets("javascriptreact", reactSnippets)
ls.add_snippets("typescriptreact", reactSnippets)

local vueSnippets = {
	s("c", {
		t({ 'class="' }),
		i(1),
		t({ '"' }),
	}),
}

ls.add_snippets("vue", vueSnippets)
