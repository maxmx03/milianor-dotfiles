require "nvim-treesitter.install".compilers = {"gcc", "clang"}

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
    disable = {"html"},
    colors = {
      "#9ece6a",
      "#e0af68",
      "#f7768e",
      "#bb9af7",
      "#7dcfff",
      "#c0baf5"
    } -- table of hex strings
  }
}
