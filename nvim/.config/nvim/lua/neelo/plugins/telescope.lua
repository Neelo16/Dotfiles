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
    { 'zschreur/telescope-jj.nvim' },
  },
  keys = function()
    local telescope = require("telescope.builtin")

    local vcs_picker = function(opts)
      local jj_pick_status, jj_res = pcall(require("telescope").extensions.jj.files, opts)
      if jj_pick_status then
        return
      end

      local git_files_status, git_res = pcall(telescope.git_files, opts)
      if not git_files_status then
        error("Could not launch jj/git files: \n" .. jj_res .. "\n" .. git_res)
      end
    end

    return {
      { "<leader>pf", function() telescope.find_files() end,                                  desc = "Telescope project files" },
      { "<C-p>",      vcs_picker,                                                             desc = "Telescope git files" },
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
    telescope.load_extension("jj")
  end,
}
