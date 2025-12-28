local bg = "#0e0e10"
local dark_gray = "#3d4054" -- comments

local colors = {
	bg = bg,
	sidebar_bg = bg,
	status_bg = bg,
	line_bg = "#141418",

	fg = "#b1bcdc", -- main text
	gray = "#676d8a", -- properties
	gray_blue = "#8389AA", -- properties
	dark_gray = dark_gray, -- Punctuation, inactive elements
	subtle_gray = "#252734", -- Inactive foreground

	blue = "#1166ff", -- primary accent color
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
		lualine_b = { "grapple", "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", file_status = false, path = 1 } },
		lualine_x = {
			{
				function()
					return "󰨰 " .. require("dap").status()
				end,
				cond = function()
					return package.loaded["dap"] and require("dap").status() ~= ""
				end,
				color = { fg = colors.light_blue },
			},
			"encoding",
			"fileformat",
			"filetype",
		},
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
	extensions = { "nvim-dap-ui" },
})
