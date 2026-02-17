local colors = {
	gray = "#666c80", -- types
	gray_blue = "#858ba0", -- properties
	dark_gray = "#3e414c", -- comment
	punctuation_gray = "#3c3f4a", -- punctuation
	subtle_gray = "#252732", -- inactive fg

	gray_300 = "#b7c2d7", -- main text
	gray_500 = "#848a9f", -- properties
	gray_600 = "#676d81", -- types
	gray_700 = "#414450", -- comment
	gray_800 = "#3b3e49", -- punctuation
	gray_900 = "#252732", -- inactive fg
	gray_950 = "#101012", -- bg
	gray_1000 = "#0a0a0c", -- dark bg

	white = "#f6f8fa", -- strings color

	blue_500 = "#1166ff", -- primary accent color
	blue_400 = "#1ab2ff", -- Secondary accent (e.g., constants)
	blue_800 = "#0f2958", -- Selection highlights
	blue_900 = "#122132",

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

	copilot = "#434a69",
}

-- semantic colors
local scolors = {
	bg = colors.gray_950,
	fg = colors.gray_300,
	backdrop = colors.gray_1000,
	text = colors.gray_300,
	variable = colors.gray_300,
	type = colors.gray_600,
	property = colors.gray_500,
	enumMember = colors.gray_500,
	class = colors.gray_500,
	interface = colors.gray_500,
	struct = colors.gray_500,
	event = colors.gray_500,
	operator = colors.gray_500,
	fn = colors.gray_500,
	method = colors.gray_500,
	macro = colors.gray_500,
	keyword = colors.blue_500,
	modifier = colors.gray_500,
	comment = colors.gray_700,
	punctuation = colors.gray_800,
	statement = colors.blue,
	name = colors.white,
	number = colors.teal,
	constant = colors.light_blue,
	builtin = colors.light_blue_a,
	call = colors.blue_500,
	string = colors.white,
	highlight = colors.blue_800,
	highlight_debug = colors.blue_900,
	line = "#151518",
}

local M = {}

M.colors = colors
M.scolors = scolors

return M
