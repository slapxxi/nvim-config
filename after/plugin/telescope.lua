local builtin = require("telescope.builtin")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }

vim.keymap.set("n", "<C-p>", function()
	require("telescope.builtin").find_files({
		find_command = find_command,
	})
end, { desc = "Go to file (includes ignored)" })

vim.keymap.set("n", "<leader>ff", function()
	local git_root = vim.fs.root(0, ".git")
	local opts = require("telescope.themes").get_ivy({ cwd = git_root or vim.fn.getcwd() })
	require("telescope.builtin").find_files(opts)
end, { desc = "Go to file (includes ignored)" })

vim.keymap.set("n", "<leader>fa", function()
	local git_root = vim.fs.root(0, ".git")
	require("telescope.builtin").find_files({
		cwd = git_root or vim.fn.getcwd(),
		find_command = find_command,
	})
end, { desc = "Go to file (includes ignored)" })

vim.keymap.set("n", "<leader>fr", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fr", builtin.resume, {})
vim.keymap.set("n", "<leader>fm", builtin.marks, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})

vim.keymap.set("n", "<leader>fll", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fls", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>flw", builtin.lsp_workspace_symbols, {})
vim.keymap.set("n", "<leader>flr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fld", builtin.diagnostics, {})

vim.keymap.set("n", "<leader>fgg", builtin.git_files)
vim.keymap.set("n", "<leader>fgs", builtin.git_status, {})
vim.keymap.set("n", "<leader>fgc", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>fgf", builtin.git_files)

require("telescope").load_extension("fzf")

require("telescope").load_extension("frecency")
vim.keymap.set("n", "<leader>fe", ":Telescope frecency workspace=CWD<CR>", {})

require("telescope").load_extension("dap")
vim.keymap.set("n", "<leader>fdv", ":Telescope dap variables<CR>", {})
vim.keymap.set("n", "<leader>fdf", ":Telescope dap frames<CR>", {})
vim.keymap.set("n", "<leader>fdc", ":Telescope dap commands<CR>", {})
vim.keymap.set("n", "<leader>fdb", ":Telescope dap list_breakpoints<CR>", {})

require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true, --[[ theme = "ivy" ]]
		},
	},
	extensions = { fzf = {} },
	defaults = {
		sorting_strategy = "ascending", -- display results top->bottom
		layout_config = {
			prompt_position = "top", -- search bar at the top
		},
		mappings = {
			n = {
				-- ["<M-b>"] = require("telescope.actions").preview_scrolling_up,
				-- ["<M-f>"] = require("telescope.actions").preview_scrolling_down,
				["<M-d>"] = require("telescope.actions").delete_buffer,
			},
			i = {
				["<M-d>"] = require("telescope.actions").delete_buffer,
			},
		},
	},
})

local function multigrep(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.fn.getcwd()

	local finder = finders.new_async_job({
		cwd = opts.cwd,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local pieces = vim.split(prompt, "  ")
			local args = { "rg" }

			if pieces[1] then
				table.insert(args, "-e")
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, "-g")
				table.insert(args, pieces[2])
			end

			return vim.tbl_flatten({
				args,
				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
			})
		end,
	})

	pickers
		.new(opts, {
			debounce = 100,
			prompt_title = "Multi Grep",
			finder = finder,
			previewer = conf.grep_previewer({}),
			sorter = require("telescope.sorters").empty(),
		})
		:find()
end

vim.keymap.set("n", "<leader>fmg", multigrep)
