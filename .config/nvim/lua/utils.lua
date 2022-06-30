M = {}

M.set_autocmd = vim.api.nvim_create_autocmd

function M.keymap(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, ':' .. rhs .. '<cr>', opts or { noremap = true, silent = true })
end

function M.get_theme()
  local onedarkpro = require 'onedarkpro'
  local colors = onedarkpro.get_colors(vim.g.onedarkpro_style)

  return onedarkpro, colors
end

return M
