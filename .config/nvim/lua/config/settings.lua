vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.updatetime = 300
vim.opt.pumheight = 20
vim.opt.foldmethod = 'marker'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'cache' .. '/undo'
vim.opt.clipboard = 'unnamedplus'
vim.o.termguicolors = true
vim.g.python3_host_prog = '/usr/bin/python3.10'

vim.cmd [[
  if has('python')
    set pyx=2
  elseif has('python3') 
    set pyx=3
  endif
]]
