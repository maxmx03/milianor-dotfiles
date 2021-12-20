-- luasnip setup
local luasnip = require "luasnip"
-- nvim-cmp setup
local cmp = require "cmp"
-- lspkind
local lspkind = require "lspkind"
-- friendly snippets
require("luasnip/loaders/from_vscode").lazy_load()

vim.api.nvim_command [[set completeopt=menu,menuone,noselect ]]

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    ["<C-t>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
    ),
    ["<CR>"] = cmp.mapping.confirm({select = true})
  },
  sources = cmp.config.sources(
    {
      {name = "nvim_lsp"},
      {name = "luasnip"}
    },
    {
      {name = "buffer"}
    }
  ),
  formatting = {
    format = lspkind.cmp_format({with_text = true, maxwidth = 50})
  }
}

cmp.setup.cmdline(
  "/",
  {
    sources = {
      {name = "buffer"}
    }
  }
)

cmp.setup.cmdline(
  ":",
  {
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)
