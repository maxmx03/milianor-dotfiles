local status = pcall(require, "nvim-treesitter")

if (not status) then
  return
end

require "nvim-treesitter.install".compilers = {"gcc"}

require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    disable = {"html", "php"},
    colors = {
      "#e0af68",
      "#bb9af7",
      "#7dcfff",
      "#f7768e",
      "#a9b1d6"
    } -- table of hex strings
  }
}
