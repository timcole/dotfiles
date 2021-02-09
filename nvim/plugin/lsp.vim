set completeopt=menuone,noinsert,noselect

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap rn :lua vim.lsp.buf.rename()<CR>
nnoremap <S-k> :lua vim.lsp.buf.hover()<CR>)

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.rls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
