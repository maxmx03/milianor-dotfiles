M = {}

M.set_autocmd = vim.api.nvim_create_autocmd

M.keymap = function(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, ':' .. rhs .. '<cr>', opts or { noremap = true, silent = true })
end

return M
