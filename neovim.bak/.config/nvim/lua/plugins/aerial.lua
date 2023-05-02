require('telescope').load_extension('aerial')
require('aerial').setup({
    layout = {
        max_width = { 40, 0.24 },
        width = nil,
        min_width = 10,
    },
    close_on_select = true,
})

vim.keymap.set('n', '<leader>dd', '<cmd>AerialToggle<CR>')
vim.keymap.set('n', '<leader>df', '<cmd>Telescope aerial<CR>')
