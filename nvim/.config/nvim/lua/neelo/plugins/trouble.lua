return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = function()
    local trouble = require("trouble");
    return {
      { "<leader>vtt", function() trouble.toggle() end,                        desc = "Toggle trouble" },
      { "<leader>vtw", function() trouble.toggle("workspace_diagnostics") end, desc = "Worskspace diagnostics" },
      { "<leader>vtd", function() trouble.toggle("document_diagnostics") end,  desc = "Document diagnostics" },
      { "<leader>vtq", function() trouble.toggle("quickfix") end,              desc = "Quickfixes" },
      { "<leader>vtl", function() trouble.toggle("loclist") end,               desc = "Location list" },
      { "gR",          function() trouble.toggle("lsp_references") end,        desc = "LSP references" },
    }
  end,
  opts = {},
}
