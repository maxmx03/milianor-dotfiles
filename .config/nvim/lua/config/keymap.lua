local keymap = require('utils').keymap

-- QUIT
keymap('n', '<space>q', 'quit')

-- QUIT NEOVIM
keymap('n', '<F3>', 'quitall')

-- NEO-TREE
keymap('n', '<space>e', 'Neotree filesystem toggle')

-- TELESCOPE
keymap('n', '<space>ff', 'Telescope find_files')
keymap('n', '<space>fg', 'Telescope live_grep')

-- TABLINE
keymap('n', '<C-Right>', 'TablineBufferNext')
keymap('n', '<C-Left>', 'TablineBufferPrevious')
keymap('n', '<C-x>', 'bd')

-- LSPSAGA
keymap('n', '<space>sr', 'Lspsaga rename')
keymap('n', '<space>sa', 'Lspsaga code_action')
keymap('n', '<space>sk', 'Lspsaga hover_doc')
keymap('n', '<space>sh', 'Lspsaga signature_help')
keymap('n', '<space>sl', 'Lspsaga show_line_diagnostics')

-- PACKER
keymap('n', '<space>pp', 'PackerSync')

-- GIT
keymap('n', '<space>gd', 'DiffviewOpen')
keymap('n', '<space>gc', 'DiffviewClose')

-- HOP
keymap('n', 's', 'HopPattern')
keymap('n', 'f', 'HopWord')

-- COMMENT
local opt = { expr = true, remap = true }

vim.keymap.set(
  'n',
  '<space>cc',
  "v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'",
  opt
)

vim.keymap.set('x', '<space>cc', '<Plug>(comment_toggle_linewise_visual)')
