return {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
        vim.keymap.set('', 'f', function()
            require('hop').hint_char1({
                direction = require('hop.hint').HintDirection.AFTER_CURSOR,
                current_line_only = false
            })
        end, { remap = true })
        vim.keymap.set('', 'F', function()
            require('hop').hint_char1({
                direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
                current_line_only = false
            })
        end, { remap = true })
        vim.keymap.set('', 't', function()
            require('hop').hint_char1({
                direction = require('hop.hint').HintDirection.AFTER_CURSOR,
                current_line_only = true,
                hint_offset = -1
            })
        end, { remap = true })
        vim.keymap.set('', 'T', function()
            require('hop').hint_char1({
                direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
                current_line_only = true,
                hint_offset = 1
            })
        end, { remap = true })
    end
}
