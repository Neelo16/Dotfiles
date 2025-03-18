return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
      { 'hrsh7th/nvim-cmp' },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1

      local cmp = require('cmp')
      cmp.setup.filetype({ 'sql', 'mysql', 'plsql' }, {
        sources = {
          { name = 'vim-dadbod-completion' },
          { name = 'buffer' },
        }
      })
    end,
  },
}
