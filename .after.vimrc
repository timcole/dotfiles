let g:onedark_termcolors=256

set rtp+=$GOROOT/misc/vim
filetype plugin indent on

set background=dark
syntax on
set termguicolors
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
colorscheme onedark

set visualbell

set clipboard=unnamedplus

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Go
set backspace=indent,eol,start

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1

" NERDTree
nnoremap <C-\> :NERDTreeToggle<CR>

" Switch Tabs
nmap <S-Tab> gt

" Open terminal
noremap <C-d> :sh<cr>

" Automatically open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree if it's the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP Ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|vendor)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_working_path_mode = 'ca'
