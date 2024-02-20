  return {
    "loctvl842/monokai-pro.nvim",
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd.colorscheme("monokai-pro")
    end,
    opts = {
      terminal_colors = true,
      devicons = true,
    },
  }
