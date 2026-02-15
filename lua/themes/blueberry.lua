local theme = require("slapxxi.theme")
local colors = theme.colors
local scolors = theme.scolors

local blueberry = {
	-- Basic UI elements
	Normal = { fg = scolors.fg, bg = scolors.bg },
	NormalFloat = { fg = colors.blue_500 }, -- Floating windows
	WinSeparator = { fg = scolors.comment },
	Cursor = { fg = scolors.bg, bg = colors.blue },
	CursorLine = { bg = scolors.line },
	LineNr = { fg = scolors.comment },
	CursorLineNr = { fg = colors.blue_500 },
	Visual = { bg = scolors.highlight },
	Search = { bg = colors.yellow_transparent, fg = scolors.bg }, -- editor.findMatchBackground
	IncSearch = { bg = colors.blue_500, fg = scolors.string }, -- editor.findMatchHighlightBackground
	StatusLine = { fg = scolors.comment, bg = scolors.bg },
	StatusLineNC = { fg = colors.subtle_gray, bg = scolors.bg },
	VertSplit = { fg = colors.gray }, -- sideBar.border
	Pmenu = { fg = scolors.fg, bg = colors.subtle_gray }, -- editorSuggestWidget.background
	PmenuSel = { bg = colors.yellow, fg = scolors.bg }, -- editorSuggestWidget.selectedBackground
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
	Delimiter = { fg = scolors.punctuation }, -- Embedded, constants
	Error = { fg = colors.red }, -- Errors
	Todo = { fg = colors.yellow, bg = scolors.bg },
	Folded = { fg = scolors.comment },
	SpecialKey = { fg = scolors.comment },
	NonText = { fg = scolors.fg },

	TabLine = { fg = scolors.comment, bg = scolors.backdrop },
	TabLineFill = { fg = scolors.comment, bg = scolors.backdrop },
	TabLineSel = { fg = colors.gray, bg = scolors.bg },

	Directory = { fg = colors.blue },

	qfFileName = { fg = colors.gray },
	qfText = { fg = scolors.comment },
	QuickFixLine = { fg = colors.blue },

	-- Diff
	DiffAdd = { bg = scolors.bg, fg = colors.green_pastel },
	DiffDelete = { bg = scolors.bg, fg = colors.red_pastel },
	DiffChange = { bg = scolors.bg, fg = colors.yellow_pastel },
	DiffText = { bg = scolors.bg, fg = scolors.fg },

	-- Git
	GitSignsAdd = { fg = "#addb67" }, -- gitDecoration.untrackedResourceForeground
	GitSignsChange = { fg = "#555770" }, -- gitDecoration.modifiedResourceForeground
	GitSignsDelete = { fg = "#EF5350" }, -- gitDecoration.deletedResourceForeground

	FugitiveBlameTime = { fg = colors.gray },

	-- LSP
	LspReferenceText = { fg = scolors.bg, bg = colors.pale_blue },

	-- LSP diagnostics
	DiagnosticUnnecessary = { fg = colors.gray, undercurl = true },
	DiagnosticUnderlineError = { fg = colors.red_pastel, underline = true },
	DiagnosticUnderlineWarn = { fg = colors.yellow_pastel, undercurl = true },

	LspDiagnosticsDefaultError = { fg = colors.red, bg = scolors.bg },
	LspDiagnosticsDefaultWarning = { fg = colors.yellow, bg = scolors.bg },
	LspDiagnosticsDefaultInformation = { fg = colors.light_blue, bg = scolors.bg },
	LspDiagnosticsDefaultHint = { fg = colors.gray, bg = scolors.bg },

	-- LSP floating windows
	LspFloatWinNormal = { fg = scolors.fg, bg = colors.red },
	LspFloatWinBorder = { fg = scolors.comment, bg = colors.red },

	-- LSP signature help
	LspSignatureActiveParameter = { fg = colors.white, bg = scolors.bg, bold = true },

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
	["@tag.builtin"] = { fg = scolors.fg },
	["@tag.html"] = { fg = colors.light_blue },
	["@tag.attribute"] = { fg = scolors.property },
	["@tag.delimiter"] = { fg = scolors.comment },

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
	javascriptParens = scolors.comment,

	-- Lua
	["@lsp.type.parameter.lua"] = { fg = colors.blue },

	-- Markdown
	RenderMarkdownCode = { bg = scolors.line },
	markdownBold = { fg = scolors.fg, bold = true },
	markdownItalic = { fg = "#a2bffc", italic = true }, -- markup.changed
	markdownHeadingDelimiter = { fg = colors.blue },
	markdownBlockquote = { fg = scolors.fg },

	-- Plugins
	CopilotSuggestion = { fg = colors.copilot, italic = true },
	CodeiumSuggestion = { fg = colors.copilot, italic = true },

	HlSearchLens = { bg = colors.highlight, fg = colors.gray },

	TelescopeBorder = { fg = scolors.comment },
	TelescopeSelection = { bg = colors.highlight, fg = colors.white, bold = true },

	TreesitterContext = { bg = scolors.line, fg = scolors.bg },
	TreesitterContextLineNumber = { bg = scolors.line, fg = colors.white },

	DapBreakpoint = { fg = colors.red, bg = scolors.bg },
	DapBreakpointCondition = { fg = colors.yellow, bg = scolors.bg },
	DapStopped = { bg = colors.highlight_debug },
	DapStoppedNumHl = { fg = colors.blue, bg = scolors.bg },

	NvimTreeSymlink = { bg = colors.blue, fg = colors.text },
	NvimTreeImageFile = { bg = colors.blue, fg = colors.text },
	NvimTreeExecFile = { bg = colors.blue, fg = colors.text },
	NvimTreeRootFolder = { fg = colors.gray },
	NvimTreeIndentMarker = { fg = scolors.comment },
	NvimTreeFolderName = { fg = colors.gray },
	NvimTreeFolderIcon = { fg = scolors.comment },
	NvimTreeOpenedFolderIcon = { fg = colors.white },
	NvimTreeOpenedFolderName = { fg = colors.white },
	NvimTreeGitDirtyIcon = { fg = colors.yellow },
	NvimTreeGitStagedIcon = { fg = colors.green },
	NvimTreeSpecialFile = { fg = colors.yellow },

	MarkSignNumHl = {},

	-- Terminal colors
	TermCursor = { fg = scolors.bg, bg = colors.blue },
	terminalBlack = scolors.bg,
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

apply_theme()

return blueberry
