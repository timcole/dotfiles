set backspace=indent,eol,start

nnoremap <leader>r :!tmux send-keys -t 1 C-c "clear; go run *.go" C-m<CR><C-L>
