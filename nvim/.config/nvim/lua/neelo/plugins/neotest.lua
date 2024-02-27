return { 
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },
  keys = function()
    local neotest = require("neotest")

    return {
      { "<leader>ts", function() neotest.run.run() end },
      { "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end },
    }
  end,
  opts = function()
    return {
      adapters = {
        require("neotest-rspec")
      },
    }
  end
}
