return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>ps',
            function()
                builtin.grep_string({ search = vim.fn.input(" Grep > ") })
            end)
    end
}
