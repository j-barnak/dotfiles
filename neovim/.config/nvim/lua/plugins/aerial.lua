require('telescope').load_extension('aerial')
require('aerial').setup({
    close_on_select = true,
})
vim.keymap.set('n', '<leader>d', '<cmd>AerialToggle<CR>')
vim.keymap.set('n', '<leader>a', '<cmd>Telescope aerial<CR>')
