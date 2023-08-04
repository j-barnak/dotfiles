return {
    'AlexvZyl/nordic.nvim',
    opts = {    
        telescope = {
            style = 'classic',
        }
    },
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        require('nordic').setup(opts)
        require('nordic').load()
    end

}
