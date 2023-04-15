local lsp = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

local defaults = lsp.util.default_config

defaults.capabilities = vim.tbl_deep_extend(
  'force',
  defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(args)
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true, remap = false }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap("n", "gd", function() vim.lsp.buf.definition() end)
    bufmap("n", "rn", function() vim.lsp.buf.rename() end)
    bufmap("n", "<C-k>", function() vim.lsp.buf.hover() end)

    local client = vim.lsp.get_client_by_id(args.data.client_id)

    client.server_capabilities.semanticTokensProvider = nil
  end
})

vim.opt.completeopt = {'menuone', 'noselect'}

require("mason").setup()
require("mason-lspconfig").setup()

lsp.rust_analyzer.setup{
  procMacro = {
    enable = true
  }
}
lsp.tsserver.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern("package.json")
}
lsp.denols.setup {
  on_attach = on_attach,
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc")
}
lsp.graphql.setup{}
lsp.dockerls.setup{}
lsp.prismals.setup{}
lsp.tailwindcss.setup{}
lsp.bufls.setup{}

require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered()
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})
