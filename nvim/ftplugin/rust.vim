let g:rustfmt_autosave = 1

nnoremap <leader>r :!tmux send-keys -t 1 C-c "clear; cargo run" C-m<CR><C-L>
