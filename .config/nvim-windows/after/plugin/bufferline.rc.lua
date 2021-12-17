require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    show_close_icon = false
  }
}

vim.api.nvim_exec(
  [[
nnoremap <silent>b] :BufferLineCycleNext<CR>
nnoremap <silent>b[ :BufferLineCyclePrev<CR>
nnoremap <silent>bx :BufferLineCloseLeft<CR>
]],
  true
)
