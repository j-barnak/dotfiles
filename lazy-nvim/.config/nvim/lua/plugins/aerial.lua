return {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('telescope').load_extension('aerial')
        vim.keymap.set('n', '<leader>dd', '<cmd>AerialToggle<CR>')
        vim.keymap.set('n', '<leader>df', '<cmd>Telescope aerial<CR>')
    end,
}
