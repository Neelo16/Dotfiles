return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = function()
    local trouble = require("trouble");
    return {
      { "<leader>vtt", function() trouble.toggle() end,                        desc = "Trouble toggle" },
      { "<leader>vtw", function() trouble.toggle("workspace_diagnostics") end, desc = "Trouble worskspace diagnostics" },
      { "<leader>vtd", function() trouble.toggle("document_diagnostics") end,  desc = "Trouble document diagnostics" },
      { "<leader>vtq", function() trouble.toggle("quickfix") end,              desc = "Trouble quickfixes" },
      { "<leader>vtl", function() trouble.toggle("loclist") end,               desc = "Trouble location list" },
      { "gR",          function() trouble.toggle("lsp_references") end,        desc = "Trouble LSP references" },
    }
  end,
  opts = {},
}
