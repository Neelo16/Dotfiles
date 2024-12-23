return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  keys = {
    { "<leader>gr", "<cmd>GoRename<CR>",  desc = "Rename variable" },
    { "<leader>gi", "<cmd>GoImports<CR>", desc = "GoImports" },
  },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
