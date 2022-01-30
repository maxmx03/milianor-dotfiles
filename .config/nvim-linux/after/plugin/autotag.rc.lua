local status, autotag = pcall(require, "nvim-ts-autotag")

if (not status) then
  return
end

autotag.setup {
  autotag = {
    enable = true,
    filetypes = {"html", "htmldjango", "xml", "javascriptreact", "typescriptreact", "vue", "markdown"}
  }
}
