nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap rn :lua vim.lsp.buf.rename()<CR>
nnoremap <S-k> :lua vim.lsp.buf.hover()<CR>)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_on_delete = 1
lua require'lspconfig'.rls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
