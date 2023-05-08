return {
    "windwp/nvim-autopairs",
    -- Attempt at autopair | delete this @ begin
    config = function()
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end,
    -- @ end
}
