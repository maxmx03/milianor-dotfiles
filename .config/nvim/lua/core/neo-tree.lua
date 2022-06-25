local neotree = require 'neo-tree'

neotree.setup {
  window = {
    position = ide.position,
    mappings = {
      ['<space>'] = '',
    },
  },
  default_component_configs = {
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = 'ﰊ',
      default = '',
      highlight = 'NeoTreeFileIcon',
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true,
      hide_by_name = {
        'node_modules',
      },
    },
  },
}
