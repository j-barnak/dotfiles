require('aerial').setup({
    close_on_select = true,
})

require('telescope').load_extension('aerial')
vim.keymap.set('n', '<leader>d', '<cmd>AerialToggle<CR>')
vim.keymap.set('n', '<leader>a', '<cmd>Telescope aerial<CR>')
