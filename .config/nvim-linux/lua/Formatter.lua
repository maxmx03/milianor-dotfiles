local status, formatter = pcall(require, "formatter")

if (not status) then
  return
end

local M = {}

function M.filename()
  return vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
end

function M.foldername()
  return vim.fn.fnameescape(vim.fn.getcwd())
end

function M:prettier()
  local config = {
    function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", self.filename()},
        stdin = true
      }
    end
  }

  return config, "prettier"
end

function M.luafmt()
  local config = {
    function()
      return {
        exe = "luafmt",
        args = {"--indent-count", 2, "--stdin"},
        stdin = true
      }
    end
  }

  return config, "luafmt"
end

function M:autopep8()
  local config = {
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

  return config, "autopep8"
end

function M:black()
  local config = {
    function()
      return {
        exe = "python3 -m black",
        args = {
          "--stdin-filename",
          self.filename()
        },
        stdin = false
      }
    end
  }

  return config, "black"
end

function M:bladefmt()
  local config = {
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

  return config, "bladefmt"
end

function M:setup(formatters)
  local filetype = {}

  for file, fmt in pairs(formatters) do
    local config, name = self[fmt](self)

    if fmt == name then
      filetype[file] = config
    end
  end

  formatter.setup {
    filetype = filetype
  }
end

return M
