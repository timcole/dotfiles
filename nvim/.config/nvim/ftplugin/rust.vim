let g:rustfmt_autosave = 1
let g:rust_recommended_style = v:false

autocmd FileType rust setlocal ts=2 sw=2 expandtab equalprg=rustfmt

nnoremap <leader>r :!tmux send-keys -t 1 C-c "clear; cargo run" C-m<CR><C-L>
