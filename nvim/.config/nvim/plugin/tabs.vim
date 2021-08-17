nmap <Tab> :BufferLineCycleNext<cr>
nmap <S-Tab> :BufferLineCyclePrev<cr>
nmap <S-W> :bd<cr>

lua << EOF
require("bufferline").setup{}
EOF
