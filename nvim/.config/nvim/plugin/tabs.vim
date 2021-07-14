nmap <Tab> :bn<cr>
nmap <S-Tab> :bp<cr>
nmap <S-W> :bd<cr>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

let g:buffet_use_devicons = 1
let g:buffet_always_show_tabline = 0
let g:buffet_tab_icon = ' +'

function! g:BuffetSetCustomColors()
  hi! BuffetBuffer guibg=#2c2e34 guifg=White
  hi! BuffetTab guibg=#2c2e34 guifg=White
  hi! BuffetCurrentBuffer guibg=#76cce0 guifg=Black
endfunction
