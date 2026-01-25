if true then
	require("git-worktree").setup({
		-- change_directory_command = <str> -- default: "cd",
		change_directory_command = "tcd",
		-- update_on_change = <boolean> -- default: true,
		-- update_on_change_command = <str> -- default: "e .",
		-- clearjumps_on_change = <boolean> -- default: true,
		-- autopush = <boolean> -- default: false,
	})

	require("telescope").load_extension("git_worktree")

	local extensions = require("telescope").extensions

	vim.keymap.set("n", "<leader>fww", extensions.git_worktree.git_worktrees, {})
	vim.keymap.set("n", "<leader>fwl", extensions.git_worktree.git_worktrees, {})
	vim.keymap.set("n", "<leader>fwc", extensions.git_worktree.create_git_worktree, {})
end
