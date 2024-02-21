return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>n", vim.cmd.NvimTreeFindFileToggle },
  },
  config = function(_, opts)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup(opts)
  end
}
