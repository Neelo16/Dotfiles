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
    config = function()
      vim.cmd.colorscheme('kanagawa')
    end,
  },
}
