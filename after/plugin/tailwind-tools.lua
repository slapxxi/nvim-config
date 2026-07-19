vim.keymap.set("n", "<leader>tws", ":TailwindSort<CR>")

require("tailwind-tools").setup({
	document_color = {
		enabled = true, -- can be toggled by commands
		kind = "inline", -- "inline" | "foreground" | "background"
		inline_symbol = "󰝤 ", -- only used in inline mode
		debounce = 200, -- in milliseconds, only applied in insert mode
	},
	server = {
		override = true, -- Important: Let tailwind-tools handle the setup
		settings = {
			tailwindCSS = {
				experimental = {
					classRegex = {
						-- Enables autocomplete within Vue bound classes :class="... "
						{ "class=\x22([^\x22]*)\x22", "([^ ]*)" },
						{ ":class=\x22([^\x22]*)\x22", "([^ ]*)" },
					},
				},
			},
		},
	},
})
