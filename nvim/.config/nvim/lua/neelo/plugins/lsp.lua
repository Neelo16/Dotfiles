return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requirements = { "nvim-telescope/telescope.nvim" },
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
        vim.keymap.set("n", "<leader>vds", vim.lsp.buf.document_symbol, opts("Workspace symbols"))
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts("Diagnostics"))
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_prev() })
          end,
          opts("Previous diagnostic"))
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_next() })
        end, opts("Next diagnostic"))

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
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
  "neovim/nvim-lspconfig"
}
