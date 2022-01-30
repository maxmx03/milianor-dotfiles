require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    show_close_icon = false,
    max_name_length = 10
  }
}

vim.api.nvim_command [[nnoremap <silent>b] :BufferLineCycleNext<CR>]]
vim.api.nvim_command [[nnoremap <silent>b[ :BufferLineCyclePrev<CR>]]
vim.api.nvim_command [[nnoremap <silent>bx :BufferLinePickClose<CR>]]
vim.api.nvim_command [[nnoremap <silent>bl :BufferLineCloseLeft<CR>]]
vim.api.nvim_command [[nnoremap <silent>br :BufferLineCloseRight<CR>]]
