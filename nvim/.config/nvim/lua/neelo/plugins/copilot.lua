return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = false },
      filetypes = {
        yaml = true,
        markdown = true,
        help = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim",        branch = "master" },
    },
    build = "make tiktoken",
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatLoad",
      "CopilotChatModels",
      "CopilotChatAgents",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatCommit",
    },
    opts = {
      highlight_headers = false,
      separator = '---',
      error_header = '> [!ERROR] Error',
      model = 'gpt-4o-mini',
    },
    keys = function()
      return {
        {
          "<leader>ccp",
          function()
            local chat = require("CopilotChat")
            chat.select_prompt()
          end,
          desc = "Copilot Chat Actions",
          mode = { "n", "v" },
        },
        {
          "<leader>ccc",
          ":CopilotChat<CR>",
          desc = "Copilot Chat",
          mode = { "n", "v" },
        }
      }
    end,
  },
}
