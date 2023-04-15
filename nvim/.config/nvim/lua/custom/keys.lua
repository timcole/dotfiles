vim.g.mapleader = ","
vim.keymap.set('n', '<leader>o', '<cmd>!tmux splitw -h -p 30 -c $(pwd)<cr><c-l>')
vim.keymap.set('n', '<leader>t', '<cmd>!tmux send-keys -t 1 C-c<cr><c-l>')

require('Comment').setup({
  mappings = {
    basic = true,
    extra = false,
  },
  toggler = {
    line = '<leader>c',
    block = '<leader>x',
  },
  opleader = {
    line = '<leader>c',
    block = '<leader>x',
  },
})
