local success = pcall(function()
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
  require 'core.dashboard'
  require 'core.winbar'
end)

if success then
  local onedarkpro, colors = require('utils').get_theme()

  onedarkpro.setup {
    options = {
      transparency = user.transparency,
    },
    hlgroups = {
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeDirectoryIcon = { fg = colors.blue },
      NeoTreeRootName = {
        fg = colors.blue,
      },
    },
  }
  onedarkpro.load()
  vim.cmd(string.format('colorscheme %s', user.colorscheme))
else
  vim.cmd 'colorscheme slate'
end
