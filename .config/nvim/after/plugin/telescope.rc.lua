require("telescope").setup {
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
}

vim.api.nvim_exec([[
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
  ]], true)
