return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "loctvl842/monokai-pro.nvim" },
  opts = {
    options = {
      icons_enabled = true,
      theme = "monokai-pro",
    },
    sections = {
      lualine_a = {
        {
          "filename",
          path = 1,
        }
      },
    },
  }
}
