return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = 'dark',
        termcolors = true,
        code_style = {
            types = "NONE",
            methods = "NONE",
            numbers = "NONE",
            constants = "NONE",
            operators = "NONE",
            parameters = "NONE",
            conditionals = "NONE",
            virtual_text = "NONE",
            comments = 'NONE',
            keywords = 'NONE',
            functions = 'NONE',
            strings = 'NONE',
            variables = 'NONE'
        },
    },
    config = function()
        -- load the colorscheme here
        require('onedark').load()
    end,
}
