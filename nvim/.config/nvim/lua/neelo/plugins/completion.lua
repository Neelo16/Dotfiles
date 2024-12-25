return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")

    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    require('lspkind').init {}
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm { behavior = cmp.SelectBehavior.Insert, select = true },
          { "i", "c" }
        ),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      })
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
  dependencies = {
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
  },
}
