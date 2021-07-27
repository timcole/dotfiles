nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap rn :lua vim.lsp.buf.rename()<CR>
nnoremap <C-k> :lua vim.lsp.buf.hover()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set completeopt=menuone,noselect
set shortmess+=c

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:false

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

lua require'lspconfig'.rust_analyzer.setup{  }
lua require'lspconfig'.tsserver.setup{  }
lua require'lspconfig'.gopls.setup{  }
lua require'lspconfig'.graphql.setup{  }
lua require'lspconfig'.dockerls.setup{  }
lua require'lspconfig'.elixirls.setup{ cmd = { "/Users/tim/Documents/elixir-ls/language_server.sh" }; }
" Literally unuseable https://github.com/neovim/nvim-lspconfig/issues/1043
" lua require'lspconfig'.prismals.setup{ }
