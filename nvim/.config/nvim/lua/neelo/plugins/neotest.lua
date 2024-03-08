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
      { "<leader>ts", function() neotest.run.run() end,                   desc = "Run single test" },
      { "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, desc = "Run tests in file" },
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
