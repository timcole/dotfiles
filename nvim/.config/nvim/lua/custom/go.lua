local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require ('go').setup({
  goimport = 'gopls',
  gofmt = 'gopls',
  max_line_len = 120,
  tag_transform = false,
  lsp_cfg = {
    capabilities = capabilities,
  },
  lsp_inlay_hints = {
    enable = true,
    only_current_line = true,
  },
  lsp_gofumpt = true,
  lsp_on_attach = true,
  dap_debug = false,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
