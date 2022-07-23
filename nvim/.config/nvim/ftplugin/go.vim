set backspace=indent,eol,start

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

nnoremap <leader>r :!tmux send-keys -t 1 C-c "clear; go run *.go" C-m<CR><C-L>
