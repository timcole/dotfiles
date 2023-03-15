local lsp = require('lspconfig')

lsp.rust_analyzer.setup{
  procMacro = {
    enable = true
  }
}
lsp.tsserver.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern("package.json"),
  single_file_support = false,
}
lsp.denols.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
}
lsp.gopls.setup{  }
lsp.graphql.setup{  }
lsp.dockerls.setup{  }
lsp.elixirls.setup{ cmd = { "/Users/tim/Documents/elixir-ls/language_server.sh" }; }
lsp.prismals.setup{ }
lsp.zls.setup{ cmd = { "/Users/tim/zls/zls" }; }
lsp.tailwindcss.setup{}
