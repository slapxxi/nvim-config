if true then
	require("parrot").setup({
		show_context_hints = true,
		hooks = {
			CompleteFullContext = function(prt, params)
				local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{filecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
				local model_obj = prt.get_model("command")
				prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
			end,
			CodeConsultant = function(prt, params)
				local chat_prompt = [[
          Your task is to analyze the provided {{filetype}} code and suggest
          improvements to optimize its performance. Identify areas where the
          code can be made more efficient, faster, or less resource-intensive.
          Provide specific suggestions for optimization, along with explanations
          of how these changes can enhance the code's performance. The optimized
          code should maintain the same functionality as the original code while
          demonstrating improved efficiency.

          Here is the code
          ```{{filetype}}
          {{filecontent}}
          ```
        ]]
				prt.ChatNew(params, chat_prompt)
			end,
		},
		providers = {
			anthropic = {
				api_key = os.getenv("ANTHROPIC_API_KEY"),
			},
			gemini = {
				api_key = os.getenv("GEMINI_API_KEY"),
			},
			groq = {
				api_key = os.getenv("GROQ_API_KEY"),
			},
			mistral = {
				api_key = os.getenv("MISTRAL_API_KEY"),
			},
			pplx = {
				api_key = os.getenv("PERPLEXITY_API_KEY"),
			},
			-- provide an empty list to make provider available (no API key required)
			ollama = {},
			openai = {
				api_key = os.getenv("OPENAI_API_KEY"),
			},
			github = {
				api_key = os.getenv("GITHUB_TOKEN"),
			},
			nvidia = {
				api_key = os.getenv("NVIDIA_API_KEY"),
			},
			xai = {
				api_key = os.getenv("XAI_API_KEY"),
			},
		},
	})
end
