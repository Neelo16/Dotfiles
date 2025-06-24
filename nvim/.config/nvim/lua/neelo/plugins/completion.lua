return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'normal',
    },
    completion = {
      documentation = { auto_show = true },
    },
    sources = {
      default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
        lua = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        }
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "folke/lazydev.nvim",                   ft = { 'lua' },                   lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    { "fang2hou/blink-copilot" },
  },
}
