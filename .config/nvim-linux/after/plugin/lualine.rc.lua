local status, lualine = pcall(require, "lualine")

if (not status) then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "dracula",
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
