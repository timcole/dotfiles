filetype plugin on

call plug#begin(stdpath('data') . '/plugged')
" Plug 'sainnhe/sonokai'
Plug 'rakr/vim-one'
Plug 'bagrat/vim-buffet'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-commentary'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact'] }

Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}
call plug#end()

if has('termguicolors')
  set termguicolors
endif
" let g:sonokai_style = 'default'
" let g:sonokai_enable_italic = 1
" let g:sonokai_transparent_background = 1
" let g:sonokai_menu_selection_background = "blue"
" colorscheme sonokai
set background=dark
color one
let g:one_allow_italics=1
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

set exrc
set secure
set clipboard=unnamedplus
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
set nu rnu
set incsearch
set inccommand=split
set showmatch
set showtabline=1

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

"Show spaces and tabs
set list
set listchars=space:·,tab:→\ 

" lua require'nvim-treesitter.configs'.setup { highlight = { enable = false } }

let mapleader = ","
nmap <Leader>s :source ~/.config/nvim/init.vim<cr>
nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

map <C-l> :set spell! spelllang=en_us<cr>

nnoremap <leader>o :!tmux splitw -h -p 30 -c $(pwd)<CR><C-L>
nnoremap <leader>t :!tmux send-keys -t 1 C-c<CR><C-L>
