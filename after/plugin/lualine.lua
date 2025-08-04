local bg = "#0e0e11"
local dark_gray = "#3b3e51" -- comments

local colors = {
	bg = bg,
	sidebar_bg = bg,
	status_bg = bg,
	line_bg = "#141419",

	fg = "#afbadd", -- main text
	gray = "#616786", -- properties
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

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "auto",
		-- theme = "iceberg_dark",
		theme = {
			normal = { c = { fg = colors.gray, bg = colors.bg } },
		},
		component_separators = {},
		section_separators = {},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { { "mode", color = { fg = colors.dark_gray } } },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", file_status = false, path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { { "progress", color = { fg = colors.gray } } },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
