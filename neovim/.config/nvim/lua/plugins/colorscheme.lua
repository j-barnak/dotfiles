return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = 'dark',
        termcolors = true,
        code_style = {
            comments = 'none',
            keywords = 'none',
            functions = 'none',
            strings = 'none',
            variables = 'none'
        },
    },
    config = function()
        -- load the colorscheme here
        require('onedark').load()
    end,
}
