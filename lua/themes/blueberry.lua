local bg = "#0e0e10"

local colors = {
	bg = "#0e0e10",
	bg_dark = "#08080a",
	sidebar_bg = bg,
	status_bg = bg,
	line_bg = "#141418",

	fg = "#b3bdde", -- main text
	gray = "#666c88", -- types
	gray_blue = "#8389aa", -- properties
	dark_gray = "#3d4054", -- punctuation
	subtle_gray = "#252734", -- inactive fg

	blue = "#1166ff", -- primary accent color
	blue_darker = "#0e5ae0", -- primary accent color
	light_blue = "#1ab2ff", -- Secondary accent (e.g., constants)
	light_blue_a = "#00a2f5", -- Secondary accent (e.g., constants)
	pale_blue = "#629aff",

	teal = "#42C5D7",

	yellow = "#f0c82a", -- JSON properties, regex
	yellow_pastel = "#ffe08c", -- Softer, more pastel yellow
	yellow_transparent = "#ceac27", -- Softer, more pastel yellow

	orange = "#ff6633",

	red = "#ff3c1a", -- Errors
	red_pastel = "#ff8a75", -- Softer, more pastel red

	green = "#98ff35",
	green_pastel = "#90EE90",

	white = "#f6f8ff", -- strings color

	copilot = "#434a69",
	highlight = "#0f2958", -- Selection highlights
	highlight_debug = "#122132",
}

-- semantic colors
local scolors = {
	text = colors.fg,
	variable = colors.fg,
	type = colors.gray,
	property = colors.gray_blue,
	enumMember = colors.gray_blue,
	class = colors.gray_blue,
	interface = colors.gray_blue,
	struct = colors.gray_blue,
	event = colors.gray_blue,
	operator = colors.gray_blue,
	fn = colors.gray_blue,
	method = colors.gray_blue,
	macro = colors.gray_blue,
	keyword = colors.blue,
	modifier = colors.gray_blue,
	comment = colors.dark_gray,
	statement = colors.blue,
	name = colors.white,
	number = colors.teal,
	constant = colors.light_blue,
	builtin = colors.light_blue_a,
	call = colors.blue,
	string = colors.white,
	highlight = colors.highlight,
	highlight_debug = colors.highlight_debug,
	-- highlight_cmp = "#1e2437",
}

local blueberry = {
	-- Basic UI elements
	Normal = { fg = colors.fg, bg = colors.bg },
	NormalFloat = { fg = colors.blue }, -- Floating windows
	WinSeparator = { fg = colors.dark_gray },
	Cursor = { fg = colors.bg, bg = colors.blue },
	CursorLine = { bg = colors.line_bg },
	LineNr = { fg = colors.dark_gray },
	CursorLineNr = { fg = colors.blue },
	Visual = { bg = colors.highlight },
	Search = { bg = colors.yellow_transparent, fg = colors.bg }, -- editor.findMatchBackground
	IncSearch = { bg = colors.blue, fg = colors.white }, -- editor.findMatchHighlightBackground
	StatusLine = { fg = colors.dark_gray, bg = colors.status_bg },
	StatusLineNC = { fg = colors.subtle_gray, bg = colors.status_bg },
	VertSplit = { fg = colors.gray }, -- sideBar.border
	Pmenu = { fg = colors.fg, bg = colors.subtle_gray }, -- editorSuggestWidget.background
	PmenuSel = { bg = colors.yellow, fg = colors.bg }, -- editorSuggestWidget.selectedBackground
	WildMenu = { fg = colors.white, bg = colors.blue },
	SnippetTabStop = { fg = colors.text, bg = colors.yellow },
	MatchParen = { fg = colors.yellow, bold = true },
	MsgArea = { fg = colors.gray },

	-- Syntax highlighting { mapped from tokenColors }
	Statement = { fg = scolors.statement },
	Comment = { fg = scolors.comment },
	Constant = { fg = scolors.constant }, -- Constants
	String = { fg = scolors.string }, -- Strings
	Identifier = { fg = colors.white }, -- Variable names, function names
	Function = { fg = colors.blue }, -- Function calls
	Keyword = { fg = colors.blue }, -- Keywords
	Operator = { fg = colors.blue }, -- Punctuation, operators
	Type = { fg = colors.gray }, -- Types
	PreProc = { fg = colors.blue }, -- Preprocessor (e.g., storage.type)
	Special = { fg = scolors.constant }, -- Embedded, constants
	Delimiter = { fg = colors.dark_gray }, -- Embedded, constants
	Error = { fg = colors.red }, -- Errors
	Todo = { fg = colors.yellow, bg = colors.bg },
	Folded = { fg = colors.dark_gray },
	SpecialKey = { fg = colors.dark_gray },
	NonText = { fg = colors.fg },

	TabLine = { fg = colors.dark_gray, bg = colors.bg_dark },
	TabLineFill = { fg = colors.dark_gray, bg = colors.bg_dark },
	TabLineSel = { fg = colors.white, bg = colors.bg },

	Directory = { fg = colors.blue },

	qfFileName = { fg = colors.gray },
	qfText = { fg = colors.dark_gray },
	QuickFixLine = { fg = colors.blue },

	-- CmpSel = { bg = colors.orange },
	-- CmpItemAbbr = { bg = colors.yellow },
	-- CmpItemAbbrMatch = { bg = colors.yellow, fg = colors.white },
	-- CmpItemKind = { bg = colors.yellow },
	-- CmpItemMenu = { bg = colors.yellow },

	-- Diff
	DiffAdd = { bg = colors.bg, fg = colors.green_pastel },
	DiffDelete = { bg = colors.bg, fg = colors.red_pastel },
	DiffChange = { bg = colors.bg, fg = colors.yellow_pastel },
	DiffText = { bg = colors.bg, fg = colors.fg },
	-- diffEditor = { bg = "#0e0e12" }, -- diffEditor.background
	-- diffAdded = { fg = colors.green_pastel },
	-- diffRemoved = { fg = colors.red_pastel },
	-- diffRemoved = { fg = colors.red_pastel },

	-- Git
	GitSignsAdd = { fg = "#addb67" }, -- gitDecoration.untrackedResourceForeground
	GitSignsChange = { fg = "#555770" }, -- gitDecoration.modifiedResourceForeground
	GitSignsDelete = { fg = "#EF5350" }, -- gitDecoration.deletedResourceForeground

	FugitiveBlameTime = { fg = colors.gray },

	-- LSP
	LspReferenceText = { fg = colors.bg, bg = colors.pale_blue },

	-- LSP diagnostics
	-- DiagnosticsError = { fg = colors.red },
	-- DiagnosticsWarn = { fg = colors.red },
	-- DiagnosticsInfo = { fg = colors.red },
	-- DiagnosticsHint = { fg = colors.red },
	DiagnosticUnnecessary = { fg = colors.gray, undercurl = true },
	DiagnosticUnderlineError = { fg = colors.red_pastel, underline = true },
	DiagnosticUnderlineWarn = { fg = colors.yellow_pastel, undercurl = true },

	LspDiagnosticsDefaultError = { fg = colors.red, bg = colors.bg },
	LspDiagnosticsDefaultWarning = { fg = colors.yellow, bg = colors.bg },
	LspDiagnosticsDefaultInformation = { fg = colors.light_blue, bg = colors.bg },
	LspDiagnosticsDefaultHint = { fg = colors.gray, bg = colors.bg },

	-- LSP floating windows
	LspFloatWinNormal = { fg = colors.fg, bg = colors.red },
	LspFloatWinBorder = { fg = colors.dark_gray, bg = colors.red },

	-- LSP signature help
	LspSignatureActiveParameter = { fg = colors.white, bg = colors.bg, bold = true },

	-- CMP Kinds
	CmpItemKindSnippet = { fg = scolors.number },
	CmpItemKindFunction = { fg = scolors.call },
	CmpItemKindMethod = { fg = colors.blue_darker },
	CmpItemKindConstant = { fg = scolors.constant },
	CmpItemKindKeyword = { fg = scolors.builtin },
	CmpItemKindModule = { fg = scolors.name },
	CmpItemKindStruct = { fg = scolors.type },
	CmpItemKindInterface = { fg = colors.pale_blue },
	CmpItemKindClass = { fg = scolors.constant },
	CmpItemKindField = { fg = scolors.property },
	CmpItemKindText = { fg = scolors.comment },
	CmpItemKindVariable = { fg = scolors.text },
	CmpItemAbbrMatch = { bold = true },
	CmpItemAbbrMatchFuzzy = { italic = true },
	CmpPmenuSel = { bg = scolors.highlight },

	["@tag"] = { fg = colors.blue },
	["@tag.builtin"] = { fg = colors.fg },
	["@tag.html"] = { fg = colors.light_blue },
	["@tag.attribute"] = { fg = scolors.property },
	["@tag.delimiter"] = { fg = colors.dark_gray },

	["@variable"] = { fg = scolors.text },
	["@variable.member"] = { fg = scolors.property },
	["@variable.parameter"] = { fg = scolors.name },

	["@number"] = { fg = scolors.number },
	["@number.float"] = { fg = scolors.number },

	["@module"] = { fg = scolors.name },

	["@type.definition"] = { fg = scolors.name },

	["@lsp.type.property"] = { fg = scolors.property },
	["@lsp.type.class"] = { fg = scolors.keyword },
	["@lsp.mod.declaration"] = { fg = scolors.name },
	["@lsp.typemod.variable.defaultLibrary"] = { fg = scolors.builtin },
	["@lsp.typemod.class.defaultLibrary"] = { fg = scolors.name },
	["@lsp.typemod.property.declaration"] = { fg = scolors.property },

	-- Go
	-- ["@type.builtin.go"] = { fg = colors.gray_blue },
	["@function.go"] = { fg = scolors.name },
	["@function.builtin.go"] = { fg = scolors.builtin },
	["@type.builtin.go"] = { fg = scolors.builtin },
	["@function.call.go"] = { fg = scolors.call },
	["@function.method.go"] = { fg = scolors.name },
	["@function.method.call.go"] = { fg = scolors.call },
	["@property.go"] = { fg = scolors.property },

	-- CSS
	["@type.css"] = { fg = colors.blue },
	["@variable.css"] = { fg = colors.light_blue },

	-- JSON
	["@property.json"] = { fg = colors.yellow },
	["@property.jsonc"] = { fg = colors.yellow },

	-- JSX
	["@_jsx_attribute"] = { fg = colors.light_blue },

	-- JavaScript
	["@variable.member.javascript"] = { fg = colors.gray_blue },
	javascriptParens = colors.dark_gray,

	-- Lua
	["@lsp.type.parameter.lua"] = { fg = colors.blue },

	-- Markdown
	RenderMarkdownCode = { bg = colors.line_bg },
	markdownBold = { fg = colors.fg, bold = true },
	markdownItalic = { fg = "#a2bffc", italic = true }, -- markup.changed
	markdownHeadingDelimiter = { fg = colors.blue },
	markdownBlockquote = { fg = colors.fg },

	-- Plugins
	CopilotSuggestion = { fg = colors.copilot, italic = true },
	CodeiumSuggestion = { fg = colors.copilot, italic = true },

	HlSearchLens = { bg = colors.highlight, fg = colors.gray },

	TelescopeBorder = { fg = colors.dark_gray },
	TelescopeSelection = { bg = colors.highlight, fg = colors.white, bold = true },

	TreesitterContext = { bg = colors.line_bg, fg = colors.bg },
	TreesitterContextLineNumber = { bg = colors.line_bg, fg = colors.white },

	DapBreakpoint = { fg = colors.red, bg = colors.bg },
	DapBreakpointCondition = { fg = colors.yellow, bg = colors.bg },
	DapStopped = { bg = colors.highlight_debug },
	DapStoppedNumHl = { fg = colors.blue, bg = colors.bg },

	NvimTreeSymlink = { bg = colors.blue, fg = colors.text },
	NvimTreeImageFile = { bg = colors.blue, fg = colors.text },
	NvimTreeExecFile = { bg = colors.blue, fg = colors.text },
	NvimTreeRootFolder = { fg = colors.gray },
	NvimTreeIndentMarker = { fg = colors.dark_gray },
	NvimTreeFolderName = { fg = colors.gray },
	NvimTreeFolderIcon = { fg = colors.dark_gray },
	NvimTreeOpenedFolderIcon = { fg = colors.white },
	NvimTreeOpenedFolderName = { fg = colors.white },
	NvimTreeGitDirtyIcon = { fg = colors.yellow },
	NvimTreeGitStagedIcon = { fg = colors.green },
	NvimTreeSpecialFile = { fg = colors.yellow },

	MarkSignNumHl = {},

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
