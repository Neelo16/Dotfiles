return {
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      terminal_colors = true,
      devicons = true,
      style = "pro",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme('kanagawa')
    end,
    opts = {
      transparent = true,
    }
  },
}
