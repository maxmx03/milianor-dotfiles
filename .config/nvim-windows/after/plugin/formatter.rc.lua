require("formatter").setup(
  {
    filetype = {
      lua = {
        --luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      python = {
        -- autopep8
        function()
          return {
            exe = "python3 -m autopep8",
            args = {
              "--in-place --aggressive --aggressive",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
            },
            stdin = false
          }
        end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      typescript = {
        -- prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      javascriptreact = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      typescriptreact = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      json = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      css = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      scss = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      markdown = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      graphql = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      prisma = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      yaml = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      html = {
        --prettier
        function()
          return {
            exe = "npx prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      php = {
        function()
          return {
            exe = "npx prettier",
            args = {
              "--stdin-filepath",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              "--single-quote"
            },
            stdin = true
          }
        end
      },
      blade = {
        function()
          return {
            exe = "npx prettier",
            args = {
              "--stdin-filepath",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              "--single-quote"
            },
            stdin = true
          }
        end
      }
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.scss,*.graphql,*.prisma,*.markdown,*.yaml,*.html,*.py,*.lua,*.php, FormatWrite
augroup END
]],
  true
)
