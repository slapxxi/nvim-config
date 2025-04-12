local colors = {
	-- Base colors from VSCode theme
	bg = "#0e0e12", -- editor.background
	fg = "#a7b2d5", -- editor.foreground
	blue = "#1166ff", -- Primary accent color (e.g., keywords, cursor)
	light_blue = "#1ab2ff", -- Secondary accent (e.g., constants)
	yellow = "#ffc82a", -- JSON properties, regex
	red = "#ff3c1a", -- Errors
	gray = "#535a7a", -- Deemphasized text, object keys
	dark_gray = "#303345", -- Punctuation, inactive elements
	subtle_gray = "#242533", -- Inactive foreground
	highlight = "#3c5888", -- Selection highlights
	line_bg = "#121217", -- Line highlight background
	sidebar_bg = "#0e0e12", -- SideBar.background
	status_bg = "#0e0e12", -- StatusBar.background
	white = "#f5f7ff", -- Main text color
	comment = "#323546", -- Comments
}

local blueberry = {
	-- Basic UI elements
	Normal = { fg = colors.fg, bg = colors.bg },
	NormalFloat = { fg = colors.fg, bg = colors.line_bg }, -- Floating windows
	Cursor = { fg = colors.bg, bg = colors.blue },
	CursorLine = { bg = colors.line_bg },
	LineNr = { fg = colors.dark_gray },
	CursorLineNr = { fg = colors.blue },
	Visual = { bg = colors.highlight, fg = colors.white },
	Search = { bg = colors.yellow, fg = colors.bg }, -- editor.findMatchBackground
	IncSearch = { bg = "#2E3248" }, -- editor.findMatchHighlightBackground
	StatusLine = { fg = colors.dark_gray, bg = colors.status_bg },
	StatusLineNC = { fg = colors.subtle_gray, bg = colors.status_bg },
	VertSplit = { fg = "#14141a" }, -- sideBar.border
	Pmenu = { fg = colors.fg, bg = "#131318" }, -- editorSuggestWidget.background
	PmenuSel = { bg = "#1a1a1f" }, -- editorSuggestWidget.selectedBackground
	WildMenu = { fg = colors.white, bg = colors.blue },
	SnippetTabStop = { fg = colors.text, bg = colors.bg },
	MatchParen = { fg = colors.yellow, bold = true },

	-- Syntax highlighting (mapped from tokenColors)
	Statement = { fg = colors.blue },
	Comment = { fg = colors.comment },
	Constant = { fg = colors.light_blue }, -- Constants
	String = { fg = colors.white }, -- Strings
	Identifier = { fg = colors.white }, -- Variable names, function names
	Function = { fg = colors.blue }, -- Function calls
	Keyword = { fg = colors.blue }, -- Keywords
	Operator = { fg = colors.blue }, -- Punctuation, operators
	Type = { fg = colors.gray }, -- Types
	PreProc = { fg = colors.blue }, -- Preprocessor (e.g., storage.type)
	Special = { fg = colors.light_blue }, -- Embedded, constants
	Delimiter = { fg = colors.dark_gray }, -- Embedded, constants
	Error = { fg = colors.red }, -- Errors
	Todo = { fg = colors.yellow, bg = colors.bg },
	Folded = { fg = colors.dark_gray },
	SpecialKey = { fg = colors.dark_gray },

	-- Diff
	DiffAdd = { bg = "#addb67", fg = "#000000" }, -- diffEditor.insertedTextBackground
	diffEditor = { bg = "#0e0e12" }, -- diffEditor.background
	DiffDelete = { bg = "#ef5350", fg = "#000000" }, -- diffEditor.removedTextBackground
	DiffChange = { bg = "#555770", fg = colors.white },
	DiffText = { bg = colors.blue, fg = colors.white },

	-- Git
	GitSignsAdd = { fg = "#addb67" }, -- gitDecoration.untrackedResourceForeground
	GitSignsChange = { fg = "#555770" }, -- gitDecoration.modifiedResourceForeground
	GitSignsDelete = { fg = "#EF5350" }, -- gitDecoration.deletedResourceForeground

	-- Markdown
	markdownBold = { fg = colors.fg, bold = true },
	markdownItalic = { fg = "#a2bffc", italic = true }, -- markup.changed
	markdownHeadingDelimiter = { fg = colors.blue },
	markdownBlockquote = { fg = colors.fg },

	-- Terminal colors
	TermCursor = { fg = colors.bg, bg = colors.blue },
	terminalBlack = "#0e0e12",
	terminalRed = "#eb4a47",
	terminalGreen = "#b0f547",
	terminalYellow = "#ffc82a",
	terminalBlue = "#1166ff",
	terminalMagenta = "#C792EA",
	terminalCyan = "#19c4e6",
	terminalWhite = "#f5f7ff",
	terminalBrightBlack = "#575656",
	terminalBrightRed = "#eb4a47",
	terminalBrightGreen = "#18dc6a",
	terminalBrightYellow = "#ffc82a",
	terminalBrightBlue = "#1166ff",
	terminalBrightMagenta = "#C792EA",
	terminalBrightCyan = "#19c4e6",
	terminalBrightWhite = "#f5f7ff",

	-- JavaScript
	javascriptParens = colors.dark_gray,

	["@variable.member"] = { fg = colors.gray }, -- optional: apply to all langs
	["@variable.member.javascript"] = { fg = colors.gray },
}

-- Apply the theme
local function apply_theme()
	vim.cmd("hi clear")
	vim.o.background = "dark"
	vim.o.termguicolors = true

	for group, opts in pairs(blueberry) do
		if type(opts) == "table" then
			vim.api.nvim_set_hl(0, group, opts)
		end
	end

	-- Set terminal colors
	vim.g.terminal_color_0 = blueberry.terminalBlack
	vim.g.terminal_color_1 = blueberry.terminalRed
	vim.g.terminal_color_2 = blueberry.terminalGreen
	vim.g.terminal_color_3 = blueberry.terminalYellow
	vim.g.terminal_color_4 = blueberry.terminalBlue
	vim.g.terminal_color_5 = blueberry.terminalMagenta
	vim.g.terminal_color_6 = blueberry.terminalCyan
	vim.g.terminal_color_7 = blueberry.terminalWhite
	vim.g.terminal_color_8 = blueberry.terminalBrightBlack
	vim.g.terminal_color_9 = blueberry.terminalBrightRed
	vim.g.terminal_color_10 = blueberry.terminalBrightGreen
	vim.g.terminal_color_11 = blueberry.terminalBrightYellow
	vim.g.terminal_color_12 = blueberry.terminalBrightBlue
	vim.g.terminal_color_13 = blueberry.terminalBrightMagenta
	vim.g.terminal_color_14 = blueberry.terminalBrightCyan
	vim.g.terminal_color_15 = blueberry.terminalBrightWhite
end

apply_theme()

return blueberry
