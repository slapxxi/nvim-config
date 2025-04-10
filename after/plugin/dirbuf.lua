if (true) then
  -- vim.keymap.set("n", "<leader>e", ':Dirbuf<CR>')
  vim.keymap.set("n", "<leader>E", ':DirbufQuit<CR>')

  require("dirbuf").setup {
    hash_padding = 2,
    show_hidden = true,
    sort_order = "directories_first",
    write_cmd = "DirbufSync",
  }
end
