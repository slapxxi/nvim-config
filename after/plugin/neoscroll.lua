if true then
	local neoscroll = require("neoscroll")

	local keymap = {
		["<C-d>"] = function()
			neoscroll.ctrl_d({ duration = 50, easing = "sine" })
		end,
		["<C-u>"] = function()
			neoscroll.ctrl_u({ duration = 50, easing = "sine" })
		end,
		["<C-b>"] = function()
			neoscroll.ctrl_b({ duration = 450, easing = "circular" })
		end,
		["<C-f>"] = function()
			neoscroll.ctrl_f({ duration = 450, easing = "circular" })
		end,
		["zz"] = function()
			neoscroll.zz({ half_win_duration = 75 })
		end,
		["zt"] = function()
			neoscroll.zt({ half_win_duration = 75 })
		end,
		["zb"] = function()
			neoscroll.zb({ half_win_duration = 75 })
		end,
	}

	local modes = { "n", "v", "x" }
	for key, func in pairs(keymap) do
		vim.keymap.set(modes, key, func)
	end
end
