require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {
      "branch",
      {
        "diagnostics",
        symbols = {error = " ", warn = " ", info = " ", hint = " "}
      }
    },
    lualine_c = {"filename"},
    lualine_x = {"fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  }
}
