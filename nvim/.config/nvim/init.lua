require('plugins')
require('custom.keys')
require('custom.lsp')
require('custom.line')
require('custom.tabs')
require('custom.telescope')
require('custom.treesitter')
require('custom.discord')
require('custom.null_ls')

vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.autoindent = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.showmatch = true
vim.opt.showtabline = 2
vim.opt.showmode = false

vim.opt.list = true
vim.o.listchars = 'space:·,tab:→ '

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})


local onedark = require('onedark')
onedark.setup {
  style = 'cool',
  transparent = true,
  code_style = {
    comments = 'italic',
    keywords = 'italic',
    functions = 'italic',
    strings = 'none',
    variables = 'none'
  },
  colors = {
    nontext = "#fff000"
  },
  lualine = {
    transparent = true,
  },
}
onedark.load()
