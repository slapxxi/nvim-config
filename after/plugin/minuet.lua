if true then
	require("vectorcode").setup({
		n_query = 1,
	})

	local has_vc, vectorcode_config = pcall(require, "vectorcode.config")
	local vectorcode_cacher = nil

	if has_vc then
		vectorcode_cacher = vectorcode_config.get_cacher_backend()
	end

	-- roughly equate to 2000 tokens for LLM
	local RAG_Context_Window_Size = 8000

	require("minuet").setup({
		provider = "openai_fim_compatible",
		n_completions = 1,
		context_window = 4096,
		provider_options = {
			openai_fim_compatible = {
				api_key = "DEEPSEEK_API_KEY",
				name = "deepseek",
				-- optional = {
				-- 	max_tokens = 256,
				-- 	top_p = 0.9,
				-- },
				-- vector code specific
				system = {
					template = "{{{prompt}}}\n{{{guidelines}}}\n{{{n_completion_template}}}\n{{{repo_context}}}",
					repo_context = [[9. Additional context from other files in the repository will be enclosed in <repo_context> tags. Each file will be separated by <file_separator> tags, containing its relative path and content.]],
				},
				chat_input = {
					template = "{{{repo_context}}}\n{{{language}}}\n{{{tab}}}\n<contextBeforeCursor>\n{{{context_before_cursor}}}<cursorPosition>\n<contextAfterCursor>\n{{{context_after_cursor}}}",
					repo_context = function(_, _, _)
						local prompt_message = ""
						if has_vc then
							local cache_result = vectorcode_cacher.query_from_cache(0)
							for _, file in ipairs(cache_result) do
								prompt_message = prompt_message
									.. "<file_separator>"
									.. file.path
									.. "\n"
									.. file.document
							end
						end

						prompt_message = vim.fn.strcharpart(prompt_message, 0, RAG_Context_Window_Size)

						if prompt_message ~= "" then
							prompt_message = "<repo_context>\n" .. prompt_message .. "\n</repo_context>"
						end
						return prompt_message
					end,
				},
			},
		},

		virtualtext = {
			auto_trigger_ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "go", "lua", "oil" },
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
