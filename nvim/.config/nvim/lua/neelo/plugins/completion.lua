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
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
      config = function(_, opts)
        local ls = require("luasnip")
        ls.setup(opts)
        ls.config.set_config {
          history = false,
          updateevents = "TextChanged,TextChangedI",
        }

        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
          loadfile(ft_path)()
        end
      end,
      keys = function()
        local ls = require("luasnip")
        return {
          {
            "<C-k>",
            function()
              if ls.expand_or_jumpable() then
                return ls.expand_or_jump()
              end
            end,
            mode = { "i", "s" },
            desc = "Jump to next in snippet",
          },
          {
            "<C-j>",
            function()
              if ls.jumpable(-1) then
                ls.jump(-1)
              end
            end,
            mode = { "i", "s" },
            desc = "Jump to previous in snippet",
          },
        }
      end
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
  },
}
