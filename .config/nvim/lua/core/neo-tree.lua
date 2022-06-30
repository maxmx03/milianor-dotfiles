local neotree = require 'neo-tree'

neotree.setup {
  event_handlers = {
    {
      event = 'file_opened',
      handler = function(file_path)
        neotree.close_all()
      end,
    },
  },
  window = {
    position = user.position,
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
