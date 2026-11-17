if true then
	require("minuet").setup({
		provider = "openai_fim_compatible",
		n_completions = 1,
		provider_options = {
			openai_fim_compatible = {
				api_key = "DEEPSEEK_API_KEY",
				name = "deepseek",
				optional = {
					max_tokens = 256,
					top_p = 0.9,
				},
			},
		},
		virtualtext = {
			auto_trigger_ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "go", "lua" },
			keymap = {
				-- accept whole completion
				accept = "<Tab>",
				-- accept one line
				accept_line = "<C-j>",
				-- accept n lines (prompts for number)
				-- e.g. "A-z 2 CR" will accept 2 lines
				accept_n_lines = "<A-z>",
				-- Cycle to prev completion item, or manually invoke completion
				prev = "<A-[>",
				-- Cycle to next completion item, or manually invoke completion
				next = "<A-]>",
				dismiss = "<A-e>",
			},
		},
	})
end
