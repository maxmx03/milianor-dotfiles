local formatter = require("formatter")

local filename = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))

local function prettier_formatter()
  return {
    exe = "npx prettier",
    args = {"--stdin-filepath", filename, "--single-quote"},
    stdin = true
  }
end

local function lua_formatter()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

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
      lua = {
        lua_formatter
      },
      python = {
        python_formatter
      },
      html = {
        prettier_formatter
      },
      htmldjango = {
        prettier_formatter
      },
      css = {
        prettier_formatter
      },
      scss = {
        prettier_formatter
      },
      markdown = {
        prettier_formatter
      },
      graphql = {
        prettier_formatter
      },
      prisma = {
        prettier_formatter
      },
      yaml = {
        prettier_formatter
      },
      blade = {
        blade_formatter
      }
    }
  }
)
