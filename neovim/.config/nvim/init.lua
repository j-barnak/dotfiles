-- Boostrapped lazy.nvim
-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Need to prepend leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- setup --> init
-- requires --> dependencies
-- as --> name
-- opt --> lazy
-- run --> build
-- lock --> pin
-- disable=true --> enabled = false
-- version='*' --> version='*'
-- after [i] not needed for most -cases.  dependencies otherwise.
-- wants [i] not needed for most -cases.  dependencies otherwise.
-- config don't support string type,  fun(LazyPlugin) instead.
-- module is auto-loaded. No need to specify
-- keys spec is different

require('lazy').setup('plugins')
