local formatter = require("formatter")

Formatter = {
  filename = function()
    return vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
  end,
  prettier = function(self)
    return {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", self.filename()},
          stdin = true
        }
      end
    }
  end,
  luafmt = function()
    return {
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
  end,
  autopep8 = function(self)
    return {
      function()
        return {
          exe = "autopep8",
          args = {
            "--in-place --aggressive --aggressive",
            self.filename()
          },
          stdin = false
        }
      end
    }
  end,
  black = function(self)
    return {
      function()
        return {
          exe = "black",
          args = {
            "--stdin-filename",
            self.filename()
          },
          stdin = false
        }
      end
    }
  end,
  bladefmt = function(self)
    return {
      function()
        return {
          exe = "blade-formatter",
          args = {
            "--write",
            "--stdin",
            self.filename()
          },
          stdin = true
        }
      end
    }
  end,
  setup = function(self, formatters)
    local filetype = {}

    for file, fmt in pairs(formatters) do
      if fmt == "luafmt" then
        filetype[file] = self.luafmt()
      elseif fmt == "autopep8" then
        filetype[file] = self:autopep8()
      elseif fmt == "black" then
        filetype[file] = self:black()
      elseif fmt == "bladefmt" then
        filetype[file] = self:bladefmt()
      else
        filetype[file] = self:prettier()
      end
    end

    formatter.setup {
      filetype = filetype
    }
  end
}

Formatter:setup {
  lua = "luafmt",
  python = "black",
  htmldjango = "prettier",
  javascript = "prettier",
  javascriptreact = "prettier",
  typescript = "prettier",
  typescriptreact = "prettier",
  html = "prettier",
  css = "prettier",
  scss = "prettier",
  less = "prettier",
  json = "prettier",
  markdown = "prettier",
  graphql = "prettier",
  prisma = "prettier",
  yaml = "prettier",
  blade = "bladefmt"
}
