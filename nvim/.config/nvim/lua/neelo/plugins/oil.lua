return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    default_file_explorer = true,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { '<leader>-', ':Oil<CR>', desc = "Oil" },
  },
};
