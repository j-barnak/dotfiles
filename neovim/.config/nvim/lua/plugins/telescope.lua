return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end,
        },
        keys = {
            {
                '<leader>ff',
                '<cmd>Telescope find_files<CR>',
                desc = 'Find Files'
            },
            {
                '<leader>g',
                '<cmd> Telescope live_grep<CR>',
                desc = 'Grep all files',
            },
            {
                '<leader>fr',
                '<cmd>Telescope oldfiles<cr>',
                desc = 'Find recent files',
            },
            {
                '<leader>fp',
                '<cmd>Telescope git_files<cr>',
                desc = 'Find git files',
            },
        },
    },
}
