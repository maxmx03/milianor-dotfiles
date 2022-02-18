local status1, nvim_lsp = pcall(require, "lspconfig")
local config = require "Lspconfig"
local status2, dartls = pcall(require, "flutter-tools")

if (not status1) and (not status2) then
  return
end

local on_attach = function(client, bufnr)
  config:on_attach(client, bufnr)
  config:additionals()
end

local sumneko_root_path = vim.fn.stdpath("cache") .. "/nlua/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin" .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  "pylsp",
  "tsserver",
  "eslint",
  "sumneko_lua",
  "intelephense",
  "cssls",
  "vuels",
  "jsonls",
  "solargraph",
  "vimls",
  "rust_analyzer"
}
for _, lsp in ipairs(servers) do
  if (lsp == "sumneko_lua") then
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150
      },
      -- on_attach = my_custom_on_attach,
      capabilities = capabilities,
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "Lua 5.4",
            -- Setup your lua path
            path = runtime_path
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {"vim"}
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true)
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false
          }
        }
      }
    }
  else
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150
      },
      -- on_attach = my_custom_on_attach,
      capabilities = capabilities
    }
  end
end

nvim_lsp.html.setup {
  on_attach = on_attach,
  filetypes = {"html", "htmldjango"},
  flags = {
    debounce_text_changes = 150
  },
  -- on_attach = my_custom_on_attach,
  capabilities = capabilities
}

nvim_lsp.vuels.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  capabilities = capabilities,
  init_options = {
    config = {
      vetur = {
        ignoreProjectWarning = true,
        format = {
          enable = true,
          defaultFormatter = {
            css = "prettier",
            js = "prettier",
            ts = "prettier",
            sass = "prettier",
            scss = "prettier",
            less = "prettier"
          },
          options = {
            tabSize = 2
          }
        }
      }
    }
  }
}

dartls.setup {
  widget_guides = {
    enabled = true
  },
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
    }
  }
}
