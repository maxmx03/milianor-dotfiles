local null_ls = require 'null-ls'

local sources = function(formattings, diagnostics)
  local formatting = null_ls.builtins.formatting
  local diagnostic = null_ls.builtins.diagnostics
  local s = {}

  for _, format in ipairs(formattings) do
    table.insert(s, formatting[format])
  end

  for _, diag in ipairs(diagnostics) do
    table.insert(s, diagnostic[diag])
  end

  return s
end

null_ls.setup {
  debug = false,
  sources = sources(user.formattings, user.diagnostics),
}
