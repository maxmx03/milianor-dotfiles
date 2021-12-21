local formatter = require("formatter")

local filename = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))

local function python_formatter()
  return {
    exe = "autopep8",
    args = {
      "--in-place --aggressive --aggressive",
      filename
    },
    stdin = false
  }
end

local function blade_formatter()
  return {
    exe = "blade-formatter",
    args = {
      "--write",
      "--stdin",
      filename
    },
    stdin = true
  }
end

formatter.setup(
  {
    filetype = {
      python = {
        python_formatter
      },
      blade = {
        blade_formatter
      }
    }
  }
)
