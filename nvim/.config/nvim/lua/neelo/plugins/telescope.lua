return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  opts = function()
    local themes = require("telescope.themes")
    return {
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown {}
        }
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  keys = function()
    local telescope = require("telescope.builtin")
    return {
      { "<leader>pf", function() telescope.find_files() end,                                  desc = "Telescope project files" },
      { "<C-p>",      function() telescope.git_files() end,                                   desc = "Telescope git files" },
      { "<leader>ps", function() telescope.live_grep() end,                                   desc = "Telescope live grep" },
      { "<leader>fh", function() telescope.help_tags() end,                                   desc = "Telescope search help" },
      { "<leader>en", function() telescope.find_files { cwd = vim.fn.stdpath("config") } end, desc = "Telescope nvim config files" },
      {
        "<leader>er",
        function()
          telescope.find_files { cwd = vim.env.HOME .. "/Repos", find_command = { "ls" } }
        end,
        desc = "Telescope repos"
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    telescope.load_extension('fzf')
    telescope.load_extension("ui-select")
  end,
}
