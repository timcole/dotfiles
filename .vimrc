set encoding=UTF-8
set clipboard=unnamedplus
filetype plugin indent on
filetype plugin on

call plug#begin(stdpath('data') . '/plugged')
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', {'do':':GoInstallBinaries'}
Plug 'tpope/vim-commentary'
" Plug 'airblade/vim-gitgutter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
Plug 'puremourning/vimspector'
call plug#end()

let g:vimspector_enable_mappings = 'HUMAN'
let g:mkdp_browser = 'safari'

if !has("gui_running")
  set t_Co=256
endif

let mapleader = ","
set mouse=a
set nowrap
set textwidth=0
set wrapmargin=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nosmarttab
set autoindent
set sw=2
set go-=T
set go-=m
set ls=2
set completeopt-=preview
" syntax on
set termguicolors
let g:one_allow_italics=1
let g:airline_theme='one'
let g:airline_powerline_fonts=1

set background=dark
color one
if &background ==# 'dark'
  call one#highlight('Normal', '', '0F1219', 'none')
  call one#highlight('SignColumn', '', '161D26', 'none')
  call one#highlight('CursorLine', '', '161D26', 'none')
  call one#highlight('CursorLineNr', '', '161D26', 'none')
  call one#highlight('CursorColumn', '', '161D26', 'none')
  call one#highlight('LineNr', '', '161D26', 'none')
  call one#highlight('VertSplit', '0F141A', '0F141A', 'none')
  call one#highlight('NonText', '1D2632', '', 'none')
  call one#highlight('SpecialKey', '1D2632', '', 'none')
  call one#highlight('Keyword', '', '', 'italic')
  call one#highlight('DiffAdd', '52ACB8', '', '')
endif

set visualbell
set list
set title
set autoread
set ttimeoutlen=0
set updatetime=50
set nu rnu
set nowrap
set incsearch
set showmatch
set hlsearch
set smartcase
set ignorecase
set cursorline
set showtabline=2
set noshowmode

set backspace=indent,eol,start
set listchars=space:·,tab:→\ 

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

function! MakeDirIfNoExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

imap <C-L> <C-O>$

nmap <C-P> :Files<cr>

set exrc
set secure

nmap <leader>s :source ~/.vimrc<cr>

nmap <silent> <Leader>w :update<cr>

" Switch Tabs
nmap <Tab> :bnext<cr>
nmap <S-Tab> :bprev<cr>
nmap <S-W> :bd<cr>

nmap <C-w> :q<cr>

nmap <C-l> :set spell! spelllang=en_us<cr>

let g:rustfmt_autosave = 1
autocmd FileType rust setlocal ts=2 sw=2 expandtab equalprg=rustfmt
" Create debug split
nnoremap <leader>o :!tmux splitw -h -p 30 -c $(pwd)<CR><C-L>
" Run Ctrl-C to kill running process, then cargo run
nnoremap <leader>r :!tmux send-keys -t 1 C-c "clear; cargo run" C-m<CR><C-L>
" Run Ctrl-C in debug pane
nnoremap <leader>t :!tmux send-keys -t 1 C-c<CR><C-L>

set inccommand=split
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

source ~/.go.vimrc
source ~/.coc.vimrc
source ~/.airline.vimrc
