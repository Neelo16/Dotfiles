return {
  'github/copilot.vim',
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "github/copilot.vim" },                              -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim",        branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                                 -- Only on MacOS or Linux
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
