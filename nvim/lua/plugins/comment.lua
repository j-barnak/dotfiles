local comment = require('Comment')
local keymap_overrides = {
    toggler = { line = '<leader>cc', block = '<leader>bc' },
    opleader = { line = '<leader>c', block = '<leader>b' },
    extra = { above = '<leader>cO', below = '<leader>co', eol = '<leader>cA' },
}
comment.setup(keymap_overrides)
