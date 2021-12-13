require("bufferline").setup {}

vim.api.nvim_exec([[
nnoremap <silent>b] :BufferLineCycleNext<CR>
nnoremap <silent>b[ :BufferLineCyclePrev<CR>
]], true)
