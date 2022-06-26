require 'config.init'
require 'plugins'

ide = {}
ide.colorscheme = 'solarized'
ide.position = 'bottom'
ide.colorscheme = 'solarized'
ide.formattings = {
  'prettier',
  'stylua',
}
ide.diagnostics = {
  'eslint',
}
ide.langs = {
  'bash',
  'c',
  'c_sharp',
  'cpp',
  'css',
  'dart',
  'fish',
  'go',
  'graphql',
  'html',
  'java',
  'javascript',
  'json',
  'kotlin',
  'lua',
  'markdown',
  'php',
  'prisma',
  'python',
  'regex',
  'scss',
  'svelte',
  'tsx',
  'typescript',
  'vim',
  'vue',
  'yaml',
}
ide.servers = {
  'pylsp',
  'tsserver',
  'sumneko_lua',
  'prismals',
  'graphql',
  'cssls',
  'html',
  'vuels',
  'volar',
  'emmet_ls',
  'tailwindcss',
  'svelte',
}
vim.g.transparent_background = true
