local status, formatter = pcall(require, "formatter")

if (not status) then
  return
end

local M = {}

function M.filename()
  return vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
end

function M:prettier()
  return {
    function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", self.filename()},
        stdin = true
      }
    end
  }
end

function M.luafmt()
  return {
    function()
      return {
        exe = "luafmt",
        args = {"--indent-count", 2, "--stdin"},
        stdin = true
      }
    end
  }
end

function M:autopep8()
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
end

function M:black()
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
end

function M:bladefmt()
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
end

function M:setup(formatters)
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

return M
