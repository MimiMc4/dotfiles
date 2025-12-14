vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use ('mbbill/undotree')
  --use ('tpope/vim-fugitive')
  use ('ThePrimeagen/vim-be-good')
  use ('RRethy/vim-illuminate')
  use ('lewis6991/gitsigns.nvim')
  use ('kdheepak/lazygit.nvim')
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons',
      },
  }
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          --- Gestor de instalaciones (para instalar clangd automáticamente)
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          --- Soporte LSP
          {'neovim/nvim-lspconfig'},

          --- Autocompletado (el menú desplegable)
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }
  end)
