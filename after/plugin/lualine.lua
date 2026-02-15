local theme = require("slapxxi.theme")
local colors = theme.colors

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
			{
				function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
				end,
				-- icon = "󰉋", -- Optional: add a folder icon
			},
			-- "encoding",
			-- "fileformat",
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
