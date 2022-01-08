local nvim_lsp = require "lspconfig"
local lspsignature = require "lsp_signature"

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  local signs = {Error = "", Warn = "", Hint = "", Info = "", Prefix = ""}

  vim.diagnostic.config(
    {
      virtual_text = {
        prefix = signs.Prefix,
        source = true
      }
    }
  )

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
  end

  if client.name == "eslint" then
    vim.api.nvim_command [[nnoremap <C-f> :EslintFixAll<CR> :update<CR>]]
  end

  if client.name ~= "intelephense" and client.name ~= "vuels" then
    client.resolved_capabilities.document_formatting = false
  else
    client.resolved_capabilities.document_formatting = true
  end

  vim.api.nvim_command [[set ff=unix]]

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
    vim.api.nvim_command [[autocmd BufWritePost *.blade.php FormatWrite]]
  else
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> FormatWrite]]
    vim.api.nvim_command [[augroup END]]
  end

  lspsignature.on_attach(
    {
      bind = true,
      handler_opts = {
        border = "rounded"
      },
      auto_close_after = 1
    },
    bufnr
  )
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local langservers_root = "C:/Users/maxma/.config/langservers"
local sumneko_root_path = langservers_root .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  "pyright",
  "tsserver",
  "eslint",
  "sumneko_lua",
  "intelephense",
  "cssls",
  "jsonls"
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
            version = "LuaJIT",
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
