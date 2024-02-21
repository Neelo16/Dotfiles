local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "loctvl842/monokai-pro.nvim",
  config = function(_, opts)
    require("monokai-pro").setup(opts)
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("monokai-pro")
  end,
  opts = {
    terminal_colors = true,
  },
}

require("lazy").setup(plugins, {})
