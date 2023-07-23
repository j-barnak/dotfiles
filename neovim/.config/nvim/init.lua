-- TODO:
-- - Add back Telescope undo Lua
-- - Switch null-ls with formatter.nvim or possibly folke's planned solution
--     - guard.nvim is looking very promising!
-- - Ensure that telescope is integrated well within the lsp ecosystem (e.g., diagnostics views within telescope)
--   - https://github.com/nvim-telescope/telescope.nvim#pickers
-- - Add the ability to disable treesitter for large files
-- - For certain projects, disable the LSP. Remember, there is a format on save, so I'd need to disable this as well
-- - Add a column limit
-- - Telescope has implemented outgoing and incoming calls, so you could replace
--   LSP Saga. Additionally, LSP Saga's only useful feature left is `lsp_finder`; is it worth replacing?
-- - I don't really need nav-buddy or navic

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
