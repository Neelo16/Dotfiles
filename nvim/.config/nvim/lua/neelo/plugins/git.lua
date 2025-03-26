return {
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {
    "juacker/git-link.nvim",
    lazy = true,
    keys = {
      {
        "<leader>gu",
        function() require("git-link.main").copy_line_url() end,
        desc = "Copy code URL to clipboard",
        mode = { "n", "x" }
      },
      {
        "<leader>go",
        function() require("git-link.main").open_line_url() end,
        desc = "Open code URL in browser",
        mode = { "n", "x" }
      },
    },
  }
}
