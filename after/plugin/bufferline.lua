local bufferline = require('bufferline')

-- vim.keymap.set('n', '<leader>w', ':BufferLinePickClose<CR>')

vim.keymap.set('n', '<leader>[', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>]', ':BufferLineCycleNext<CR>')

vim.keymap.set('n', '<leader>{', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', '<leader>}', ':BufferLineMoveNext<CR>')

vim.keymap.set('n', '<leader><leader>', ':BufferLinePick<CR>')

vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>')

bufferline.setup {
  options = {
    mode = 'buffers',
    themable = true,
    modified_icon = '● ',
    close_icon = ' ',
    buffer_close_icon = '×',
    left_trunc_marker = ' ',
    close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    }
  }
}
