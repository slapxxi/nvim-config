if false then
	require("cursortab").setup({
		keymaps = {
			accept = "<Tab>", -- Keymap to accept completion, or false to disable
			partial_accept = "<C-j>", -- Keymap to partially accept, or false to disable
			trigger = false, -- Keymap to manually trigger completion, or false to disable
		},
		provider = {
			type = "fim",
			url = "https://deepseek.com",
			api_key_env = "DEEPSEEK_API_KEY",
			max_tokens = 256,
		},
	})
end
