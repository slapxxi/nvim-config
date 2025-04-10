require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = false,
    debounce = 25,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = "<M-l>",
      next = false,
      prev = false,
      dismiss = false,
    },
  },
})
