local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd.packadd('packer.nvim')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'navarasu/onedark.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    "hrsh7th/nvim-cmp",
    config = [[require('custom.lsp')]],
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
    }
  }
  use 'saadparwaiz1/cmp_luasnip'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use 'folke/todo-comments.nvim'

  use 'rust-lang/rust.vim'
  use "sindrets/diffview.nvim"

  use {
    "NeogitOrg/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function() require("neogit").setup() end
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 100
        }
      })
    end
  }
  
  use 'ray-x/guihua.lua'
  use 'ray-x/go.nvim'

  use 'pantharshit00/vim-prisma'

  use {
    "ellisonleao/glow.nvim",
    config = function() require("glow").setup() end
  }

  use 'andweeb/presence.nvim'
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'williamboman/nvim-lsp-installer'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {
      disable_filetype = { "rust" }
    } end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
