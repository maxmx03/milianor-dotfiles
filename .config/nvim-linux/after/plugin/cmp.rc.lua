local status1, luasnip = pcall(require, "luasnip")
local status2, cmp = pcall(require, "cmp")
local status3, lspkind = pcall(require, "lspkind")
require("luasnip/loaders/from_vscode").lazy_load()

if (not status1) and (not status2) and (not status3) then
  return
end

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
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
    ),
    ["<CR>"] = cmp.mapping.confirm({select = false})
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
    format = lspkind.cmp_format({width_text = true, maxwidth = 50})
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
