return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  keys = {
    { "<leader>n", vim.cmd.NvimTreeFindFileToggle, desc = "Toggle file tree" },
  },
  opts = {
    sync_root_with_cwd = true,
  },
  config = function(_, opts)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup(opts)
  end
}
