require "nvim-treesitter.install".compilers = {"gcc"}

require "nvim-treesitter.configs".setup {
  ensure_installed = {
    "c",
    "lua",
    "javascript",
    "tsx",
    "json",
    "css",
    "scss",
    "graphql",
    "html",
    "markdown",
    "php",
    "prisma",
    "python",
    "regex",
    "vue",
    "vim",
    "yaml",
    "typescript",
    "turtle",
    "jsdoc",
    "json5"
  },
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
      "#9ece6a",
      "#e0af68",
      "#f7768e",
      "#bb9af7",
      "#7dcfff",
      "#c0baf5"
    } -- table of hex strings
  }
}
