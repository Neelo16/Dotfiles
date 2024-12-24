return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = function()
    local telescope = require("telescope.builtin")
    return {
      { "<leader>pf", function() telescope.find_files() end, desc = "Telescope project files" },
      { "<C-p>",      function() telescope.git_files() end,  desc = "Telescope git files" },
      { "<leader>ps", function() telescope.live_grep() end,  desc = "Telescope live grep" },
      { "<leader>fh", function() telescope.help_tags() end,  desc = "Telescope search help" },
    }
  end
}
