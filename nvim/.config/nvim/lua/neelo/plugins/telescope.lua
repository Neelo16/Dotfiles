return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  opts = {},
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local telescope = require("telescope.builtin")
    return {
      { "<leader>pf", function() telescope.find_files() end },
      { "<C-p>",      function() telescope.git_files() end },
      { "<leader>ps", function() telescope.live_grep() end },
      { "<leader>fh", function() telescope.help_tags() end },
    }
  end
}
