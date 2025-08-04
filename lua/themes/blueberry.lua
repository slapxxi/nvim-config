-- local bg = "#0e0e12"

local bg = "#0e0e11"
local dark_gray = "#3b3e54" -- comments

local colors = {
	bg = bg,
	sidebar_bg = bg,
	status_bg = bg,
	line_bg = "#141419",

	fg = "#afbadd", -- main text
	gray = "#616785", -- properties
	dark_gray = dark_gray, -- Punctuation, inactive elements
	subtle_gray = "#252634", -- Inactive foreground

	blue = "#1166ff", -- primary accent color
	light_blue = "#1ab2ff", -- Secondary accent (e.g., constants)

	yellow = "#f0c82a", -- JSON properties, regex
	yellow_pastel = "#ffe08c", -- Softer, more pastel yellow

	red = "#ff3c1a", -- Errors
	red_pastel = "#ff8a75", -- Softer, more pastel red

	green = "#98ff35",
	green_pastel = "#90EE90",

	white = "#f6f8ff", -- Main text color

	copilot = "#434a6d",
	highlight = "#0a2556", -- Selection highlights
	comment = dark_gray, -- Comments
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
	Search = { bg = colors.yellow, fg = colors.bg }, -- editor.findMatchBackground
	IncSearch = { bg = colors.blue }, -- editor.findMatchHighlightBackground
	StatusLine = { fg = colors.dark_gray, bg = colors.status_bg },
	StatusLineNC = { fg = colors.subtle_gray, bg = colors.status_bg },
	VertSplit = { fg = colors.gray }, -- sideBar.border
	Pmenu = { fg = colors.fg, bg = colors.subtle_gray }, -- editorSuggestWidget.background
	PmenuSel = { bg = colors.yellow, fg = colors.bg }, -- editorSuggestWidget.selectedBackground
	WildMenu = { fg = colors.white, bg = colors.blue },
	SnippetTabStop = { fg = colors.text, bg = colors.yellow },
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
	NonText = { fg = colors.fg },

	Directory = { fg = colors.blue },

	TelescopeBorder = { fg = colors.dark_gray },

	-- CmpSel = { bg = colors.red },
	-- CmpItemAbbr = { bg = colors.yellow },
	-- CmpItemAbbrMatch = { bg = colors.yellow, fg = colors.white },
	-- CmpItemKind = { bg = colors.yellow },
	-- CmpItemMenu = { bg = colors.yellow },

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
	LspReferenceText = { fg = colors.bg, bg = colors.yellow },

	-- LSP diagnostics
	-- DiagnosticsError = { fg = colors.red },
	-- DiagnosticsWarn = { fg = colors.red },
	-- DiagnosticsInfo = { fg = colors.red },
	-- DiagnosticsHint = { fg = colors.red },
	DiagnosticUnnecessary = { fg = colors.gray, underline = true },
	DiagnosticUnderlineError = { fg = colors.red_pastel, underline = true },
	DiagnosticUnderlineWarn = { fg = colors.yellow_pastel, underline = true },

	LspDiagnosticsDefaultError = { fg = colors.red, bg = colors.bg },
	LspDiagnosticsDefaultWarning = { fg = colors.yellow, bg = colors.bg },
	LspDiagnosticsDefaultInformation = { fg = colors.light_blue, bg = colors.bg },
	LspDiagnosticsDefaultHint = { fg = colors.gray, bg = colors.bg },

	-- LSP floating windows
	LspFloatWinNormal = { fg = colors.fg, bg = colors.red },
	LspFloatWinBorder = { fg = colors.dark_gray, bg = colors.red },

	-- LSP signature help
	LspSignatureActiveParameter = { fg = colors.white, bg = colors.bg, bold = true },

	-- Markdown
	RenderMarkdownCode = { bg = colors.line_bg },
	markdownBold = { fg = colors.fg, bold = true },
	markdownItalic = { fg = "#a2bffc", italic = true }, -- markup.changed
	markdownHeadingDelimiter = { fg = colors.blue },
	markdownBlockquote = { fg = colors.fg },

	TreesitterContext = { bg = colors.line_bg, fg = colors.bg },
	TreesitterContextLineNumber = { bg = colors.line_bg, fg = colors.white },

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

	["@tag.builtin"] = { fg = colors.fg },
	["@tag"] = { fg = colors.blue },
	["@tag.html"] = { fg = colors.light_blue },
	["@tag.attribute"] = { fg = colors.gray },
	["@tag.delimiter"] = { fg = colors.dark_gray },

	["@property.json"] = { fg = colors.yellow },
	["@property.jsonc"] = { fg = colors.yellow },

	["@variable"] = { fg = colors.fg }, -- optional: apply to all langs
	["@variable.member"] = { fg = colors.gray }, -- optional: apply to all langs
	["@variable.member.javascript"] = { fg = colors.gray },

	["@lsp.type.property"] = { fg = colors.gray },
	["@lsp.type.class"] = { fg = colors.blue },
	["@lsp.mod.declaration"] = { fg = colors.white },
	["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.gray },
	["@lsp.typemod.class.defaultLibrary"] = { fg = colors.white },
	["@lsp.typemod.property.declaration"] = { fg = colors.gray },
	["@_jsx_attribute"] = { fg = colors.light_blue },
	-- ["@lsp.typemod.class"] = { fg = colors.white },

	CopilotSuggestion = { fg = colors.copilot, italic = true },
	CodeiumSuggestion = { fg = colors.copilot, italic = true },

	qfFileName = { fg = colors.gray },
	qfText = { fg = colors.dark_gray },
	QuickFixLine = { fg = colors.blue },
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
