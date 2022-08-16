local lsp = require('lspconfig')

lsp.rust_analyzer.setup{  }
lsp.tsserver.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern("package.json"),
}
-- lsp.denols.setup {
--   on_attach = on_attach,
--   root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }
lsp.gopls.setup{  }
lsp.graphql.setup{  }
lsp.dockerls.setup{  }
lsp.elixirls.setup{ cmd = { "/Users/tim/Documents/elixir-ls/language_server.sh" }; }
lsp.prismals.setup{ }
lsp.astro.setup{}
lsp.zls.setup{ cmd = { "/Users/tim/zls/zls" }; }
