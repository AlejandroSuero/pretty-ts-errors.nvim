vim.cmd([[set runtimepath=$VIMRUNTIME]])
vim.cmd([[set packpath=/tmp/nvim/lazy/]])

local lazypath = "/tmp/nvim/lazy/lazy.nvim"
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

require("lazy").setup({
  {
    "AlejandroSuero/pretty-ts-errors.nvim",
    config = function()
      require("pretty-ts-errors").setup()
    end,
    lazy = false,
    enabled = true,
  },
})
