if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
" Emmet - HTML
Plug 'mattn/emmet-vim'

" Import size
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }


if has("nvim")
  " Color theme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

  " General
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'mhartington/formatter.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  "AutoCompletion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " Lsp-Kind
  Plug 'onsails/lspkind-nvim'

  "Diagnostics
  Plug 'folke/trouble.nvim'

  " LuaSnip
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Snippets for LuaSnip
  Plug 'rafamadriz/friendly-snippets'
endif

call plug#end()
