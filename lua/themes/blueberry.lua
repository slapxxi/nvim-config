local theme = require("slapxxi.theme")
local colors = theme.colors
local scolors = theme.scolors

local blueberry = {
	-- Basic UI elements
	Normal = { fg = scolors.fg, bg = scolors.bg },
	NormalFloat = { fg = scolors.em }, -- Floating windows
	WinSeparator = { fg = colors.gray_700 },
	Cursor = { fg = scolors.bg, bg = scolors.em },
	CursorLine = { bg = scolors.line },
	LineNr = { fg = colors.gray_700 },
	CursorLineNr = { fg = scolors.em },
	Visual = { bg = scolors.highlight },
	Search = { bg = colors.yellow_transparent, fg = scolors.bg }, -- editor.findMatchBackground
	IncSearch = { bg = scolors.em, fg = scolors.string }, -- editor.findMatchHighlightBackground
	StatusLine = { fg = colors.gray_700, bg = scolors.bg },
	StatusLineNC = { fg = colors.g_800, bg = scolors.bg },
	VertSplit = { fg = colors.g_500 }, -- sideBar.border
	Pmenu = { fg = scolors.fg, bg = colors.g_800 }, -- editorSuggestWidget.background
	PmenuSel = { bg = colors.yellow, fg = scolors.bg }, -- editorSuggestWidget.selectedBackground
	WildMenu = { fg = colors.white, bg = scolors.em },
	SnippetTabStop = { fg = scolors.fg, bg = colors.yellow },
	MatchParen = { fg = colors.yellow, bold = true },
	MsgArea = { fg = colors.g_500 },
	Underlined = {},
	EndOfBuffer = { fg = colors.zinc_700 },

	-- Syntax highlighting { mapped from tokenColors }
	Statement = { fg = scolors.statement },
	Comment = { fg = scolors.comment },
	Constant = { fg = scolors.constant }, -- Constants
	String = { fg = scolors.string }, -- Strings
	Title = { fg = scolors.name, bold = true }, -- Titles
	Identifier = { fg = colors.white }, -- Variable names, function names
	Function = { fg = colors.white },
	Keyword = { fg = scolors.keyword }, -- Keywords
	Operator = { fg = scolors.em }, -- Punctuation, operators
	Type = { fg = scolors.type }, -- Types
	PreProc = { fg = scolors.em }, -- Preprocessor (e.g., storage.type)
	Special = { fg = scolors.constant }, -- Embedded, constants
	Delimiter = { fg = scolors.punctuation }, -- Embedded, constants
	Error = { fg = scolors.error },
	Todo = { fg = colors.yellow, bg = scolors.bg },
	Folded = { fg = scolors.comment },
	SpecialKey = { fg = scolors.comment },
	NonText = { fg = scolors.fg },

	TabLine = { fg = scolors.comment, bg = scolors.backdrop },
	TabLineFill = { fg = scolors.comment, bg = scolors.backdrop },
	TabLineSel = { fg = colors.g_500, bg = scolors.bg },

	Directory = { fg = scolors.em },

	qfFileName = { fg = colors.g_500 },
	qfText = { fg = scolors.comment },
	QuickFixLine = { fg = scolors.em },

	-- Diff
	diffAdded = { bg = scolors.bg, fg = colors.green_pastel },
	diffRemoved = { bg = scolors.bg, fg = scolors.error },
	DiffAdd = { bg = scolors.bg, fg = colors.green_pastel },
	DiffDelete = { bg = scolors.bg, fg = scolors.error },
	DiffChange = { bg = scolors.bg, fg = colors.yellow_pastel },
	DiffText = { bg = scolors.bg, fg = scolors.fg },

	-- Git
	GitSignsAdd = { fg = "#addb67" }, -- gitDecoration.untrackedResourceForeground
	GitSignsChange = { fg = "#555770" }, -- gitDecoration.modifiedResourceForeground
	GitSignsDelete = { fg = "#EF5350" }, -- gitDecoration.deletedResourceForeground

	FugitiveBlameTime = { fg = colors.g_500 },

	-- LSP
	LspReferenceText = { fg = scolors.bg, bg = colors.pale_blue },

	-- LSP diagnostics
	DiagnosticUnnecessary = { fg = colors.g_500, undercurl = true },
	DiagnosticUnderlineError = { fg = scolors.error, underline = true },
	DiagnosticUnderlineWarn = { fg = colors.yellow_pastel, undercurl = true },
	DiagnosticSignError = { fg = scolors.error },
	DiagnosticSignWarn = { fg = colors.yellow_pastel },
	DiagnosticFloatingError = { fg = scolors.error },

	LspDiagnosticsDefaultError = { fg = scolors.error, bg = scolors.bg },
	LspDiagnosticsDefaultWarning = { fg = colors.yellow, bg = scolors.bg },
	LspDiagnosticsDefaultInformation = { fg = colors.sky_500, bg = scolors.bg },
	LspDiagnosticsDefaultHint = { fg = colors.g_500, bg = scolors.bg },

	-- LSP floating windows
	LspFloatWinNormal = { fg = scolors.fg, bg = scolors.error },
	LspFloatWinBorder = { fg = scolors.comment, bg = scolors.error },

	-- LSP signature help
	LspSignatureActiveParameter = { fg = colors.white, bg = scolors.bg, bold = true },

	-- CMP Kinds
	CmpItemKindSnippet = { fg = scolors.number },
	CmpItemKindFunction = { fg = scolors.call },
	CmpItemKindMethod = { fg = scolors.em_darker },
	CmpItemKindConstant = { fg = scolors.constant },
	CmpItemKindKeyword = { fg = scolors.builtin },
	CmpItemKindModule = { fg = scolors.name },
	CmpItemKindStruct = { fg = scolors.type },
	CmpItemKindInterface = { fg = colors.pale_blue },
	CmpItemKindClass = { fg = scolors.constant },
	CmpItemKindField = { fg = scolors.property },
	CmpItemKindText = { fg = scolors.comment },
	CmpItemKindVariable = { fg = scolors.fg },
	CmpItemAbbrMatch = { bold = true },
	CmpItemAbbrMatchFuzzy = { italic = true },
	CmpPmenuSel = { bg = scolors.highlight },

	["@function.call"] = { fg = scolors.call },
	["@function.method.call"] = { fg = scolors.call },

	["@tag"] = { fg = scolors.em },
	["@tag.builtin"] = { fg = scolors.property },
	["@tag.html"] = { fg = colors.sky_500 },
	["@tag.attribute"] = { fg = scolors.fg },
	["@tag.delimiter"] = { fg = scolors.punctuation },

	["@variable"] = { fg = scolors.fg },
	["@variable.member"] = { fg = scolors.property },
	["@variable.parameter"] = { fg = scolors.name },

	["@number"] = { fg = scolors.number },
	["@number.float"] = { fg = scolors.number },

	["@module"] = { fg = scolors.name },

	["@type.definition"] = { fg = scolors.name },

	["@lsp.type.component"] = { fg = scolors.keyword },
	["@lsp.type.class"] = { fg = scolors.keyword },
	["@lsp.type.method"] = { fg = scolors.keyword },
	["@lsp.type.property"] = { fg = scolors.property },
	["@lsp.mod.declaration"] = { fg = scolors.name },
	["@lsp.typemod.variable.defaultLibrary"] = { fg = scolors.builtin },
	["@lsp.typemod.class.defaultLibrary"] = { fg = scolors.name },
	["@lsp.typemod.property.declaration"] = { fg = scolors.property },

	-- Go
	["@lsp.type.function.go"] = {},
	["@function.go"] = { fg = scolors.name },
	["@function.call.go"] = { fg = scolors.call },
	["@lsp.type.namespace.go"] = { fg = scolors.property },
	["@lsp.typemod.type.definition.go"] = { fg = scolors.name },
	["@lsp.typemod.variable.definition.go"] = { fg = scolors.name },
	["@function.builtin.go"] = { fg = scolors.builtin },
	["@type.builtin.go"] = { fg = scolors.builtin },
	["@function.method.go"] = { fg = scolors.name },
	["@property.go"] = { fg = scolors.property },

	-- CSS
	["@type.css"] = { fg = scolors.keyword },
	["@type.scss"] = { fg = scolors.keyword },
	["@variable.css"] = { fg = colors.sky_500 },
	["@property.css"] = { fg = scolors.property },
	["@property.scss"] = { fg = scolors.property },
	["@variable.scss"] = { fg = scolors.property },

	-- JSON
	["@property.json"] = { fg = scolors.json },
	["@property.jsonc"] = { fg = scolors.json },

	-- JSX
	["@_jsx_attribute"] = { fg = colors.sky_500 },

	-- Vue
	["@tag.vue"] = { fg = scolors.property },
	["@none.vue"] = { fg = scolors.string },
	["@variable.member.vue"] = { fg = scolors.builtin },

	-- JavaScript
	["@variable.member.javascript"] = { fg = scolors.property },
	javascriptParens = scolors.comment,

	-- Lua
	["@lsp.type.parameter.lua"] = { fg = scolors.em },
	["@lsp.type.function.lua"] = {},

	-- Markdown
	RenderMarkdownCode = { bg = scolors.line },
	markdownBold = { fg = scolors.fg, bold = true },
	markdownItalic = { fg = "#a2bffc", italic = true }, -- markup.changed
	markdownHeadingDelimiter = { fg = scolors.em },
	markdownBlockquote = { fg = scolors.fg },

	-- Plugins
	CopilotSuggestion = { fg = colors.copilot, italic = true },
	CodeiumSuggestion = { fg = colors.copilot, italic = true },

	HlSearchLens = { bg = scolors.highlight, fg = scolors.fg },

	TelescopeBorder = { fg = scolors.comment },
	TelescopeSelection = { bg = scolors.highlight, fg = colors.white, bold = true },

	TreesitterContext = { bg = scolors.line, fg = scolors.bg },
	TreesitterContextLineNumber = { bg = scolors.line, fg = colors.white },

	DapBreakpoint = { fg = colors.red, bg = scolors.bg },
	DapBreakpointCondition = { fg = colors.yellow, bg = scolors.bg },
	DapStopped = { bg = scolors.highlight_debug },
	DapStoppedNumHl = { fg = scolors.em, bg = scolors.bg },

	NvimTreeSymlink = { bg = scolors.em, fg = scolors.fg },
	NvimTreeImageFile = { bg = scolors.em, fg = scolors.fg },
	NvimTreeExecFile = { bg = scolors.em, fg = scolors.fg },
	NvimTreeRootFolder = { fg = scolors.keyword },
	NvimTreeIndentMarker = { fg = scolors.comment },
	NvimTreeFolderName = { fg = scolors.name },
	NvimTreeFolderIcon = { fg = scolors.comment },
	NvimTreeOpenedFolderIcon = { fg = scolors.name },
	NvimTreeOpenedFolderName = { fg = scolors.name },
	NvimTreeGitDirtyIcon = { fg = colors.yellow },
	NvimTreeGitStagedIcon = { fg = colors.green },
	NvimTreeSpecialFile = { fg = colors.yellow },

	MarkSignNumHl = {},

	-- Terminal colors
	TermCursor = { fg = scolors.bg, bg = scolors.em },
	terminalBlack = scolors.bg,
	terminalRed = colors.red,
	terminalGreen = colors.green,
	terminalYellow = colors.yellow,
	terminalBlue = scolors.em,
	terminalMagenta = "#C792EA",
	terminalCyan = "#19c4e6",
	terminalWhite = scolors.string,
	terminalBrightBlack = "#575656",
	terminalBrightRed = "#eb4a47",
	terminalBrightGreen = colors.green,
	terminalBrightYellow = colors.yellow,
	terminalBrightBlue = scolors.em,
	terminalBrightMagenta = "#C792EA",
	terminalBrightCyan = "#19c4e6",
	terminalBrightWhite = scolors.string,
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

-- vim.highlight.priorities.semantic_tokens = 75

apply_theme()

return blueberry
