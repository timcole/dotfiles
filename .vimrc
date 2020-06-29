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
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
call plug#end()

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
set background=dark
syntax on
set termguicolors
let g:one_allow_italics=1
let g:airline_theme='one'
let g:airline_powerline_fonts=1
color one
call one#highlight('Normal', '', '252830', 'none')
call one#highlight('SignColumn', '', '2c313a', 'none')
call one#highlight('CursorLine', '', '2c313a', 'none')
call one#highlight('CursorLineNr', '', '2c313a', 'none')
call one#highlight('CursorColumn', '', '2c313a', 'none')
call one#highlight('LineNr', '', '2c313a', 'none')
call one#highlight('VertSplit', '282c34', '282c34', 'none')
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

source ~/.go.vimrc
source ~/.coc.vimrc
source ~/.airline.vimrc
