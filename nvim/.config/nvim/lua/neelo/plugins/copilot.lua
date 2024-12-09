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
    },
    keys = function()
      return {
        {
          "<leader>ccp",
          function()
            local actions = require("CopilotChat.actions")
            require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
          end,
          desc = "Copilot project files",
          mode = { "n", "v" },
        },
      }
    end,
  },
}
