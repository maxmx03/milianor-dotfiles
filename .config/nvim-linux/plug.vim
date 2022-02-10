if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
" Emmet - HTML
Plug 'mattn/emmet-vim'

" Import size
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }

" Syntax
Plug 'jwalton512/vim-blade'

" Dracula
Plug 'dracula/vim', { 'name': 'dracula' }

if has("nvim")
  " General
  Plug 'neovim/nvim-lspconfig'
  Plug 'mhartington/formatter.nvim'
  Plug 'ray-x/lsp_signature.nvim'
  
  " Flutter
  Plug 'akinsho/flutter-tools.nvim'

  " Error Diagnostic
  Plug 'folke/trouble.nvim'

 "AutoCompletion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'tzachar/cmp-tabnine', {'do': './install.sh'}

  " LuaSnip
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Snippets for LuaSnip
  Plug 'rafamadriz/friendly-snippets'
 
  " Visual improvement
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lualine/lualine.nvim'

  " Auto pairs and tag
  Plug 'windwp/nvim-ts-autotag'
  Plug 'windwp/nvim-autopairs'

  " File explorer
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/bufferline.nvim'

  " Git Diffview
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sindrets/diffview.nvim'
endif

call plug#end()
