local success, error = pcall(function()
  require 'core.impatient'
  require 'core.null-ls'
  require 'core.cmp'
  require 'core.lsp-signature'
  require 'core.lsp-saga'
  require 'core.lsp-installer'
  require 'core.lsp'
  require 'core.web-devicons'
  require 'core.treesitter'
  require 'core.neo-tree'
  require 'core.telescope'
  require 'core.lualine'
  require 'core.tabline'
  require 'core.autotag'
  require 'core.autopairs'
  require 'core.colorizer'
  require 'core.diffview'
  require 'core.indent_blankline'
  require 'core.comment'
  require 'core.hop'
  require 'core.winbar'
end)

if success then
  vim.cmd(string.format('colorscheme %s', ide.colorscheme))
else
  vim.cmd 'colorscheme slate'
end
