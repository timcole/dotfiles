local bufferline = require('bufferline')

bufferline.setup({
  highlights = {
    fill = { bg = "#161d25" },
  },
  options = {
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    modified_icon = "",
    -- tab_size = 22,
  },
})

vim.keymap.set("n", "<Tab>", '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set("n", "<S-Tab>", '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set("n", "<S-W>", '<cmd>bd!<cr>')

