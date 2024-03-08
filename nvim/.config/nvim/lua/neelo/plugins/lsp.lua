return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = { "folke/neodev.nvim" },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, buffnr)
        local opts = function(desc)
          return { desc = desc, buffer = buffnr, remap = false }
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Definition"))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Implementation"))
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts("References"))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Documentation"))

        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts("Workspace symbols"))
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts("Diagnostics"))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts("Next diagnostic"))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts("Previous diagnostic"))

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
        vim.keymap.set("n", "<leader>vs", vim.lsp.buf.signature_help, opts("Signature help"))

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts("Format"))

        lsp_zero.buffer_autoformat()
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        handlers = {
          lsp_zero.default_setup,
        }
      })
    end,
  },
  "neovim/nvim-lspconfig",

  "hrsh7th/cmp-nvim-lsp",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = nil,
          ["<S-Tab>"] = nil,
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        })
      })

      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "saadparwaiz1/cmp_luasnip",
}
