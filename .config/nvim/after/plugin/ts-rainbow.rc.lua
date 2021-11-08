require "nvim-treesitter.configs".setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "#FFF9B6",
      "#88E0EF",
      "#FFA6D5",
      "#FF865E",
      "#77D970"
    } -- table of hex strings
  }
}
