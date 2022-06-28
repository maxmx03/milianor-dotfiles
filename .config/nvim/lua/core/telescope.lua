local telescope = require 'telescope'

telescope.setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git', '.next', 'build', 'dist', 'android', 'ios' },
    prompt_prefix = ' ',
  },
}
