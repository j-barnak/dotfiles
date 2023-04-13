require('aerial').setup()
require('telescope').load_extension('aerial')
vim.keymap.set('n', '<leader>a', '<cmd>Telescope aerial<CR>')
