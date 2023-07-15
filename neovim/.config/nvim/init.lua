-- TODO:
-- - Add back Telescope undo Lua
-- - Switch null-ls with formatter.nvim or possibly folke's planned solution
-- - Ensure that telescope is integrated well within the lsp ecosystem (e.g., diagnostics views within telescope)
-- - Switch <leader>s for something better
-- - Add split functionality. Maybe use `<leader>p` to split and then have
--   <C-h/j/k/l> to navigate splits

-- Boostrapped lazy.nvim
-- https://github.com/folke/lazy.nvim#-installation
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

-- Need to prepend leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config")
require("lazy").setup("plugins")
