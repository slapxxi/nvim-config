local colors = {
	gray = "#666c80", -- types
	gray_blue = "#858ba0", -- properties
	dark_gray = "#3e414c", -- comment
	punctuation_gray = "#3c3f4a", -- punctuation
	subtle_gray = "#252732", -- inactive fg

	gray_100 = "#f4f4f5",
	gray_200 = "#e4e4e7",
	-- gray_300 = "#b7c2d7", -- main text slate
	gray_300 = "#d4d4d8", -- main text zinc
	gray_400 = "#9f9fa9",
	gray_500 = "#848a9f", -- properties
	gray_600 = "#676d81", -- types
	gray_700 = "#414450", -- comment
	gray_800 = "#3b3e49", -- punctuation
	gray_900 = "#252732", -- inactive fg
	gray_950 = "#101012", -- bg
	gray_1000 = "#0a0a0c", -- dark bg

	-- white = "#fdfdfd", -- neutral
	-- white = "#f9fafb", -- gray
	white = "#fafaf9", -- stone

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

	red = "#fb2c36",
	red_pastel = "#f87171",
	red_vscode = "#f14c4c",

	pink = "#f8c1c1",

	green = "#98ff35",
	green_pastel = "#90EE90",

	copilot = "#434a69",
}

-- semantic colors
local scolors = {
	backdrop = colors.gray_1000,
	bg = colors.gray_950,
	builtin = colors.light_blue_a,
	call = colors.blue_500,
	class = colors.gray_500,
	comment = colors.gray_700,
	constant = colors.light_blue,
	enumMember = colors.gray_500,
	error = colors.pink,
	event = colors.gray_500,
	fg = colors.gray_300,
	fn = colors.gray_500,
	highlight = colors.blue_800,
	highlight_debug = colors.blue_900,
	interface = colors.gray_500,
	keyword = colors.blue_500,
	line = "#151518",
	literal = colors.light_blue,
	macro = colors.gray_500,
	method = colors.gray_500,
	modifier = colors.gray_500,
	name = colors.white,
	number = colors.teal,
	operator = colors.gray_500,
	property = colors.gray_500,
	punctuation = colors.gray_800,
	statement = colors.blue,
	string = colors.gray_400,
	struct = colors.gray_500,
	success = colors.green,
	text = colors.gray_300,
	type = colors.gray_600,
	variable = colors.gray_300,
	warn = colors.yellow_pastel,
}

local M = {}

M.colors = colors
M.scolors = scolors

return M
