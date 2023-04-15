require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    buffer_close_icon = ''
  },
})

vim.keymap.set("n", "<Tab>", '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set("n", "<S-Tab>", '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set("n", "<S-W>", '<cmd>bd!<cr>')

