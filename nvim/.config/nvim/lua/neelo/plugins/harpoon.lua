return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    }
  },
  keys = function()
    local harpoon = require("harpoon")

    return {
      { "<leader>ha", function() harpoon:list():append() end,                      desc = "Add to harpoon" },
      { "<leader>hd", function() harpoon:list():remove() end,                      desc = "Remove from harpoon" },
      { "<leader>hv", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "View harpoon menu" },

      { "<C-h>",      function() harpoon:list():select(1) end },
      { "<C-j>",      function() harpoon:list():select(2) end },
      { "<C-k>",      function() harpoon:list():select(3) end },
      { "<C-l>",      function() harpoon:list():select(4) end },

      { "<C-S-P>",    function() harpoon:list():prev() end },
      { "<C-S-N>",    function() harpoon:list():next() end },
    }
  end,
}
