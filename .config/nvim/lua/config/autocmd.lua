local set_autocmd = require('utils').set_autocmd

set_autocmd({ 'BufWinEnter' }, {
  callback = function()
    vim.cmd 'set formatoptions-=cro'
  end,
})

set_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*.*',
  callback = function()
    vim.cmd 'update'
  end,
})

set_autocmd({'UIEnter'}, {
  callback = function ()
    vim.cmd 'Neotree show'
  end
})
