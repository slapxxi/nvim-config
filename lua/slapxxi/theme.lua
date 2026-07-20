local colors = {
	gray = "#666c80", -- types
	gray_blue = "#858ba0", -- properties
	dark_gray = "#3e414c", -- comment
	punctuation_gray = "#3c3f4a", -- punctuation
	subtle_gray = "#252732", -- inactive fg

	-- custom grays (all over the place)
	gray_100 = "#f4f4f5",
	gray_200 = "#e4e4e7",
	gray_300 = "#b7c2d7", -- foreground
	gray_400 = "#9aa1ae", -- strings
	gray_500 = "#848a9f", -- properties
	gray_600 = "#676d81", -- types
	gray_700 = "#414450", -- comment
	gray_800 = "#3b3e49", -- punctuation
	gray_900 = "#252732", -- inactive fg
	gray_950 = "#101012", -- background
	gray_1000 = "#0a0a0c", -- dark background

	slate_300 = "#ccd5e1",
	slate_400 = "#93a0b7",
	slate_500 = "#65738c",
	slate_600 = "#48556b",
	slate_700 = "#344156",
	slate_800 = "#1f283c",

	g_300 = "#d2d5db",
	g_400 = "#9aa1ae",
	g_450 = "#848a9f",
	g_500 = "#6b7281",
	g_600 = "#52525c",
	g_700 = "#384152",
	g_800 = "#202938",

	zinc_200 = "#e4e4e7",
	zinc_300 = "#d4d4d8",
	zinc_400 = "#9f9fa9",
	zinc_500 = "#71717b",
	zinc_600 = "#52525c",
	zinc_700 = "#3f3f46",
	zinc_800 = "#27272a",
	zinc_925 = "#101012",
	zinc_950 = "#09090b",

	neutral_300 = "#d4d4d4",
	neutral_400 = "#a1a1a1",
	neutral_500 = "#737373",
	neutral_600 = "#525252",
	neutral_700 = "#404040",
	neutral_800 = "#262626",

	stone_300 = "#d6d3d1",
	stone_400 = "#a5a09c",
	stone_500 = "#77716c",
	stone_600 = "#57534e",
	stone_700 = "#44403c",
	stone_800 = "#282524",

	taupe_300 = "#d6d3d1",
	taupe_400 = "#a9a19c",
	taupe_500 = "#7a6e68",
	taupe_600 = "#59504c",
	taupe_700 = "#453d3a",
	taupe_800 = "#2a2422",

	white = "#fdfdfd", -- custom
	slate_white = "#f8fafc",
	g_white = "#f9fafb",
	zinc_white = "#fafafa",
	neutral_white = "#fafafa",
	stone_white = "#fafaf9",
	taupe_white = "#fbfaf9",

	blue_400 = "#1ab2ff", -- Secondary accent (e.g., constants)
	blue_500 = "#1166ff", -- primary accent color
	blue_650 = "#1166ff", -- primary accent color
	blue_800 = "#0f2958", -- Selection highlights
	blue_900 = "#122132",

	blue = "#1166ff", -- primary accent color
	blue_darker = "#0e5ae0",
	pale_blue = "#629aff",

	sky_450 = "#00a2f5",
	sky_500 = "#1ab2ff",

	teal = "#42C5D7",

	yellow = "#f0c82a", -- JSON properties, regex
	yellow_pastel = "#ffe08c", -- Softer, more pastel yellow
	yellow_transparent = "#ceac27", -- Softer, more pastel yellow

	orange = "#ff6633",

	red = "#fb2c36",
	red_pastel = "#f87171",
	red_vscode = "#f14c4c",
	red_200 = "#f8ccca",

	pink = "#f8c1c1",
	rose_200 = "#f7cfd3",
	rose_300 = "#f5a7ae",
	rose_350 = "#f38b94",
	rose_400 = "#f17280",

	maroon_300 = "#ea999c",
	maroon_500 = "#e64553",

	green = "#98ff35",
	green_pastel = "#90EE90",

	copilot = "#434a69",
}

-- semantic colors
local scolors = {
	backdrop = colors.gray_1000,
	bg = colors.zinc_925,
	builtin = colors.sky_450,
	call = colors.blue_650,
	class = colors.g_450,
	comment = colors.gray_700,
	constant = colors.sky_500,
	em = colors.blue_650,
	enumMember = colors.g_450,
	error = colors.maroon_300,
	event = colors.g_450,
	fg = colors.zinc_300,
	fn = colors.g_450,
	highlight = colors.blue_800,
	highlight_debug = colors.blue_900,
	interface = colors.g_450,
	json = colors.yellow,
	keyword = colors.blue_650,
	line = "#151518",
	literal = colors.sky_500,
	macro = colors.g_450,
	method = colors.g_450,
	modifier = colors.g_450,
	name = colors.white,
	number = colors.teal,
	operator = colors.g_450,
	property = colors.g_450,
	punctuation = colors.gray_800,
	statement = colors.blue,
	string = colors.neutral_400,
	struct = colors.g_450,
	success = colors.green,
	type = colors.gray_600,
	variable = colors.zinc_300,
	warn = colors.yellow_pastel,
}

local M = {}

M.colors = colors
M.scolors = scolors

return M
